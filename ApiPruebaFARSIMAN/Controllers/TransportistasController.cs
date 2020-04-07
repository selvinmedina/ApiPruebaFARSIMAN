using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using ApiPruebaFARSIMAN.Models;

namespace ApiPruebaFARSIMAN.Controllers
{
    public class TransportistasController : ApiController
    {
        private PruebaFARSIMANEntities db = new PruebaFARSIMANEntities();

        // GET: api/Transportistas
        public IQueryable<object> GettbTransportistas()
        {
            return db.tbTransportistas.Select(x=> new {
                id= x.trans_Id,
                nombre = x.trans_Nombre + " " +x.trans_Apellido
            });
        }

        // GET: api/Transportistas/5
        [ResponseType(typeof(tbTransportistas))]
        public async Task<IHttpActionResult> GettbTransportistas(int id)
        {
            tbTransportistas tbTransportistas = await db.tbTransportistas.FindAsync(id);
            if (tbTransportistas == null)
            {
                return NotFound();
            }

            return Ok(tbTransportistas);
        }

        // PUT: api/Transportistas/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PuttbTransportistas(int id, tbTransportistas tbTransportistas)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tbTransportistas.trans_Id)
            {
                return BadRequest();
            }

            db.Entry(tbTransportistas).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tbTransportistasExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Transportistas
        [ResponseType(typeof(tbTransportistas))]
        public async Task<IHttpActionResult> PosttbTransportistas(tbTransportistas tbTransportistas)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.tbTransportistas.Add(tbTransportistas);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = tbTransportistas.trans_Id }, tbTransportistas);
        }

        // DELETE: api/Transportistas/5
        [ResponseType(typeof(tbTransportistas))]
        public async Task<IHttpActionResult> DeletetbTransportistas(int id)
        {
            tbTransportistas tbTransportistas = await db.tbTransportistas.FindAsync(id);
            if (tbTransportistas == null)
            {
                return NotFound();
            }

            db.tbTransportistas.Remove(tbTransportistas);
            await db.SaveChangesAsync();

            return Ok(tbTransportistas);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool tbTransportistasExists(int id)
        {
            return db.tbTransportistas.Count(e => e.trans_Id == id) > 0;
        }
    }
}