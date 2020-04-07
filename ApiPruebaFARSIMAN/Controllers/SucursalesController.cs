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
    public class SucursalesController : ApiController
    {
        private PruebaFARSIMANEntities db = new PruebaFARSIMANEntities();

        // GET: api/Sucursales
        public IQueryable<object> GetSucursales()
        {
            return db.tbSucursales.Select(x=> new { id= x.suc_Id, descripcion = x.suc_Nombre });
        }

        // GET: api/Sucursales/5
        [ResponseType(typeof(tbSucursales))]
        public async Task<IHttpActionResult> GettbSucursales(int id)
        {
            tbSucursales tbSucursales = await db.tbSucursales.FindAsync(id);
            if (tbSucursales == null)
            {
                return NotFound();
            }

            return Ok(tbSucursales);
        }

        // PUT: api/Sucursales/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PuttbSucursales(int id, tbSucursales tbSucursales)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tbSucursales.suc_Id)
            {
                return BadRequest();
            }

            db.Entry(tbSucursales).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tbSucursalesExists(id))
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

        // POST: api/Sucursales
        [ResponseType(typeof(tbSucursales))]
        public async Task<IHttpActionResult> PosttbSucursales(tbSucursales tbSucursales)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.tbSucursales.Add(tbSucursales);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = tbSucursales.suc_Id }, tbSucursales);
        }

        // DELETE: api/Sucursales/5
        [ResponseType(typeof(tbSucursales))]
        public async Task<IHttpActionResult> DeletetbSucursales(int id)
        {
            tbSucursales tbSucursales = await db.tbSucursales.FindAsync(id);
            if (tbSucursales == null)
            {
                return NotFound();
            }

            db.tbSucursales.Remove(tbSucursales);
            await db.SaveChangesAsync();

            return Ok(tbSucursales);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool tbSucursalesExists(int id)
        {
            return db.tbSucursales.Count(e => e.suc_Id == id) > 0;
        }
    }
}