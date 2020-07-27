using BrownBagServices.Providers;
using Microsoft.Owin;
using Microsoft.Owin.Cors;
using Microsoft.Owin.Security.OAuth;
using Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Http;

namespace BrownBagServices
{
    public partial class Startup
    {
       /// <summary>
       /// 
       /// </summary>
        public static OAuthBearerAuthenticationOptions OAuthBearerOptions { get; private set; }
        /// <summary>
        /// 
        /// </summary>
        public static OAuthAuthorizationServerOptions OAuthServerOptions;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="app"></param>
        public void ConfigureOAuth(IAppBuilder app)
        {
            
            OAuthBearerOptions = new OAuthBearerAuthenticationOptions();
            OAuthServerOptions = new OAuthAuthorizationServerOptions()
            {
                AllowInsecureHttp = true,
                TokenEndpointPath = new PathString("/brownbag/api/v1/token"),
                AccessTokenExpireTimeSpan = TimeSpan.FromMinutes(int.Parse(WebConfigurationManager.AppSettings["tokenExpires"])),

                AuthenticationMode = Microsoft.Owin.Security.AuthenticationMode.Passive,
                Provider = new ApplicationOAuthProvider(),
                AccessTokenProvider = new ApplicationAccessTokenProvider(),
                RefreshTokenProvider = new ApplicationRefreshTokenProvider(),

            };
            OAuthBearerOptions.AccessTokenFormat = OAuthServerOptions.AccessTokenFormat;
            //Enable cors

            // Token Generation
            app.UseOAuthAuthorizationServer(OAuthServerOptions);
            app.UseOAuthBearerAuthentication(OAuthBearerOptions);

        }
    }
}