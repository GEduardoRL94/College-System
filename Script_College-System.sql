USE [master]
GO
/****** Object:  Database [Sistema_Notas_Colegio]    Script Date: 01/12/2017 13:06:49 ******/
CREATE DATABASE [Sistema_Notas_Colegio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sistema_Notas_Colegio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Sistema_Notas_Colegio.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Sistema_Notas_Colegio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Sistema_Notas_Colegio_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sistema_Notas_Colegio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET  MULTI_USER 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Sistema_Notas_Colegio]
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarAlumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 PROCEDURE [dbo].[usp_ActualizarAlumno]
@Id char(3),
@Nom varchar(25),
@Ape_m varchar(25),
@Ape_p varchar(25),
@Tel char(9),
@fec_nac smalldatetime,
@dni char(8)


AS

Update Alumno set Id_Alumno=@Id , Nom_alu = @Nom, Ape_alu_mat=@Ape_m,
Ape_alu_pat=@Ape_p, Tel_alu = @Tel, Fecha_Nacimiento= @fec_nac  ,Dni=@dni
where Id_Alumno=@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarAuxiliar]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 PROCEDURE [dbo].[usp_ActualizarAuxiliar]

@Id char(4),
@Nom_a varchar(25),
@Ape_ma varchar(25),
@Ape_pa varchar(25),
@Tele char(9),
@fec smalldatetime 

AS
Update Auxiliar  set id_Auxiliar =@Id , nom_aux = @Nom_a, ape_aux_mat=@Ape_ma,
ape_aux_pat=@Ape_pa, tel_aux = @Tele, fecha_con=@fec
where id_Auxiliar =@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarCurso]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarCurso]

@Id char(4),
@Nom_curso varchar(25),
@Id_Examen char(3),
@Id_practica char(3),
@Id_grado char(3)

AS
Update Curso  set Id_Curso =@Id , Nom_cur = @Nom_curso,Id_Examen =@Id_Examen,
Id_practica = @Id_practica, Id_grado = @Id_grado
where Id_Curso =@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarDistrito]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarDistrito]
@Id char(3),
@Nom_dis varchar(25),
@id_pro char(3)

AS

Update Distrito set Cod_dis=@Id ,Nom_dis = @Nom_dis, Id_Profesor = @id_pro
where Cod_dis=@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarExamen]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[usp_ActualizarExamen]

@Id char(3),
@fec_exa smalldatetime,
@id_alu char(3),
@id_pro char(3),
@nota_exa tinyint

AS
Update Examen set Id_Examen =@Id , Fec_exa = @fec_exa, Id_Alumno=@id_alu, Id_Profesor = @id_pro, nota_exa = @nota_exa
where  Id_Examen=@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarGrado]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 PROCEDURE [dbo].[usp_ActualizarGrado]
@Id char (3),
@nota tinyint,
@id_alu char(3),
@id_pro char(3),
@salon varchar(40),
@fec_r smalldatetime,
@id_ax char(4)
AS

Update Grado set Id_grado = @Id , Nota_conducta = @nota, Id_Alumno=@id_alu,
Id_Profesor=@id_pro, Salon = @salon, Fec_reg = @fec_r , id_Auxiliar = @id_ax
where Id_grado=@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarPractica]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[usp_ActualizarPractica]

@Id char(3),
@fec_pra smalldatetime,
@id_alu char(3),
@id_pro char(3),
@nota_pra tinyint

AS
Update Practica set Id_practica =@Id , Fec_pra = @fec_pra, Id_Alumno=@id_alu, Id_Profesor = @id_pro, Nota_pra = @nota_pra
where  Id_practica=@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarProfesor]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarProfesor]
@vcod char(3),
@nom varchar(25),
@apempro varchar(25),
@apeppro varchar(25),
@tel char(9),
@tip char(1),
@fec smalldatetime

AS

Update Profesor set Id_Profesor=@vcod , Nom_pro = @nom, Ape_pro_mat=@apempro,
Ape_pro_pat=@apeppro, Tel_pro = @tel, tip_pro = @tip , fec_con=@fec

