using System.Web.Http;
using WebActivatorEx;
using BrownBagServices;
using Swashbuckle.Application;

//[assembly: PreApplicationStartMethod(typeof(SwaggerConfig), "Register")]

namespace BrownBagServices
{
    public class SwaggerConfig
    {
        public static void Register(HttpConfiguration config)
        {
            var thisAssembly = typeof(SwaggerConfig).Assembly;

            GlobalConfiguration.Configuration
                .EnableSwagger(c =>
                    {
                        c.SingleApiVersion("v1", "BrownBagServices");
                        c.SchemaId(x => x.FullName);
                    })
                .EnableSwaggerUi(c =>
                    {


                    });
        }
    }
}
