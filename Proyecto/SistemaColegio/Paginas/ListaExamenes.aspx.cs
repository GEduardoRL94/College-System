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
    public partial class ListaExamenes : System.Web.UI.Page
    {
        List<beExamen> lbeExamen;
        private void listarExamenes()
        {
            brExamen obrExamen = new brExamen();
            lbeExamen = obrExamen.Listar();
            enlazarGridView();
            Session["Examenes"] = lbeExamen;
            brProfesor obrProfesor = new brProfesor();
            List<beProfesor> lbeProfesor = obrProfesor.Listar();
            Session["Profesores"] = lbeProfesor;
            brAlumno obrAlumno = new brAlumno();
            List<beAlumno> lbeAlumno = obrAlumno.Listar();
            Session["Alumnos"] = lbeAlumno;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            btnRefrescar.Attributes.Add("style", "display:none");
            if (!Page.IsPostBack)
            {
                listarExamenes();
            }
        }
        private void enlazarGridView()
        {
            gvExamen.DataSource = lbeExamen;
            gvExamen.DataBind();
        }

        protected void gvExamen_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string n = "";
            brExamen obrExamen = new brExamen();
            bool exito;
            string mensaje = "";
            switch (e.CommandName)
            {
                case "Eliminar":
                    n = e.CommandArgument.ToString();
                    exito = obrExamen.Eliminar(n);
                    if (exito) mensaje = "Se eliminó el Examen";
                    else mensaje = "No se pudo eliminar el Examen";
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "alert('" + mensaje + "');", true);
                    listarExamenes();
                    break;
            }
        }

        protected void btnRefrescar_Click(object sender, EventArgs e)
        {
            listarExamenes();
        }
    }
}