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
    public partial class ListaAlumnos : System.Web.UI.Page
    {
        List<beAlumno> lbeAlumno;
        private void listarAlumnos()
        {
            brAlumno obrAlumno = new brAlumno();
            lbeAlumno = obrAlumno.Listar();
            enlazarGridView();
            Session["Alumnos"] = lbeAlumno;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            btnRefrescar.Attributes.Add("style", "display:none");
            if (!Page.IsPostBack)
            {
                listarAlumnos();
            }
        }

        private void enlazarGridView()
        {
            gvAlumno.DataSource = lbeAlumno;
            gvAlumno.DataBind();
        }

        protected void gvAlumno_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string n = "";
            brAlumno obrAlumno = new brAlumno();
            bool exito;
            string mensaje = "";
            switch (e.CommandName)
            {
                case "Eliminar":
                    n = e.CommandArgument.ToString();
                    exito = obrAlumno.Eliminar(n);
                    if (exito) mensaje = "Se eliminó el Alumno";
                    else mensaje = "No se pudo eliminar el Alumno";
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "alert('" + mensaje + "');", true);
                    listarAlumnos();
                    break;
            }
        }

        protected void btnRefrescar_Click(object sender, EventArgs e)
        {
            listarAlumnos();
        }
    }
}