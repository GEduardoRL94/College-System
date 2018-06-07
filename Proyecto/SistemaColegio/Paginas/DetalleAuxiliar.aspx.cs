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
    public partial class DetalleAuxiliar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int indice = int.Parse(Request.QueryString["indice"]);
                if (indice == -1)
                {
                    lblSubtitulo.Text = "Adicionar Auxiliar";
                }
                else
                {
                    lblSubtitulo.Text = "Actualizar Auxiliar";
                    List<beAuxiliar> lbeAuxiliar = (List<beAuxiliar>)Session["Auxiliares"];
                    beAuxiliar obeAuxiliar = lbeAuxiliar[indice];
                    lblCodigo.Text = obeAuxiliar.IdAuxiliar.ToString();
                    txtNombre.Text = obeAuxiliar.Nombre;
                    txtApeMaterno.Text = obeAuxiliar.ApeMaterno;
                    txtApePaterno.Text = obeAuxiliar.ApePaterno;
                    txtTelefono.Text = obeAuxiliar.Telefono;
                    txtFechaCon.Text = obeAuxiliar.FechaContrato.ToShortDateString();
                }
            }
        }

        protected void imgGuardar_Click(object sender, ImageClickEventArgs e)
        {
            beAuxiliar obeAuxiliar = new beAuxiliar();
            if (lblSubtitulo.Text.Equals("Actualizar Auxiliar"))
            {
                obeAuxiliar.IdAuxiliar = lblCodigo.Text;
            }
            obeAuxiliar.Nombre = txtNombre.Text;
            obeAuxiliar.ApeMaterno = txtApeMaterno.Text;
            obeAuxiliar.ApePaterno = txtApePaterno.Text;
            obeAuxiliar.Telefono = txtTelefono.Text;
            obeAuxiliar.FechaContrato = DateTime.Parse(txtFechaCon.Text);
            brAuxiliar obrAuxiliar = new brAuxiliar();
            bool exito = false;
            string mensaje = "";
            if (lblSubtitulo.Text.Equals("Adicionar Auxiliar"))
            {
                exito = obrAuxiliar.Adicionar(obeAuxiliar);
                if (exito) mensaje = "Se adicionó el Auxiliar";
                else mensaje = "No se pudo adicionar el Auxiliar";
            }
            else
            {
                exito = obrAuxiliar.Actualizar(obeAuxiliar);
                if (exito) mensaje = "Se actualizó el Auxiliar";
                else mensaje = "No se pudo actualizar el Auxiliar";
            }
            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "alert('" + mensaje + "'); window.parent.document.getElementById('divPopupFondo').style.display = 'none'; window.parent.document.getElementById('btnRefrescar').click();", true);
        }
    }
}