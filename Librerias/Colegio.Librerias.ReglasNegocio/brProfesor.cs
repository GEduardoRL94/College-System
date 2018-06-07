using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Colegio.Librerias.EntidadesNegocio;
using Colegio.Librerias.AccesoDatos;

namespace Colegio.Librerias.ReglasNegocio
{
    public class brProfesor:brGeneral
    {
        public List<beProfesor> Listar()
        {
            List<beProfesor> lbeProfesor = null;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daProfesor odaProfesor = new daProfesor();
                    lbeProfesor = odaProfesor.Listar(con);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return lbeProfesor;
        }

        public bool Adicionar(beProfesor obeProfesor)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daProfesor odaProfesor = new daProfesor();
                    exito = odaProfesor.Adicionar(con, obeProfesor);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return exito;
        }

        public bool Actualizar(beProfesor obeProfesor)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daProfesor odaProfesor = new daProfesor();
                    exito = odaProfesor.Actualizar(con, obeProfesor);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return exito;
        }

        public bool Eliminar(string idProfesor)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daProfesor odaProfesor = new daProfesor();
                    exito = odaProfesor.Eliminar(con, idProfesor);
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
