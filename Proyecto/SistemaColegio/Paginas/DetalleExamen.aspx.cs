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
    public partial class DetalleExamen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int indice = int.Parse(Request.QueryString["indice"]);
                if (indice == -1)
                {
                    lblSubtitulo.Text = "Adicionar Examen";
                    cboProfesor.DataSource = (List<beProfesor>)Session["Profesores"];
                    cboProfesor.DataValueField = "IdProfesor";
                    cboProfesor.DataTextField = "Nombre";
                    cboProfesor.DataBind();
                    cboAlumno.DataSource = (List<beAlumno>)Session["Alumnos"];
                    cboAlumno.DataValueField = "IdAlumno";
                    cboAlumno.DataTextField = "Nombre";
                    cboAlumno.DataBind();
                }
                else
                {
                    lblSubtitulo.Text = "Actualizar Examen";
                    List<beExamen> lbeExamen = (List<beExamen>)Session["Examenes"];
                    beExamen obeExamen = lbeExamen[indice];
                    lblCodigo.Text = obeExamen.IdExamen.ToString();
                    txtFechaExamen.Text = obeExamen.FechaExamen.ToShortDateString();
                    cboAlumno.DataSource = (List<beAlumno>)Session["Alumnos"];
                    cboAlumno.DataValueField = "IdAlumno";
                    cboAlumno.DataTextField = "Nombre";
                    cboAlumno.DataBind();
                    cboAlumno.SelectedValue = obeExamen.IdAlumno;
                    cboProfesor.DataSource = (List<beProfesor>)Session["Profesores"];
                    cboProfesor.DataValueField = "IdProfesor";
                    cboProfesor.DataTextField = "Nombre";
                    cboProfesor.DataBind();
                    cboProfesor.SelectedValue = obeExamen.IdProfesor;
                    txtNota.Text = obeExamen.Nota.ToString();
                }
            }
        }

        protected void imgGuardar_Click(object sender, ImageClickEventArgs e)
        {
            beExamen obeExamen = new beExamen();
            if (lblSubtitulo.Text.Equals("Actualizar Examen"))
            {
                obeExamen.IdExamen = lblCodigo.Text;
            }
            obeExamen.FechaExamen = DateTime.Parse(txtFechaExamen.Text);
            obeExamen.IdAlumno = cboAlumno.SelectedValue;
            obeExamen.IdProfesor = cboProfesor.SelectedValue;
            obeExamen.Nota = int.Parse(txtNota.Text);
            brExamen obrExamen = new brExamen();
            bool exito = false;
            string mensaje = "";
            if (lblSubtitulo.Text.Equals("Adicionar Examen"))
            {
                exito = obrExamen.Adicionar(obeExamen);
                if (exito) mensaje = "Se adicionó el Examen";
                else mensaje = "No se pudo adicionar el Examen";
            }
            else
            {
                exito = obrExamen.Actualizar(obeExamen);
                if (exito) mensaje = "Se actualizó el Examen";
                else mensaje = "No se pudo actualizar el Examen";
            }
            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "alert('" + mensaje + "'); window.parent.document.getElementById('divPopupFondo').style.display = 'none'; window.parent.document.getElementById('btnRefrescar').click();", true);
        }
    }
}