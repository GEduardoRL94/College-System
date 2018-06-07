using System;

namespace Colegio.Librerias.EntidadesNegocio
{
    public class beExamen
    {
        public string IdExamen { get; set; }
        public DateTime FechaExamen { get; set; }
        public string IdAlumno { get; set; }
        public string IdProfesor { get; set; }
        public int Nota { get; set; }
    }
}
