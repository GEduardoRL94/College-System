using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Colegio.Librerias.EntidadesNegocio;

namespace Colegio.Librerias.AccesoDatos
{
    public class daExamen
    {
        public List<beExamen> Listar(SqlConnection con)
        {
            List<beExamen> lbeExamen = null;
            SqlCommand cmd = new SqlCommand("usp_ListarExamen", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);
            if (drd != null)
            {
                lbeExamen = new List<beExamen>();
                beExamen obeExamen;
                while (drd.Read())
                {
                    obeExamen = new beExamen();
                    obeExamen.IdExamen = drd.GetString(0);
                    obeExamen.FechaExamen = drd.GetDateTime(1);
                    obeExamen.IdAlumno = drd.GetString(2);
                    obeExamen.IdProfesor = drd.GetString(3);
                    obeExamen.Nota = drd.GetByte(4);
                    lbeExamen.Add(obeExamen);
                }
                drd.Close();
            }
            return lbeExamen;
        }
        public bool Adicionar(SqlConnection con, beExamen obeExamen)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_InsertarExamen", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fec_exa", obeExamen.FechaExamen);
            cmd.Parameters.AddWithValue("@Id_Alumno", obeExamen.IdAlumno);
            cmd.Parameters.AddWithValue("@Id_Profesor", obeExamen.IdProfesor);
            cmd.Parameters.AddWithValue("@nota_exa", obeExamen.Nota);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }

        public bool Actualizar(SqlConnection con, beExamen obeExamen)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_ActualizarExamen", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", obeExamen.IdExamen);
            cmd.Parameters.AddWithValue("@fec_exa", obeExamen.FechaExamen);
            cmd.Parameters.AddWithValue("@id_alu", obeExamen.IdAlumno);
            cmd.Parameters.AddWithValue("@id_pro", obeExamen.IdProfesor);
            cmd.Parameters.AddWithValue("@nota_exa", obeExamen.Nota);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }

        public bool Eliminar(SqlConnection con, string idExamen)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_EliminarExamen", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vcod", idExamen);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }
    }
}
