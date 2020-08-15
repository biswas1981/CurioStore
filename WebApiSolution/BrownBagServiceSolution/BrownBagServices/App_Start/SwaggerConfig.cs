using System.Web.Http;
using WebActivatorEx;
using BrownBagServices;
using Swashbuckle.Application;

//[assembly: PreApplicationStartMethod(typeof(SwaggerConfig), "Register")]

namespace BrownBagServices
{
    /// <summary>
    /// 
    /// </summary>
    public class SwaggerConfig
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="config"></param>
        public static void Register(HttpConfiguration config)
        {
            var thisAssembly = typeof(SwaggerConfig).Assembly;

            GlobalConfiguration.Configuration
                .EnableSwagger(c =>
                    {
                        c.ApiKey("Token").Description("Filling bearer token here").Name("Authorization").In("header");
                        c.IncludeXmlComments(string.Format(@"{0}\bin\BrownBagServices.XML", System.AppDomain.CurrentDomain.BaseDirectory));
                        c.SingleApiVersion("v1", "BrownBagServices");
                        c.SchemaId(x => x.FullName);
                    })
                .EnableSwaggerUi(c =>
                    {
                        c.EnableApiKeySupport("Authorization", "header");
                    });
        }
    }
}
