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
    public partial class DetalleProfesor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int indice = int.Parse(Request.QueryString["indice"]);
                if (indice == -1)
                {
                    lblSubtitulo.Text = "Adicionar Profesor";
                }
                else
                {
                    lblSubtitulo.Text = "Actualizar Profesor";
                    List<beProfesor> lbeProfesor = (List<beProfesor>)Session["Profesores"];
                    beProfesor obeProfesor = lbeProfesor[indice];
                    lblCodigo.Text = obeProfesor.IdProfesor.ToString();
                    txtNombre.Text = obeProfesor.Nombre;
                    txtApeMaterno.Text = obeProfesor.ApeMaterno;
                    txtApePaterno.Text = obeProfesor.ApePaterno;
                    txtTelefono.Text = obeProfesor.Telefono;
                    cboTipo.SelectedValue = obeProfesor.Tipo;
                    txtFechaCon.Text = obeProfesor.FechaContrato.ToShortDateString();
                }
            }
        }

        protected void imgGuardar_Click(object sender, ImageClickEventArgs e)
        {
            beProfesor obeProfesor = new beProfesor();
            if (lblSubtitulo.Text.Equals("Actualizar Profesor"))
            {
                obeProfesor.IdProfesor = lblCodigo.Text;
            }
            obeProfesor.Nombre = txtNombre.Text;
            obeProfesor.ApeMaterno = txtApeMaterno.Text;
            obeProfesor.ApePaterno = txtApePaterno.Text;
            obeProfesor.Telefono = txtTelefono.Text;
            obeProfesor.Tipo = cboTipo.SelectedValue;
            obeProfesor.FechaContrato = DateTime.Parse(txtFechaCon.Text);
            brProfesor obrProfesor = new brProfesor();
            bool exito = false;
            string mensaje = "";
            if (lblSubtitulo.Text.Equals("Adicionar Profesor"))
            {
                exito = obrProfesor.Adicionar(obeProfesor);
                if (exito) mensaje = "Se adicionó el Profesor";
                else mensaje = "No se pudo adicionar el Profesor";
            }
            else
            {
                exito = obrProfesor.Actualizar(obeProfesor);
                if (exito) mensaje = "Se actualizó el Profesor";
                else mensaje = "No se pudo actualizar el Profesor";
            }
            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "alert('" + mensaje + "'); window.parent.document.getElementById('divPopupFondo').style.display = 'none'; window.parent.document.getElementById('btnRefrescar').click();", true);
        }
    }
}