using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Colegio.Librerias.EntidadesNegocio;
using Colegio.Librerias.AccesoDatos;

namespace Colegio.Librerias.ReglasNegocio
{
    public class brAuxiliar:brGeneral
    {
        public List<beAuxiliar> Listar()
        {
            List<beAuxiliar> lbeAuxiliar = null;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daAuxiliar odaAuxiliar = new daAuxiliar();
                    lbeAuxiliar = odaAuxiliar.Listar(con);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return lbeAuxiliar;
        }

        public bool Adicionar(beAuxiliar obeAuxiliar)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daAuxiliar odaAuxiliar = new daAuxiliar();
                    exito = odaAuxiliar.Adicionar(con, obeAuxiliar);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return exito;
        }

        public bool Actualizar(beAuxiliar obeAuxiliar)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daAuxiliar odaAuxiliar = new daAuxiliar();
                    exito = odaAuxiliar.Actualizar(con, obeAuxiliar);
                }
                catch (Exception ex)
                {
                    //
                }
            }
            return exito;
        }

        public bool Eliminar(string idAuxiliar)
        {
            bool exito = false;
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                try
                {
                    con.Open();
                    daAuxiliar odaAuxiliar = new daAuxiliar();
                    exito = odaAuxiliar.Eliminar(con, idAuxiliar);
                }
                catch (Exception ex)
                {
                    /*beLog obeLog = new beLog();
                    obeLog.FechaHora = DateTime.Now.ToString();
                    obeLog.Mensaje = ex.Message;
                    obeLog.Detalle = ex.StackTrace;
                    Log.Grabar(obeLog, ArchivoLog);*/
                }
            }
            return exito;
        }
    }
}
