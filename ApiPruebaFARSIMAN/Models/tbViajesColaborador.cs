//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ApiPruebaFARSIMAN.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbViajesColaborador
    {
        public int viaj_Id { get; set; }
        public int trans_Id { get; set; }
        public int col_Id { get; set; }
        public System.DateTime viaj_Fecha { get; set; }
        public int viaj_UsuarioCrea { get; set; }
    
        public virtual tbColaboradores tbColaboradores { get; set; }
        public virtual tbTransportistas tbTransportistas { get; set; }
        public virtual tbUsuarios tbUsuarios { get; set; }
    }
}