where Id_Profesor=@vcod

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarAlumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarAlumno] 
@vcod char(3)
as
Select Id_Alumno,Nom_alu,Ape_alu_mat,Ape_alu_pat,Tel_alu, Dni, Fecha_Nacimiento
from Alumno
where Id_Alumno=@vcod

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarAuxiliar]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarAuxiliar] 
@vcod char(4)
as
Select id_Auxiliar,nom_aux,ape_aux_mat,ape_aux_pat,tel_aux,fecha_con
from Auxiliar
where id_Auxiliar=@vcod

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarCurso]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarCurso] 
@Id char(3)
as
Select Id_Curso, Nom_cur, Id_Examen, Id_practica, Id_grado
from Curso
where Id_Curso=@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarDistrito]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarDistrito] 
@vcod char(3)
as
Select Cod_dis, Nom_dis, Id_Profesor
from Distrito
where Cod_dis = @vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarExamen]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarExamen] 
@vcod char(3)
as
Select Id_Examen, Fec_exa, Id_Alumno, Id_Profesor, nota_exa
from Examen
where Id_Examen = @vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarGrado]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarGrado] 
@Id char(3)
as
Select Id_grado,Nota_conducta,Id_Alumno,Id_Profesor,Salon, Fec_reg, id_Auxiliar
from Grado
where Id_grado=@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarPractica]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  Procedure [dbo].[usp_ConsultarPractica] 
@vcod char(3)
as
Select Id_practica, Fec_pra, Id_Alumno, Id_Profesor, Nota_pra
from Practica
where Id_practica = @vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarProfesor]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarProfesor] 
@vcod char(3)
as
Select Id_Profesor,Nom_pro,Ape_pro_mat,Ape_pro_pat,Tel_pro, tip_pro, fec_con
from Profesor
where Id_Profesor=@vcod

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarAlumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarAlumno]
@vcod char(3)
AS
delete from Alumno where Id_Alumno=@vcod

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarAuxiliar]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarAuxiliar]
@vcod char(4)
AS
delete from Auxiliar where id_Auxiliar=@vcod

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCurso]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarCurso]
@Id char(3)
AS
delete from Curso where Id_Curso=@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarDistrito]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarDistrito]
@vcod char(3)
AS
delete from Distrito where Cod_dis=@vcod

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarExamen]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarExamen]
@vcod char(4)
AS
delete from Examen where  Id_Examen=@vcod

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarGrado]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarGrado]
@vcod char(3)
AS
delete from Grado where Id_grado=@vcod

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarPractica]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarPractica]
@Id char(3)
AS
delete from Practica where Id_practica=@Id

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProfesor]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarProfesor]
@vcod char(3)
AS
delete from Profesor where Id_Profesor=@vcod

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarAlumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarAlumno]
@Nom varchar(25),
@Ape_m varchar(25),
@Ape_p varchar(25),
@Tel char(9),
@fec_nac smalldatetime,
@dni char(8)


AS
declare @Id nvarchar(3)
declare @vcont int 
set @vcont=(Select count(*) from Alumno)
if @vcont = 0
          set @Id = 'A01'
 else

		  set @Id=(Select 'A' +Right(Max (Right(Id_Alumno,2)+101),2)
		  from Alumno)

 insert into Alumno values (@Id,@Nom,@Ape_m,@Ape_p,@Tel, @fec_nac, @dni)

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarAuxiliar]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarAuxiliar]
@Nom_a varchar(25),
@Ape_ma varchar(25),
@Ape_pa varchar(25),
@Tele char(9),
@fec smalldatetime 

AS
declare @Id nvarchar(4)
declare @vcont int 
set @vcont=(Select count(*) from  Auxiliar)
if @vcont = 0
          set @Id = 'AX01'
 else

		  set @Id=(Select 'AX' +Right(Max (Right(  id_Auxiliar ,2)+1101),2)
		  from  Auxiliar)

 insert into Auxiliar values (@Id,@Nom_a,@Ape_ma,@Ape_pa,@Tele,@fec)

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarCurso]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarCurso]
@Nom_curso varchar(25),
@Id_Examen char(3),
@Id_Practica char(3),
@Id_Grado char(3)


