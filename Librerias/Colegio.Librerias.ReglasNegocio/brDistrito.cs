using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Colegio.Librerias.EntidadesNegocio;
using Colegio.Librerias.AccesoDatos;

namespace Colegio.Librerias.ReglasNegocio
{
    public class brDistrito:brGeneral
    {
        public List<beDistrito> Listar()
        {
            List<beDistrito> lbeDistrito = null;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daDistrito odaDistrito = new daDistrito();
                    lbeDistrito = odaDistrito.Listar(con);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return lbeDistrito;
        }

        public bool Adicionar(beDistrito obeDistrito)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daDistrito odaDistrito = new daDistrito();
                    exito = odaDistrito.Adicionar(con, obeDistrito);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return exito;
        }

        public bool Actualizar(beDistrito obeDistrito)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daDistrito odaDistrito = new daDistrito();
                    exito = odaDistrito.Actualizar(con, obeDistrito);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return exito;
        }

        public bool Eliminar(string idDistrito)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daDistrito odaDistrito = new daDistrito();
                    exito = odaDistrito.Eliminar(con, idDistrito);
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
