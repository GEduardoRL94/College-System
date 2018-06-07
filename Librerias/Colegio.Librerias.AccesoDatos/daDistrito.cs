using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Colegio.Librerias.EntidadesNegocio;

namespace Colegio.Librerias.AccesoDatos
{
    public class daDistrito
    {
        public List<beDistrito> Listar(SqlConnection con)
        {
            List<beDistrito> lbeDistrito = null;
            SqlCommand cmd = new SqlCommand("usp_ListarDistrito", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);
            if (drd != null)
            {
                lbeDistrito = new List<beDistrito>();
                beDistrito obeDistrito;
                while (drd.Read())
                {
                    obeDistrito = new beDistrito();
                    obeDistrito.IdDistrito = drd.GetString(0);
                    obeDistrito.Nombre = drd.GetString(1);
                    obeDistrito.IdProfesor = drd.GetString(2);
                    lbeDistrito.Add(obeDistrito);
                }
                drd.Close();
            }
            return lbeDistrito;
        }
        public bool Adicionar(SqlConnection con, beDistrito obeDistrito)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_InsertarDistrito", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nom_dis", obeDistrito.Nombre);
            cmd.Parameters.AddWithValue("@id_pro", obeDistrito.IdProfesor);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }

        public bool Actualizar(SqlConnection con, beDistrito obeDistrito)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_ActualizarDistrito", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", obeDistrito.IdDistrito);
            cmd.Parameters.AddWithValue("@Nom_dis", obeDistrito.Nombre);
            cmd.Parameters.AddWithValue("@id_pro", obeDistrito.IdProfesor);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }

        public bool Eliminar(SqlConnection con, string idDistrito)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_EliminarDistrito", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vcod", idDistrito);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }
    }
}
