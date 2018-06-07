using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Colegio.Librerias.EntidadesNegocio;
using Colegio.Librerias.AccesoDatos;

namespace Colegio.Librerias.ReglasNegocio
{
    public class brAlumno:brGeneral
    {
        public List<beAlumno> Listar()
        {
            List<beAlumno> lbeAlumno = null;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daAlumno odaAlumno = new daAlumno();
                    lbeAlumno = odaAlumno.Listar(con);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return lbeAlumno;
        }

        public bool Adicionar(beAlumno obeAlumno)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daAlumno odaAlumno = new daAlumno();
                    exito = odaAlumno.Adicionar(con, obeAlumno);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return exito;
        }

        public bool Actualizar(beAlumno obeAlumno)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daAlumno odaAlumno = new daAlumno();
                    exito = odaAlumno.Actualizar(con, obeAlumno);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return exito;
        }

        public bool Eliminar(string idAlumno)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daAlumno odaAlumno = new daAlumno();
                    exito = odaAlumno.Eliminar(con, idAlumno);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return exito;
        }
    }
}
