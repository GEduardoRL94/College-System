using System.Configuration;

namespace Colegio.Librerias.ReglasNegocio
{
    public class brGeneral
    {
        public string CadenaConexion { get; set; }
        public brGeneral()
        {
            CadenaConexion = ConfigurationManager.ConnectionStrings["conSC"].ConnectionString;
        }
    }
    
}
