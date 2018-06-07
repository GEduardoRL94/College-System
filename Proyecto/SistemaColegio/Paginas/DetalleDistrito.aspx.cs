using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Colegio.Librerias.EntidadesNegocio;
using Colegio.Librerias.ReglasNegocio;

namespace SistemaColegio.Paginas
{
    public partial class DetalleDistrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int indice = int.Parse(Request.QueryString["indice"]);
                if (indice == -1)
                {
                    lblSubtitulo.Text = "Adicionar Distrito";
                    cboProfesor.DataSource = (List<beProfesor>)Session["Profesores"];
                    cboProfesor.DataValueField = "IdProfesor";
                    cboProfesor.DataTextField = "Nombre";
                    cboProfesor.DataBind();
                }
                else
                {
                    lblSubtitulo.Text = "Actualizar Distrito";
                    List<beDistrito> lbeDistrito = (List<beDistrito>)Session["Distritos"];
                    beDistrito obeDistrito = lbeDistrito[indice];
                    lblCodigo.Text = obeDistrito.IdDistrito.ToString();
                    txtNombre.Text = obeDistrito.Nombre;
                    cboProfesor.DataSource = (List<beProfesor>)Session["Profesores"];
                    cboProfesor.DataValueField = "IdProfesor";
                    cboProfesor.DataTextField = "Nombre";
                    cboProfesor.DataBind();
                    cboProfesor.SelectedValue = obeDistrito.IdProfesor;
                }
            }
        }

        protected void imgGuardar_Click(object sender, ImageClickEventArgs e)
        {
            beDistrito obeDistrito = new beDistrito();
            if (lblSubtitulo.Text.Equals("Actualizar Distrito"))
            {
                obeDistrito.IdDistrito = lblCodigo.Text;
            }
            obeDistrito.Nombre = txtNombre.Text;
            obeDistrito.IdProfesor = cboProfesor.SelectedValue;
            brDistrito obrDistrito = new brDistrito();
            bool exito = false;
            string mensaje = "";
            if (lblSubtitulo.Text.Equals("Adicionar Distrito"))
            {
                exito = obrDistrito.Adicionar(obeDistrito);
                if (exito) mensaje = "Se adicionó el Distrito";
                else mensaje = "No se pudo adicionar el Distrito";
            }
            else
            {
                exito = obrDistrito.Actualizar(obeDistrito);
                if (exito) mensaje = "Se actualizó el Distrito";
                else mensaje = "No se pudo actualizar el Distrito";
            }
            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "alert('" + mensaje + "'); window.parent.document.getElementById('divPopupFondo').style.display = 'none'; window.parent.document.getElementById('btnRefrescar').click();", true);
        }
    }
}