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
    public partial class ListaProfesores : System.Web.UI.Page
    {
        List<beProfesor> lbeProfesor;
        private void listarProfesores()
        {
            brProfesor obrProfesor = new brProfesor();
            lbeProfesor = obrProfesor.Listar();
            enlazarGridView();
            Session["Profesores"] = lbeProfesor;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            btnRefrescar.Attributes.Add("style", "display:none");
            if (!Page.IsPostBack)
            {
                listarProfesores();
            }
        }
        private void enlazarGridView()
        {
            gvProfesor.DataSource = lbeProfesor;
            gvProfesor.DataBind();
        }

        protected void gvProfesor_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string n = "";
            brProfesor obrProfesor = new brProfesor();
            bool exito;
            string mensaje = "";
            switch (e.CommandName)
            {
                case "Eliminar":
                    n = e.CommandArgument.ToString();
                    exito = obrProfesor.Eliminar(n);
                    if (exito) mensaje = "Se eliminó el Profesor";
                    else mensaje = "No se pudo eliminar el Profesor";
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "alert('" + mensaje + "');", true);
                    listarProfesores();
                    break;
            }
        }
        
        protected void btnRefrescar_Click(object sender, EventArgs e)
        {
            listarProfesores();
        }
    }
}