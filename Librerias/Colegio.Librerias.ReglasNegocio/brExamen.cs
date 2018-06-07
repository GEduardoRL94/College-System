using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Colegio.Librerias.EntidadesNegocio;
using Colegio.Librerias.AccesoDatos;

namespace Colegio.Librerias.ReglasNegocio
{
    public class brExamen:brGeneral
    {
        public List<beExamen> Listar()
        {
            List<beExamen> lbeExamen = null;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daExamen odaExamen = new daExamen();
                    lbeExamen = odaExamen.Listar(con);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return lbeExamen;
        }

        public bool Adicionar(beExamen obeExamen)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daExamen odaExamen = new daExamen();
                    exito = odaExamen.Adicionar(con, obeExamen);
                }
                catch (Exception ex)
                {
                }
            }
            return exito;
        }

        public bool Actualizar(beExamen obeExamen)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daExamen odaExamen = new daExamen();
                    exito = odaExamen.Actualizar(con, obeExamen);
                }
                catch (Exception ex)
                {
                }
            }
            return exito;
        }

        public bool Eliminar(string idExamen)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daExamen odaExamen = new daExamen();
                    exito = odaExamen.Eliminar(con, idExamen);
                }
                catch (Exception ex)
                {
                }
            }
            return exito;
        }
    }
}
