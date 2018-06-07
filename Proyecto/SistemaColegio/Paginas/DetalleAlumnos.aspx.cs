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
    public partial class DetalleAlumnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int indice = int.Parse(Request.QueryString["indice"]);
                if (indice == -1)
                {
                    lblSubtitulo.Text = "Adicionar Alumno";
                }
                else
                {
                    lblSubtitulo.Text = "Actualizar Alumno";
                    List<beAlumno> lbeAlumno = (List<beAlumno>)Session["Alumnos"];
                    beAlumno obeAlumno = lbeAlumno[indice];
                    lblCodigo.Text = obeAlumno.IdAlumno.ToString();
                    txtNombre.Text = obeAlumno.Nombre;
                    txtApeMaterno.Text = obeAlumno.ApeMaterno;
                    txtApePaterno.Text = obeAlumno.ApePaterno;
                    txtTelefono.Text = obeAlumno.Telefono;
                    txtFechaNac.Text = obeAlumno.FechaNacimiento.ToShortDateString();
                    txtDni.Text = obeAlumno.Dni;
                }
            }
        }

        protected void imgGuardar_Click(object sender, ImageClickEventArgs e)
        {
            beAlumno obeAlumno = new beAlumno();
            if (lblSubtitulo.Text.Equals("Actualizar Alumno"))
            {
                obeAlumno.IdAlumno = lblCodigo.Text;
            }
            obeAlumno.Nombre = txtNombre.Text;
            obeAlumno.ApeMaterno = txtApeMaterno.Text;
            obeAlumno.ApePaterno = txtApePaterno.Text;
            obeAlumno.Telefono = txtTelefono.Text;
            obeAlumno.FechaNacimiento = DateTime.Parse(txtFechaNac.Text);
            obeAlumno.Dni = txtDni.Text;
            brAlumno obrAlumno = new brAlumno();
            bool exito = false;
            string mensaje = "";
            if (lblSubtitulo.Text.Equals("Adicionar Alumno"))
            {
                exito = obrAlumno.Adicionar(obeAlumno);
                if (exito) mensaje = "Se adicionó el Alumno";
                else mensaje = "No se pudo adicionar el Alumno";
            }
            else
            {
                exito = obrAlumno.Actualizar(obeAlumno);
                if (exito) mensaje = "Se actualizó el Alumno";
                else mensaje = "No se pudo actualizar el Alumno";
            }
            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "alert('" + mensaje + "'); window.parent.document.getElementById('divPopupFondo').style.display = 'none'; window.parent.document.getElementById('btnRefrescar').click();", true);
        }
    }
}