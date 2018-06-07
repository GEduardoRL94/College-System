<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaProfesores.aspx.cs" Inherits="SistemaColegio.Paginas.ListaProfesores" %>
<%@ Import Namespace="Colegio.Librerias.EntidadesNegocio" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Profesores</title>
    <link href="../Estilos/Estilos.css" rel="stylesheet" />
    <link href="../Estilos/Navegacion.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <nav>
            <ul>
            <li><a href="ListaAuxiliares.aspx">Auxiliares</a></li>
            <li><a href="ListaAlumnos.aspx">Alumnos</a></li>
            <li><a href="ListaProfesores.aspx">Profesores</a></li>
            <li><a href="ListaDistritos.aspx">Distritos</a></li>
            <li><a href="ListaExamenes.aspx">Examenes</a></li>
            </ul>
        </nav>
        <div class="Centro">
            <img id="imgNuevo" src="../Imagenes/Nuevo.png" class="Icono" title="Nuevo Profesor" />
            <asp:Button ID="btnRefrescar" Text="Refrescar" runat="server" OnClick="btnRefrescar_Click" />
        </div>
        <div>
            <asp:GridView ID="gvProfesor" runat="server" AutoGenerateColumns="false" OnRowCommand="gvProfesor_RowCommand">
                <HeaderStyle CssClass="FilaCabecera" />
                <RowStyle CssClass="FilaDatos" />
                <Columns>
                    <asp:TemplateField ItemStyle-Width="100" ControlStyle-Width="100" HeaderText="Código">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="<%#((beProfesor)Container.DataItem).IdProfesor%>"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label runat="server" Text="<%#((beProfesor)Container.DataItem).IdProfesor%>"></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="200" ControlStyle-Width="100" HeaderText="Nombre">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="<%#((beProfesor)Container.DataItem).Nombre%>"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text="<%#((beProfesor)Container.DataItem).Nombre%>"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="200" ControlStyle-Width="100" HeaderText="ApeMaterno">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="<%#((beProfesor)Container.DataItem).ApeMaterno%>"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text="<%#((beProfesor)Container.DataItem).ApeMaterno%>"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="200" ControlStyle-Width="100" HeaderText="ApePaterno">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="<%#((beProfesor)Container.DataItem).ApePaterno%>"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text="<%#((beProfesor)Container.DataItem).ApePaterno%>"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="200" ControlStyle-Width="100" HeaderText="Telefono">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="<%#((beProfesor)Container.DataItem).Telefono%>"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text="<%#((beProfesor)Container.DataItem).Telefono%>"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="200" ControlStyle-Width="100" HeaderText="Tipo">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="<%#((beProfesor)Container.DataItem).Tipo%>"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text="<%#((beProfesor)Container.DataItem).Tipo%>"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="150" ControlStyle-Width="150" HeaderText="FechaContrato">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="<%#((beProfesor)Container.DataItem).FechaContrato.ToShortDateString()%>"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text="<%#((beProfesor)Container.DataItem).FechaContrato.ToShortDateString()%>"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <img src="../Imagenes/Editar.png" class="Icono" title="Editar Profesor" onclick="mostrarProfesor(<%#Container.DataItemIndex%>);" />
                            <asp:ImageButton ImageUrl="~/Imagenes/Eliminar.png" CssClass="Icono" ToolTip="Eliminar Profesor" runat="server" CommandName="Eliminar" CommandArgument="<%#((beProfesor)Container.DataItem).IdProfesor%>" OnClientClick="return confirm('Seguro de eliminar al Profesor');"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div id="divPopupFondo" class="PopupFondo">
        <div id="divPopupDialogo" class="PopupDialogo">
            <iframe id="ifrPopup" src="" style="width:99%;height:99%"></iframe>
        </div>
    </div>
    </form>
    <script src="../Scripts/ListaProfesores.js"></script>
</body>
</html>
