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
    public partial class ListaAuxiliares : System.Web.UI.Page
    {
        List<beAuxiliar> lbeAuxiliar;
        private void listarAuxiliares()
        {
            brAuxiliar obrAuxiliar = new brAuxiliar();
            lbeAuxiliar = obrAuxiliar.Listar();
            enlazarGridView();
            Session["Auxiliares"] = lbeAuxiliar;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            btnRefrescar.Attributes.Add("style", "display:none");
            if (!Page.IsPostBack)
            {
                listarAuxiliares();
            }
        }
        private void enlazarGridView()
        {
            gvAuxiliar.DataSource = lbeAuxiliar;
            gvAuxiliar.DataBind();
        }
        protected void gvAuxiliar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string n = "";
            brAuxiliar obrAuxiliar = new brAuxiliar();
            bool exito;
            string mensaje = "";
            switch (e.CommandName)
            {
                case "Eliminar":
                    n = e.CommandArgument.ToString();
                    exito = obrAuxiliar.Eliminar(n);
                    if (exito) mensaje = "Se eliminó el Auxiliar";
                    else mensaje = "No se pudo eliminar el Auxiliar";
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "alert('" + mensaje + "');", true);
                    listarAuxiliares();
                    break;
            }
        }

        protected void btnRefrescar_Click(object sender, EventArgs e)
        {
            listarAuxiliares();
        }
    }
}