<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleAlumnos.aspx.cs" Inherits="SistemaColegio.Paginas.DetalleAlumnos" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../Estilos/Estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="Fila BarraTitulo"  style="margin:0px;padding:0px;">
            <div class="Campo" style="width:95%"><asp:Label ID="lblSubtitulo" runat="server">Subtitulo</asp:Label></div>
            <div class="Campo Derecha" style="width:5%">
                <img id="imgCerrar" src="../../Imagenes/Cancelar.png" class="Icono Derecha" title="Cerrar Ventana" />
            </div>
        </div>
        <div class="Fila Subtitulo">Datos del Auxiliar</div>
        <div class="Fila">
            <div class="Campo" style="width:20%">Código:</div>
            <div class="Campo" style="width:80%"><asp:Label ID="lblCodigo" runat="server" /></div>
        </div>
        <div class="Fila">
            <div class="Campo" style="width:20%">Nombre:</div>
            <div class="Campo" style="width:80%"><asp:TextBox ID="txtNombre" Width="200" MaxLength="20" runat="server" /></div>
        </div>
        <div class="Fila">
            <div class="Campo" style="width:20%">ApePaterno:</div>
            <div class="Campo" style="width:80%"><asp:TextBox ID="txtApePaterno" Width="100" MaxLength="10" runat="server" /></div>
        </div>   
        <div class="Fila">
            <div class="Campo" style="width:20%">ApeMaterno:</div>
            <div class="Campo" style="width:80%"><asp:TextBox ID="txtApeMaterno" Width="100" MaxLength="10" runat="server" /></div>
        </div>
        <div class="Fila">
            <div class="Campo" style="width:20%">Teléfono:</div>
            <div class="Campo" style="width:80%"><asp:TextBox ID="txtTelefono" Width="100" MaxLength="10" runat="server" /></div>
        </div>   
        <div class="Fila">
            <div class="Campo" style="width:20%">FechaNac:</div>
            <div class="Campo" style="width:80%"><asp:TextBox ID="txtFechaNac" Width="100" MaxLength="10" runat="server" /></div>
        </div>
        <div class="Fila">
            <div class="Campo" style="width:20%">DNI:</div>
            <div class="Campo" style="width:80%"><asp:TextBox ID="txtDni" Width="100" MaxLength="10" runat="server" /></div>
        </div> 
        <div class="Fila Centro">
            <asp:ImageButton ID="imgGuardar" ImageUrl="~/Imagenes/Guardar.png" CssClass="Icono" ToolTip="Guardar Auxiliar" OnClick="imgGuardar_Click" runat="server" />
            <img id="imgCancelar" src="../../Imagenes/Cancelar.png" class="Icono" title="Cancelar Edición" />    
        </div>
        <div class="Fila Centro Mensaje">
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </div>
    </div>
    </form>
    <script src="../../Scripts/DetalleAlumno.js"></script>
</body>
</html>
