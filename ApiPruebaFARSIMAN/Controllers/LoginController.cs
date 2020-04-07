using ApiPruebaFARSIMAN.Models;
using ApiPruebaFARSIMAN.Models.ViewModels;
using System.Web.Http;
using System.Web.Http.Description;
using System.Linq;


namespace ApiPruebaFARSIMAN.Controllers
{
    public class LoginController : ApiController
    {
        private PruebaFARSIMANEntities db;
        // GET: Login
        public string Get()
        {
            return "login";
        }

        [ResponseType(typeof(Login))]
        public object Post(Login login)
        {
            using(db = new PruebaFARSIMANEntities())
            {
                // Obtener el login
                Login_Result login2 = db.Login(login.nombreUsuario, login.password).FirstOrDefault();
                if (login2 != null)
                {
                    return login2;
                }
                else
                {
                    return "No se encuentra el usuario";
                }
            }
        }
    }
}

