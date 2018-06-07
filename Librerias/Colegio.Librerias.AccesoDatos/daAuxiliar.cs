using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Colegio.Librerias.EntidadesNegocio;

namespace Colegio.Librerias.AccesoDatos
{
    public class daAuxiliar
    {
        public List<beAuxiliar> Listar(SqlConnection con)
        {
            List<beAuxiliar> lbeAuxiliar = null;
            SqlCommand cmd = new SqlCommand("usp_ListarAuxiliar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);
            if (drd != null)
            {
                lbeAuxiliar = new List<beAuxiliar>();
                beAuxiliar obeAuxiliar;
                while (drd.Read())
                {
                    obeAuxiliar = new beAuxiliar();
                    obeAuxiliar.IdAuxiliar = drd.GetString(0);
                    obeAuxiliar.Nombre = drd.GetString(1);
                    obeAuxiliar.ApeMaterno = drd.GetString(2);
                    obeAuxiliar.ApePaterno = drd.GetString(3);
                    obeAuxiliar.Telefono = drd.GetString(4);
                    obeAuxiliar.FechaContrato = drd.GetDateTime(5);
                    lbeAuxiliar.Add(obeAuxiliar);
                }
                drd.Close();
            }
            return lbeAuxiliar;
        }
        public bool Adicionar(SqlConnection con, beAuxiliar obeAuxiliar)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_InsertarAuxiliar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nom_a", obeAuxiliar.Nombre);
            cmd.Parameters.AddWithValue("@Ape_ma", obeAuxiliar.ApeMaterno);
            cmd.Parameters.AddWithValue("@Ape_pa", obeAuxiliar.ApePaterno);
            cmd.Parameters.AddWithValue("@Tele", obeAuxiliar.Telefono);
            cmd.Parameters.AddWithValue("@fec", obeAuxiliar.FechaContrato);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }

        public bool Actualizar(SqlConnection con, beAuxiliar obeAuxiliar)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_ActualizarAuxiliar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", obeAuxiliar.IdAuxiliar);
            cmd.Parameters.AddWithValue("@Nom_a", obeAuxiliar.Nombre);
            cmd.Parameters.AddWithValue("@Ape_ma", obeAuxiliar.ApeMaterno);
            cmd.Parameters.AddWithValue("@Ape_pa", obeAuxiliar.ApePaterno);
            cmd.Parameters.AddWithValue("@Tele", obeAuxiliar.Telefono);
            cmd.Parameters.AddWithValue("@fec", obeAuxiliar.FechaContrato);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }

        public bool Eliminar(SqlConnection con, string idAuxiliar)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_EliminarAuxiliar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vcod", idAuxiliar);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }
    }
}
