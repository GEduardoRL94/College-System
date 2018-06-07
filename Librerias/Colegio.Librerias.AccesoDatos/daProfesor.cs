using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Colegio.Librerias.EntidadesNegocio;

namespace Colegio.Librerias.AccesoDatos
{
    public class daProfesor
    {
        public List<beProfesor> Listar(SqlConnection con)
        {
            List<beProfesor> lbeProfesor = null;
            SqlCommand cmd = new SqlCommand("usp_ListarProfesor", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);
            if (drd != null)
            {
                lbeProfesor = new List<beProfesor>();
                beProfesor obeProfesor;
                while (drd.Read())
                {
                    obeProfesor = new beProfesor();
                    obeProfesor.IdProfesor = drd.GetString(0);
                    obeProfesor.Nombre = drd.GetString(1);
                    obeProfesor.ApeMaterno = drd.GetString(2);
                    obeProfesor.ApePaterno = drd.GetString(3);
                    obeProfesor.Telefono = drd.GetString(4);
                    obeProfesor.Tipo = drd.GetString(5);
                    obeProfesor.FechaContrato = drd.GetDateTime(6);
                    lbeProfesor.Add(obeProfesor);
                }
                drd.Close();
            }
            return lbeProfesor;
        }
        public bool Adicionar(SqlConnection con, beProfesor obeProfesor)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_InsertarProfesor", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nom", obeProfesor.Nombre);
            cmd.Parameters.AddWithValue("@apempro", obeProfesor.ApeMaterno);
            cmd.Parameters.AddWithValue("@apeppro", obeProfesor.ApePaterno);
            cmd.Parameters.AddWithValue("@tel", obeProfesor.Telefono);
            cmd.Parameters.AddWithValue("@tip", obeProfesor.Tipo);
            cmd.Parameters.AddWithValue("@fec", obeProfesor.FechaContrato);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }

        public bool Actualizar(SqlConnection con, beProfesor obeProfesor)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_ActualizarProfesor", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vcod", obeProfesor.IdProfesor);
            cmd.Parameters.AddWithValue("@nom", obeProfesor.Nombre);
            cmd.Parameters.AddWithValue("@apempro", obeProfesor.ApeMaterno);
            cmd.Parameters.AddWithValue("@apeppro", obeProfesor.ApePaterno);
            cmd.Parameters.AddWithValue("@tel", obeProfesor.Telefono);
            cmd.Parameters.AddWithValue("@tip", obeProfesor.Tipo);
            cmd.Parameters.AddWithValue("@fec", obeProfesor.FechaContrato);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }

        public bool Eliminar(SqlConnection con, string idProfesor)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_EliminarProfesor", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vcod", idProfesor);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }
    }
}