AS
declare @Id nvarchar(3)
declare @vcont int 
set @vcont=(Select count(*) from Curso)
if @vcont = 0
          set @Id = 'C01'
 else

		  set @Id=(Select 'C' +Right(Max (Right(Id_Curso,2)+101),2)
		  from Curso)

 insert into Curso values (@Id,@Nom_curso,@Id_Examen, @Id_Practica,@Id_Grado)


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarDistrito]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarDistrito]
@Nom_dis varchar(25),
@id_pro char(3)
AS
declare @Id nvarchar(3)
declare @vcont int 
set @vcont=(Select count(*) from Distrito)
if @vcont = 0
          set @Id = 'D01'
 else

		  set @Id=(Select 'D' +Right(Max (Right(Cod_dis,2)+101),2)
		  from Distrito)

 insert into Distrito values (@Id,@Nom_dis,@id_pro)
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarExamen]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarExamen]
@fec_exa smalldatetime, 
@Id_Alumno char(3),
@Id_Profesor char(3),
@nota_exa tinyint
AS
declare @Id nvarchar(3)
declare @vcont int 
set @vcont=(Select count(*) from Examen)
if @vcont = 0
          set @Id = 'E01'
 else

		  set @Id=(Select 'E' +Right(Max (Right(Id_Examen,2)+101),2)
		  from Examen)

 insert into Examen values (@Id,@fec_exa, @Id_Alumno, @Id_Profesor, @nota_exa)

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarGrado]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarGrado]

@nota tinyint,
@id_alu char(3),
@id_pro char(3),
@salon varchar(40),
@fec_r smalldatetime,
@id_ax  char(4)
AS

declare @Id nvarchar(3)
declare @vcont int 
set @vcont=(Select count(*) from  Grado)
if @vcont = 0
          set @Id = 'G01'
 else

		  set @Id=(Select 'G' +Right(Max (Right( Id_grado ,2)+1101),2)
		  from Grado)


insert into Grado values(@Id,@nota,@id_alu,@id_pro,@salon,@fec_r,@id_ax)

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarPractica]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarPractica]
@fec_pra smalldatetime,
@id_alu char(3),
@id_pro char(3),
@nota_pra tinyint
AS
declare @Id nvarchar(3)
declare @vcont int 
set @vcont=(Select count(*) from Practica)
if @vcont = 0
          set @Id = 'N01'
 else

		  set @Id=(Select 'N' +Right(Max (Right( Id_practica ,2)+101),2)
		  from Practica)

 insert into Practica values (@Id,@fec_pra,@id_alu,@id_pro,@nota_pra)
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarProfesor]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarProfesor]
@nom varchar(50),
@apempro varchar(50),
@apeppro varchar(50),
@tel char(9),
@tip char(1),
@fec smalldatetime
AS
declare @vcod char(3)
declare @vcont int
set @vcont=(Select count(*) from Profesor)
if @vcont=0 
       set @vcod ='P01'
else
        set @vcod=(Select 'P' +Right(Max (Right(Id_Profesor,2)+ 101 ),2) 
    From Profesor)
insert into Profesor values(@vcod,@nom,@apempro,@apeppro,@tel,@tip, @fec)

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarAlumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarAlumno]
AS
Select Id_Alumno,Nom_alu,Ape_alu_pat,Ape_alu_mat, Tel_alu, Fecha_Nacimiento, Dni
from Alumno


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarAlumnoGrado]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Consultar
CREATE	 PROCEDURE [dbo].[usp_ListarAlumnoGrado]
@Id_Alumno char (3)
as
select Alumno.Id_Alumno, Nom_alu, Ape_alu_mat, Ape_alu_pat, Nom_pro, Ape_pro_mat, Ape_pro_pat, Grado.Nota_conducta, Nom_alu , ape_aux_mat, ape_aux_pat
 from Alumno left join Grado on Alumno.Id_Alumno = Grado.Id_grado left join Profesor on Grado.Id_Profesor = Profesor.Id_Profesor left join Grado g on Profesor.Id_Profesor = g.Id_grado left join Auxiliar on g.id_Auxiliar = Auxiliar.id_Auxiliar
 where Alumno.Id_Alumno= @Id_Alumno

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarAuxiliar]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarAuxiliar]
AS
Select id_Auxiliar,nom_aux,ape_aux_mat,ape_aux_pat,tel_aux,fecha_con
from Auxiliar

