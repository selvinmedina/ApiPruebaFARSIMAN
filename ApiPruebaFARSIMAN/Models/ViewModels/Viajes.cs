using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiPruebaFARSIMAN.Models.ViewModels
{
    public class Viajes
    {
        public int idColaborador { get; set; }
        public int idSucursal { get; set; }
        public decimal cantidadKilometros { get; set; }
    }
    public class ViajesColaborador
    {
        public Colaborador[] colaboradores { get; set; }
        public DateTime fecha { get; set; }
        public int transportista { get; set; }
        public int usuario { get; set; }
    }

    public class Colaborador
    {
        public int id { get; set; }
        public string descripcion { get; set; }
    }
}