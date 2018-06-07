<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaColegio.Paginas.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../Estilos/Login.css" rel="stylesheet" />
</head>
<body>
    <div class="contenedor-formulario">
		<div class="wrap">
			<div class="header">
				<h1>Sistema de Colegio</h1>
			</div>
			<form class="formulario" name="formulario_registro" method="post">
				<div>
					<div class="input-group">	
						<input type="text" id="nombre" name="nombre" />
						<label class="label" for="nombre"></label>
					</div>
					<div class="input-group">
						<input type="password" id="pass" name="pass" />
						<label class="label" for="pass"></label>
					</div>
					<input type="button" id="btn-submit" value="Iniciar Sesión"/>
				</div>
			</form>
		</div>		
	</div>
    <script src="../Scripts/Login.js"></script>
</body>
</html>
