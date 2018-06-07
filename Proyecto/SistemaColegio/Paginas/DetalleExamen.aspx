<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleExamen.aspx.cs" Inherits="SistemaColegio.Paginas.DetalleExamen" %>
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
        <div class="Fila Subtitulo">Datos del Distrito</div>
        <div class="Fila">
            <div class="Campo" style="width:20%">Código:</div>
            <div class="Campo" style="width:80%"><asp:Label ID="lblCodigo" runat="server" /></div>
        </div>
        <div class="Fila">
            <div class="Campo" style="width:20%">Fecha Ex:</div>
            <div class="Campo" style="width:80%"><asp:TextBox ID="txtFechaExamen" Width="200" MaxLength="20" runat="server" /></div>
        </div>
        <div class="Fila">
            <div class="Campo" style="width:20%">Alumno:</div>
            <div class="Campo" style="width:80%">
                <asp:DropDownList ID="cboAlumno" runat="server">
                </asp:DropDownList>
            </div>
        </div>
        <div class="Fila">
            <div class="Campo" style="width:20%">Profesor:</div>
            <div class="Campo" style="width:80%">
                <asp:DropDownList ID="cboProfesor" runat="server">
                </asp:DropDownList>
            </div>
        </div>
        <div class="Fila">
            <div class="Campo" style="width:20%">Nota:</div> 
            <div class="Campo" style="width:80%"><asp:TextBox ID="txtNota" Width="200" MaxLength="20" runat="server" /></div>
        </div>
        <div class="Fila Centro">
            <asp:ImageButton ID="imgGuardar" ImageUrl="~/Imagenes/Guardar.png" CssClass="Icono" ToolTip="Guardar Distrito" OnClick="imgGuardar_Click" runat="server" />
            <img id="imgCancelar" src="../../Imagenes/Cancelar.png" class="Icono" title="Cancelar Edición" />    
        </div>
        <div class="Fila Centro Mensaje">
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </div>
    </div>
    </form>
    <script src="../../Scripts/DetalleExamen.js"></script>
</body>
</html>
