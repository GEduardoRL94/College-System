using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Colegio.Librerias.EntidadesNegocio;

namespace Colegio.Librerias.AccesoDatos
{
    public class daAlumno
    {
        public List<beAlumno> Listar(SqlConnection con)
        {
            List<beAlumno> lbeAlumno = null;
            SqlCommand cmd = new SqlCommand("usp_ListarAlumno", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);
            if (drd != null)
            {
                lbeAlumno = new List<beAlumno>();
                beAlumno obeAlumno;
                while (drd.Read())
                {
                    obeAlumno = new beAlumno();
                    obeAlumno.IdAlumno = drd.GetString(0);
                    obeAlumno.Nombre = drd.GetString(1);
                    obeAlumno.ApePaterno = drd.GetString(2);
                    obeAlumno.ApeMaterno = drd.GetString(3);
                    obeAlumno.Telefono = drd.GetString(4);
                    obeAlumno.FechaNacimiento = drd.GetDateTime(5);
                    obeAlumno.Dni = drd.GetString(6);
                    lbeAlumno.Add(obeAlumno);
                }
                drd.Close();
            }
            return lbeAlumno;
        }
        public bool Adicionar(SqlConnection con, beAlumno obeAlumno)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_InsertarAlumno", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nom", obeAlumno.Nombre);
            cmd.Parameters.AddWithValue("@Ape_m", obeAlumno.ApeMaterno);
            cmd.Parameters.AddWithValue("@Ape_p", obeAlumno.ApePaterno);
            cmd.Parameters.AddWithValue("@Tel", obeAlumno.Telefono);
            cmd.Parameters.AddWithValue("@fec_nac", obeAlumno.FechaNacimiento);
            cmd.Parameters.AddWithValue("@dni", obeAlumno.Dni);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }

        public bool Actualizar(SqlConnection con, beAlumno obeAlumno)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_ActualizarAlumno", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", obeAlumno.IdAlumno);
            cmd.Parameters.AddWithValue("@Nom", obeAlumno.Nombre);
            cmd.Parameters.AddWithValue("@Ape_m", obeAlumno.ApeMaterno);
            cmd.Parameters.AddWithValue("@Ape_p", obeAlumno.ApePaterno);
            cmd.Parameters.AddWithValue("@Tel", obeAlumno.Telefono);
            cmd.Parameters.AddWithValue("@fec_nac", obeAlumno.FechaNacimiento);
            cmd.Parameters.AddWithValue("@dni", obeAlumno.Dni);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }

        public bool Eliminar(SqlConnection con, string idAlumno)
        {
            bool exito = false;
            SqlCommand cmd = new SqlCommand("usp_EliminarAlumno", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vcod", idAlumno);
            int n = cmd.ExecuteNonQuery();
            exito = (n > 0);
            return exito;
        }
    }
}
