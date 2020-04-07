using ApiPruebaFARSIMAN.Models;
using ApiPruebaFARSIMAN.Models.ViewModels;
using System;
using System.Data.Entity;
using System.Linq;
using System.Transactions;
using System.Web.Http;

namespace ApiPruebaFARSIMAN.Controllers
{
    public class ViajesController : ApiController
    {
        private PruebaFARSIMANEntities db;
        public object Put(Viajes viajes)
        {
            using (db = new PruebaFARSIMANEntities())
            {
                try
                {
                    var colaborador = db.tbColaboradores.Find(viajes.idColaborador);
                    colaborador.col_DistanciaSucursal = viajes.cantidadKilometros;
                    colaborador.suc_Id = viajes.idSucursal;
                    db.Entry(colaborador).State = EntityState.Modified;
                    db.SaveChanges();
                }
                catch (Exception)
                {
                    return "mal";
                }
            }
            return "ok";
        }

        public object Post(ViajesColaborador viajes)
        {
            int cantidadErrores = 0;
            // Recorrer los colaboradores
            using (db = new PruebaFARSIMANEntities())
            {
                using (TransactionScope transaction = new TransactionScope())
                {
                    foreach (Colaborador colaborador in viajes.colaboradores)
                    {
                        if (// Si hay un error en la insersion
                            db.tbViajesColaborador_Insert( // Insertar los viajes
                                viajes.transportista,
                                colaborador.id,
                                viajes.fecha,
                                viajes.usuario)
                                .FirstOrDefault().MensajeError
                            .StartsWith("-1") // Si comienza con -1 hay error
                            )
                        {
                            cantidadErrores++;
                        }
                    }

                    // Completar la transaccion cuando se inserten todos los viajes de colaboradores
                    transaction.Complete();
                }
            }
            // true si no hubieron errores
            return !(cantidadErrores > 0);
        }
    }
}
