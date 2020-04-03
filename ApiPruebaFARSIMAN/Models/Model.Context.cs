﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class PruebaFARSIMANEntities : DbContext
    {
        public PruebaFARSIMANEntities()
            : base("name=PruebaFARSIMANEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tbColaboradores> tbColaboradores { get; set; }
        public virtual DbSet<tbPrecioKilometro> tbPrecioKilometro { get; set; }
        public virtual DbSet<tbSucursales> tbSucursales { get; set; }
        public virtual DbSet<tbTransportistas> tbTransportistas { get; set; }
        public virtual DbSet<tbUsuarios> tbUsuarios { get; set; }
        public virtual DbSet<tbViajesColaborador> tbViajesColaborador { get; set; }
    
        public virtual ObjectResult<Reporte_Result> Reporte(Nullable<System.DateTime> fecha1, Nullable<System.DateTime> fecha2, Nullable<decimal> precioKilometro, Nullable<int> transportista)
        {
            var fecha1Parameter = fecha1.HasValue ?
                new ObjectParameter("fecha1", fecha1) :
                new ObjectParameter("fecha1", typeof(System.DateTime));
    
            var fecha2Parameter = fecha2.HasValue ?
                new ObjectParameter("fecha2", fecha2) :
                new ObjectParameter("fecha2", typeof(System.DateTime));
    
            var precioKilometroParameter = precioKilometro.HasValue ?
                new ObjectParameter("precioKilometro", precioKilometro) :
                new ObjectParameter("precioKilometro", typeof(decimal));
    
            var transportistaParameter = transportista.HasValue ?
                new ObjectParameter("transportista", transportista) :
                new ObjectParameter("transportista", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Reporte_Result>("Reporte", fecha1Parameter, fecha2Parameter, precioKilometroParameter, transportistaParameter);
        }
    
        public virtual ObjectResult<Login_Result> Login(string usuario, string password)
        {
            var usuarioParameter = usuario != null ?
                new ObjectParameter("usuario", usuario) :
                new ObjectParameter("usuario", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("password", password) :
                new ObjectParameter("password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Login_Result>("Login", usuarioParameter, passwordParameter);
        }
    }
}