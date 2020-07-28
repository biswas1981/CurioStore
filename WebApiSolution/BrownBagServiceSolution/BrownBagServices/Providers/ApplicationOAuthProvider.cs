using Microsoft.Owin.Security.OAuth;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Linq;
using Newtonsoft.Json;
using System;
using Microsoft.Owin.Security.OAuth;
using BrownBagService.Business.Interfaces;
using BrownBagService.Business.Implementation;

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

                var x = context.Validated();
            });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override Task TokenEndpointResponse(OAuthTokenEndpointResponseContext context)
        {

            IDeviceRegistrationServices deviceServices = new DeviceRegistrationServices();
            deviceServices.EditDeviceRegistration(new BrownBagService.Model.DeviceRegistrationModel
            {
                AccessToken = context.AccessToken,
                IMEINumber = context.AdditionalResponseParameters["DeviceInformation"].ToString()
            });
            
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
            try
            {
                var deviceId = context.Scope[0];
                IDeviceRegistrationServices deviceServices = new DeviceRegistrationServices();
                var device = deviceServices.GetDeviceByDeviceId(deviceId);
                if (device == null)
                {
                    deviceServices.AddDeviceRegistration(new BrownBagService.Model.DeviceRegistrationModel
                    {
                        AccessToken = "-",
                        CustomerGuid = "",
                        IsActive = true,
                        IMEINumber = deviceId
                    });
                }
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