GO
/****** Object:  StoredProcedure [dbo].[usp_listarAuxiliarAlumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_listarAuxiliarAlumno]
@codAx char(4)
as
select Nom_alu, Ape_alu_pat, Ape_alu_mat, Salon from vw_vistaAuxiliarAlumno
where id_Auxiliar = @codAx


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarAuxiliarCombo]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarAuxiliarCombo]
AS
Select id_Auxiliar,nom_aux,ape_aux_mat,ape_aux_pat,tel_aux,fecha_con, (nom_aux+ ' ' + ape_aux_mat+ ' ' + ape_aux_pat)as detalle
from Auxiliar 

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCurso]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 PROCEDURE [dbo].[usp_ListarCurso]
AS
Select Id_Curso,Nom_cur, Id_Examen, Id_practica, Id_grado
from Curso


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarDistrito]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarDistrito]
AS
Select Cod_dis , Nom_dis, Id_Profesor
from Distrito

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarExamen]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarExamen]
AS
Select Id_Examen, Fec_exa, Id_Alumno, Id_Profesor, nota_exa,
Estado = case
            when nota_exa >=13                                 then 'Aprobado'
            when nota_exa < 13                                 then 'Desaprobado'
          end 

from Examen
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarGrado]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarGrado]
AS
Select Id_grado,Nota_conducta,Id_Alumno,id_Auxiliar ,Id_Profesor,Salon, Fec_reg,
Tipo = case
            when Nota_conducta >=16                                  then 'Buen comportamiento'
            when Nota_conducta >11 and Nota_conducta < 16            then 'Regular'
			when Nota_conducta <=11                                  then 'Mal comportamiento'
          end 
from Grado

GO
/****** Object:  StoredProcedure [dbo].[usp_listarNotasconducta]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 procedure [dbo].[usp_listarNotasconducta]

@Notini INT,
@Notfin INT	

as
select Nom_alu, Ape_alu_pat, Ape_alu_mat, Tel_alu, Nota_conducta, Salon from vw_notaAlumno 
where  Nota_conducta between @Notini and @Notfin


GO
/****** Object:  StoredProcedure [dbo].[usp_listarNotasCursoAlumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 procedure [dbo].[usp_listarNotasCursoAlumno]

@curso char(3)

as
select Id_Curso, Nom_cur, nota_exa, Nota_conducta, Nota_pra, Id_Alumno, Id_Profesor, Salon from VCursoNotas
where  Id_Profesor = @curso 
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarPractica]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarPractica]
AS
Select Id_practica, Fec_pra, Id_Alumno, Id_Profesor, Nota_pra
from Practica

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarProfesor]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarProfesor]
AS
Select Id_Profesor,Nom_pro,Ape_pro_mat, Ape_pro_pat, Tel_pro, tip_pro, fec_con,
Tipo = case
            when tip_pro=1 then 'Reemplazo'
            when tip_pro=2 then 'Estable'
          end 
from Profesor

GO
/****** Object:  StoredProcedure [dbo].[usp_listarProfesorAlumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_listarProfesorAlumno]

@fecini smalldatetime,
@fecfin smalldatetime

as
select Nom_pro, Ape_pro_pat, Ape_pro_mat, Tel_pro, tip_pro, fec_con ,Tipo = case
            when tip_pro=1 then 'Reemplazo'
            when tip_pro=2 then 'Estable'
          end from vw_vistaProf   
where  fec_con between @fecini and @fecfin


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarProfesorCombo]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarProfesorCombo]
AS
Select Id_Profesor,Nom_pro,Ape_pro_mat, Ape_pro_pat, Tel_pro, tip_pro, fec_con, ( Nom_pro + ' ' +Ape_pro_mat+ ' ' +Ape_pro_pat) as informacion
from Profesor
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumno](
	[Id_Alumno] [nvarchar](3) NOT NULL,
	[Nom_alu] [nvarchar](50) NULL,
	[Ape_alu_mat] [nvarchar](50) NULL,
	[Ape_alu_pat] [nvarchar](50) NULL,
	[Tel_alu] [nvarchar](9) NULL,
	[Fecha_Nacimiento] [smalldatetime] NULL,
	[Dni] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Auxiliar]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auxiliar](
	[id_Auxiliar] [char](4) NOT NULL,
	[nom_aux] [varchar](50) NULL,
	[ape_aux_mat] [varchar](50) NULL,
	[ape_aux_pat] [varchar](50) NULL,
	[tel_aux] [char](9) NULL,
	[fecha_con] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Auxiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[Id_Curso] [nvarchar](4) NOT NULL,
	[Nom_cur] [nvarchar](50) NULL,
	[Id_Examen] [nvarchar](4) NOT NULL,
	[Id_practica] [nvarchar](3) NOT NULL,
	[Id_grado] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[Cod_dis] [nvarchar](3) NOT NULL,
	[Nom_dis] [nvarchar](50) NOT NULL,
	[Id_Profesor] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_dis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Examen]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examen](
	[Id_Examen] [nvarchar](4) NOT NULL,
	[Fec_exa] [smalldatetime] NULL,
	[Id_Alumno] [nvarchar](3) NOT NULL,
	[Id_Profesor] [nvarchar](3) NOT NULL,
	[nota_exa] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Examen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grado]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grado](
	[Id_grado] [nvarchar](3) NOT NULL,
	[Nota_conducta] [tinyint] NOT NULL,
	[Id_Alumno] [nvarchar](3) NOT NULL,
	[Id_Profesor] [nvarchar](3) NOT NULL,
	[Salon] [varchar](40) NULL,
	[Fec_reg] [datetime] NULL,
	[id_Auxiliar] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_grado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Practica]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practica](
	[Id_practica] [nvarchar](3) NOT NULL,
	[Fec_pra] [smalldatetime] NULL,
	[Id_Alumno] [nvarchar](3) NOT NULL,
	[Id_Profesor] [nvarchar](3) NOT NULL,
	[Nota_pra] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_practica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[Id_Profesor] [nvarchar](3) NOT NULL,
	[Nom_pro] [nvarchar](50) NULL,
	[Ape_pro_mat] [nvarchar](50) NULL,
	[Ape_pro_pat] [nvarchar](50) NULL,
	[Tel_pro] [nvarchar](9) NULL,
	[tip_pro] [nvarchar](1) NULL,
	[fec_con] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[VCursoNotas]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VCursoNotas]
as
SELECT        Curso.Id_Curso, Curso.Nom_cur, Examen.nota_exa, Grado.Nota_conducta, Practica.Nota_pra, Grado.Id_Alumno, Grado.Id_Profesor, Grado.Salon
FROM            Examen INNER JOIN
                         Curso ON Examen.Id_Examen = Curso.Id_Examen INNER JOIN
                         Grado ON Grado.Id_grado = Curso.Id_grado INNER JOIN
                         Practica ON Curso.Id_practica = Practica.Id_practica
GO
/****** Object:  View [dbo].[vw_notaAlumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_notaAlumno]
as
SELECT        Alumno.Nom_alu, Alumno.Ape_alu_pat, Alumno.Ape_alu_mat, Grado.Nota_conducta, Alumno.Tel_alu, Grado.Salon
FROM            Alumno INNER JOIN
                         Grado ON Alumno.Id_Alumno = Grado.Id_Alumno


GO
/****** Object:  View [dbo].[vw_vistaAuxiliarAlumno]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_vistaAuxiliarAlumno]
as
SELECT        Alumno.Nom_alu, Alumno.Ape_alu_mat, Alumno.Ape_alu_pat, Grado.Salon, Auxiliar.id_Auxiliar
FROM            Alumno INNER JOIN
                         Grado ON Alumno.Id_Alumno = Grado.Id_Alumno INNER JOIN
                         Auxiliar ON Grado.id_Auxiliar = Auxiliar.id_Auxiliar

GO
/****** Object:  View [dbo].[vw_vistaProf]    Script Date: 01/12/2017 13:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_vistaProf] as
SELECT Id_Profesor, Nom_pro, Ape_pro_pat, Ape_pro_mat, Tel_pro, tip_pro, fec_con
FROM  Profesor

GO
INSERT [dbo].[Alumno] ([Id_Alumno], [Nom_alu], [Ape_alu_mat], [Ape_alu_pat], [Tel_alu], [Fecha_Nacimiento], [Dni]) VALUES (N'A01', N'Raul', N'Villanueva', N'Jimenez', N'957852358', CAST(0x8FEB0000 AS SmallDateTime), N'72837442')
INSERT [dbo].[Alumno] ([Id_Alumno], [Nom_alu], [Ape_alu_mat], [Ape_alu_pat], [Tel_alu], [Fecha_Nacimiento], [Dni]) VALUES (N'A02', N'Diego', N'Ramirez', N'Bobadilla', N'967583553', CAST(0x915B0000 AS SmallDateTime), N'74236234')
INSERT [dbo].[Alumno] ([Id_Alumno], [Nom_alu], [Ape_alu_mat], [Ape_alu_pat], [Tel_alu], [Fecha_Nacimiento], [Dni]) VALUES (N'A03', N'Juan', N'Perez', N'Crosby', N'836242343', CAST(0x91660000 AS SmallDateTime), N'72326343')
INSERT [dbo].[Auxiliar] ([id_Auxiliar], [nom_aux], [ape_aux_mat], [ape_aux_pat], [tel_aux], [fecha_con]) VALUES (N'AX01', N'Diego', N'Alferez', N'Ferrandez', N'994573956', CAST(0xA81F0000 AS SmallDateTime))
INSERT [dbo].[Curso] ([Id_Curso], [Nom_cur], [Id_Examen], [Id_practica], [Id_grado]) VALUES (N'C01 ', N'Ingles II', N'E01', N'N01', N'G01')
INSERT [dbo].[Curso] ([Id_Curso], [Nom_cur], [Id_Examen], [Id_practica], [Id_grado]) VALUES (N'C02 ', N'Matematica I', N'E02', N'N02', N'G02')
INSERT [dbo].[Curso] ([Id_Curso], [Nom_cur], [Id_Examen], [Id_practica], [Id_grado]) VALUES (N'C03 ', N'Lenguaje', N'E03', N'N03', N'G03')
INSERT [dbo].[Distrito] ([Cod_dis], [Nom_dis], [Id_Profesor]) VALUES (N'D01', N'La Punta', N'P01')
INSERT [dbo].[Examen] ([Id_Examen], [Fec_exa], [Id_Alumno], [Id_Profesor], [nota_exa]) VALUES (N'E01', CAST(0xA8370000 AS SmallDateTime), N'A01', N'P01', 16)
INSERT [dbo].[Examen] ([Id_Examen], [Fec_exa], [Id_Alumno], [Id_Profesor], [nota_exa]) VALUES (N'E02', CAST(0xA83A0000 AS SmallDateTime), N'A02', N'P01', 14)
INSERT [dbo].[Examen] ([Id_Examen], [Fec_exa], [Id_Alumno], [Id_Profesor], [nota_exa]) VALUES (N'E03', CAST(0xA83A0000 AS SmallDateTime), N'A03', N'P01', 18)
INSERT [dbo].[Grado] ([Id_grado], [Nota_conducta], [Id_Alumno], [Id_Profesor], [Salon], [Fec_reg], [id_Auxiliar]) VALUES (N'G01', 14, N'A01', N'P01', N'Tercero B', CAST(0x0000A82C00000000 AS DateTime), N'AX01')
INSERT [dbo].[Grado] ([Id_grado], [Nota_conducta], [Id_Alumno], [Id_Profesor], [Salon], [Fec_reg], [id_Auxiliar]) VALUES (N'G02', 18, N'A02', N'P01', N'Primero C', CAST(0x0000A82D00000000 AS DateTime), N'AX01')
INSERT [dbo].[Grado] ([Id_grado], [Nota_conducta], [Id_Alumno], [Id_Profesor], [Salon], [Fec_reg], [id_Auxiliar]) VALUES (N'G03', 19, N'A03', N'P01', N'Segundo A', CAST(0x0000A83A00000000 AS DateTime), N'AX01')
INSERT [dbo].[Practica] ([Id_practica], [Fec_pra], [Id_Alumno], [Id_Profesor], [Nota_pra]) VALUES (N'N01', CAST(0xA7920000 AS SmallDateTime), N'A01', N'P01', 18)
INSERT [dbo].[Practica] ([Id_practica], [Fec_pra], [Id_Alumno], [Id_Profesor], [Nota_pra]) VALUES (N'N02', CAST(0xA83A0000 AS SmallDateTime), N'A02', N'P01', 17)
INSERT [dbo].[Practica] ([Id_practica], [Fec_pra], [Id_Alumno], [Id_Profesor], [Nota_pra]) VALUES (N'N03', CAST(0xA83A0000 AS SmallDateTime), N'A03', N'P01', 13)
INSERT [dbo].[Profesor] ([Id_Profesor], [Nom_pro], [Ape_pro_mat], [Ape_pro_pat], [Tel_pro], [tip_pro], [fec_con]) VALUES (N'P01', N'Pablo', N'Ramirez ', N'Bobadilla', N'977583582', N'1', CAST(0x0000A82C00000000 AS DateTime))
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [fk_Examen] FOREIGN KEY([Id_Examen])
REFERENCES [dbo].[Examen] ([Id_Examen])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [fk_Examen]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [fk_Grado2] FOREIGN KEY([Id_grado])
REFERENCES [dbo].[Grado] ([Id_grado])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [fk_Grado2]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [fk_Practica] FOREIGN KEY([Id_practica])
REFERENCES [dbo].[Practica] ([Id_practica])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [fk_Practica]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [fk_Id_Profesor] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesor] ([Id_Profesor])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [fk_Id_Profesor]
GO
ALTER TABLE [dbo].[Examen]  WITH CHECK ADD  CONSTRAINT [fk_Alumno3] FOREIGN KEY([Id_Alumno])
REFERENCES [dbo].[Alumno] ([Id_Alumno])
GO
ALTER TABLE [dbo].[Examen] CHECK CONSTRAINT [fk_Alumno3]
GO
ALTER TABLE [dbo].[Examen]  WITH CHECK ADD  CONSTRAINT [fk_profesor_examen] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesor] ([Id_Profesor])
GO
ALTER TABLE [dbo].[Examen] CHECK CONSTRAINT [fk_profesor_examen]
GO
ALTER TABLE [dbo].[Grado]  WITH CHECK ADD FOREIGN KEY([id_Auxiliar])
REFERENCES [dbo].[Auxiliar] ([id_Auxiliar])
GO
ALTER TABLE [dbo].[Grado]  WITH CHECK ADD  CONSTRAINT [FK_Id_Alumno1] FOREIGN KEY([Id_Alumno])
REFERENCES [dbo].[Alumno] ([Id_Alumno])
GO
ALTER TABLE [dbo].[Grado] CHECK CONSTRAINT [FK_Id_Alumno1]
GO
ALTER TABLE [dbo].[Grado]  WITH CHECK ADD  CONSTRAINT [FK_Id_Profesor1] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesor] ([Id_Profesor])
GO
ALTER TABLE [dbo].[Grado] CHECK CONSTRAINT [FK_Id_Profesor1]
GO
ALTER TABLE [dbo].[Practica]  WITH CHECK ADD  CONSTRAINT [FK_Id_Alumno2] FOREIGN KEY([Id_Alumno])
REFERENCES [dbo].[Alumno] ([Id_Alumno])
GO
ALTER TABLE [dbo].[Practica] CHECK CONSTRAINT [FK_Id_Alumno2]
GO
ALTER TABLE [dbo].[Practica]  WITH CHECK ADD  CONSTRAINT [FK_Id_Profesor2] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesor] ([Id_Profesor])
GO
ALTER TABLE [dbo].[Practica] CHECK CONSTRAINT [FK_Id_Profesor2]
GO
USE [master]
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET  READ_WRITE 
GO
