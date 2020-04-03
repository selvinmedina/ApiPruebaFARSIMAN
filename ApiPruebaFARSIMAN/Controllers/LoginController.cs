using ApiPruebaFARSIMAN.Models.ViewModels;
using System.Web.Http;
using System.Web.Http.Description;


namespace ApiPruebaFARSIMAN.Controllers
{
    public class LoginController : ApiController
    {
        // GET: Login
        public string Get()
        {
            return "hola";
        }

        [ResponseType(typeof(Login))]
        public object Post(Login login)
        {

            return login;
        }
    }
}

