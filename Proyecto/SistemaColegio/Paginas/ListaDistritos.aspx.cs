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
    public partial class ListaDistritos : System.Web.UI.Page
    {
        List<beDistrito> lbeDistrito;
        private void listarDistritos()
        {
            brDistrito obrDistrito = new brDistrito();
            lbeDistrito = obrDistrito.Listar();
            enlazarGridView();
            Session["Distritos"] = lbeDistrito;
            brProfesor obrProfesor = new brProfesor();
            List<beProfesor> lbeProfesor = obrProfesor.Listar();
            Session["Profesores"] = lbeProfesor;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            btnRefrescar.Attributes.Add("style", "display:none");
            if (!Page.IsPostBack)
            {
                listarDistritos();
            }
        }
        private void enlazarGridView()
        {
            gvDistrito.DataSource = lbeDistrito;
            gvDistrito.DataBind();
        }

        protected void gvDistrito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string n = "";
            brDistrito obrDistrito = new brDistrito();
            bool exito;
            string mensaje = "";
            switch (e.CommandName)
            {
                case "Eliminar":
                    n = e.CommandArgument.ToString();
                    exito = obrDistrito.Eliminar(n);
                    if (exito) mensaje = "Se eliminó el Distrito";
                    else mensaje = "No se pudo eliminar el Distrito";
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "alert('" + mensaje + "');", true);
                    listarDistritos();
                    break;
            }
        }

        protected void btnRefrescar_Click(object sender, EventArgs e)
        {
            listarDistritos();
        }
    }
}