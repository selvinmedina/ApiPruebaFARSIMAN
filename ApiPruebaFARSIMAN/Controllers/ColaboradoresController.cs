using ApiPruebaFARSIMAN.Models;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace ApiPruebaFARSIMAN.Controllers
{
    public class ColaboradoresController : ApiController
    {
        private PruebaFARSIMANEntities db = new PruebaFARSIMANEntities();

        // GET: api/Colaboradores
        public IQueryable<object> GetColaboradores()
        {
            return db.tbColaboradores.Select(x => new
            {
                id = x.col_Id,
                descripcion = x.col_Apellido + " " + x.col_Nombre
            });
        }

        // GET: api/Colaboradores/5
        [ResponseType(typeof(tbColaboradores))]
        public async Task<IHttpActionResult> GettbColaboradores(int id)
        {
            tbColaboradores tbColaboradores = await db.tbColaboradores.FindAsync(id);
            if (tbColaboradores == null)
            {
                return NotFound();
            }

            return Ok(tbColaboradores);
        }

        // PUT: api/Colaboradores/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PuttbColaboradores(int id, tbColaboradores tbColaboradores)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tbColaboradores.col_Id)
            {
                return BadRequest();
            }

            db.Entry(tbColaboradores).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tbColaboradoresExists(id))
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

        // POST: api/Colaboradores
        [ResponseType(typeof(tbColaboradores))]
        public async Task<IHttpActionResult> PosttbColaboradores(tbColaboradores tbColaboradores)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.tbColaboradores.Add(tbColaboradores);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = tbColaboradores.col_Id }, tbColaboradores);
        }

        // DELETE: api/Colaboradores/5
        [ResponseType(typeof(tbColaboradores))]
        public async Task<IHttpActionResult> DeletetbColaboradores(int id)
        {
            tbColaboradores tbColaboradores = await db.tbColaboradores.FindAsync(id);
            if (tbColaboradores == null)
            {
                return NotFound();
            }

            db.tbColaboradores.Remove(tbColaboradores);
            await db.SaveChangesAsync();

            return Ok(tbColaboradores);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool tbColaboradoresExists(int id)
        {
            return db.tbColaboradores.Count(e => e.col_Id == id) > 0;
        }
    }
}