using Microsoft.Owin.Security.OAuth;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Linq;
using Newtonsoft.Json;
using System;
using Microsoft.Owin.Security.OAuth;

namespace BrownBagServices.Providers
{
    /// <summary>
    /// 
    /// </summary>
    public class ApplicationOAuthProvider : OAuthAuthorizationServerProvider
    {
        private string clientId = string.Empty;
        private string _userName = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public ApplicationOAuthProvider()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            await Task.Run(() =>
            {

                context.Validated();
            });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override Task TokenEndpointResponse(OAuthTokenEndpointResponseContext context)
        {


            //_userService.UpdateAccessToken(context.AdditionalResponseParameters["user_name"].ToString(), context.AccessToken);

            // Save any ref from context to DB
            return base.TokenEndpointResponse(context);
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            if (context.TokenIssued)
            {
                var tokenClaimsDeviceInfo = context.Identity.Claims.Where(c => c.Type.StartsWith("deviceId"));
                if (tokenClaimsDeviceInfo != null && tokenClaimsDeviceInfo.FirstOrDefault() != null)
                {
                    string _deviceInfo = tokenClaimsDeviceInfo.FirstOrDefault().Value;
                    context.AdditionalResponseParameters.Add("DeviceInformation", _deviceInfo);
                }
            }
            return base.TokenEndpoint(context);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            // context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { "*" });
            try
            {
                bool isValidUser = false;
                //Check device exist | if not then register it at DB
                var deviceId = context.Scope[0];
               

                isValidUser = true;
                var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                identity.AddClaim(new Claim("deviceId", deviceId));
                identity.AddClaim(new Claim(ClaimTypes.Role, "Mobile"));


                //----------------------------------------------------------
                context.Validated(identity);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }










    }
}