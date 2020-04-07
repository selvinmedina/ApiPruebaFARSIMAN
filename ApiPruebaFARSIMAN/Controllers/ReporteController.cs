using ApiPruebaFARSIMAN.Models;
using ApiPruebaFARSIMAN.Models.ViewModels;
using System.Linq;
using System.Web.Http;

namespace ApiPruebaFARSIMAN.Controllers
{
    public class ReporteController : ApiController
    {
        public object Post(Reportes reporte) => new PruebaFARSIMANEntities().Reporte( // Conexion
            reporte.fecha1, // Fecha 1
            reporte.fecha2, // Fecha 2
            reporte.transportista // Transportista
            ).FirstOrDefault(); // Obtener el Resultado y enviarlo
    }
}
