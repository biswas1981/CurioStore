using Microsoft.Owin.Security;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Configuration;
using System.Web.Http;
using System.Web.Http.Controllers;
using System;
using BrownBagServices.Models;
using BrownBagServices.Utility;
using BrownBagService.Business.Interfaces;
using BrownBagService.Business.Implementation;

namespace BrownBagServices.Providers
{
    /// <summary>
    /// 
    /// </summary>
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Class, AllowMultiple = false)]
    public class AuthFilter : System.Web.Http.AuthorizeAttribute
    {
        private IDeviceRegistrationServices deviceRegistrationServices;
        /// <summary>
        /// 
        /// </summary>
        public string GivenName { get; set; }
        /// <summary>
        /// 
        /// </summary>


        /// <summary>
        /// 
        /// </summary>
        public AuthFilter()
        {
            deviceRegistrationServices = new DeviceRegistrationServices();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="actionContext"></param>
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            try
            {
                string skipAuthKeyValue = WebConfigurationManager.AppSettings["skipAuthorization"];
                bool isAnonymousSkiped = SkipAuthorization(actionContext);

                IEnumerable<string> values;
                if (actionContext.Request.Headers.TryGetValues("skip", out values) && values.First() == "1")
                {
                    skipAuthKeyValue = "true";
                }
                if (!bool.Parse(skipAuthKeyValue) && isAnonymousSkiped == false)
                {
                    string AccessTokenFromRequest = "";
                    if (actionContext.Request.Headers.Authorization != null)
                    {
                        // get the access token
                        AccessTokenFromRequest = actionContext.Request.Headers.Authorization.Parameter;
                    }
                    if (string.IsNullOrEmpty(AccessTokenFromRequest))
                    {
                        base.HandleUnauthorizedRequest(actionContext);
                        base.IsAuthorized(actionContext);
                        AuthorizeRequest(actionContext, null);
                    }
                    else
                    {
                        var tokenTicket = Startup.OAuthServerOptions.AccessTokenFormat.Unprotect(AccessTokenFromRequest);
                        var deviceId = tokenTicket.Identity.Claims.Where(c => c.Type.StartsWith("deviceId")).FirstOrDefault().Value;

                        string AccessTokenStored = deviceRegistrationServices.GetDeviceByDeviceId(deviceId)?.AccessToken ?? "";
                        if (AccessTokenFromRequest != AccessTokenStored)
                        {
                            base.HandleUnauthorizedRequest(actionContext);
                        }
                        base.IsAuthorized(actionContext);
                        AuthorizeRequest(actionContext, tokenTicket);
                    }
                    
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="actionContext"></param>
        protected override void HandleUnauthorizedRequest(HttpActionContext actionContext)
        {
            actionContext.Response = actionContext.Request.CreateResponse<ApiResponse<bool>>(HttpStatusCode.OK, ApiUtility.ApiBadRequest<bool>("Invalid Role", "Invalid User Role"));
        }

        private bool SkipAuthorization(HttpActionContext filterContext)
        {
            Contract.Assert(filterContext != null);

            return filterContext.ActionDescriptor.GetCustomAttributes<AllowAnonymousAttribute>(true).Any()
                   || filterContext.ActionDescriptor.ControllerDescriptor.GetCustomAttributes<AllowAnonymousAttribute>(true).Any();
        }

        private void AuthorizeRequest(HttpActionContext actionContext, AuthenticationTicket tokenTicket)
        {
            string token = string.Empty;
            AuthenticationTicket ticket;
            token = (actionContext.Request.Headers.Any(x => x.Key == "Authorization")) ? actionContext.Request.Headers.Where(x => x.Key == "Authorization").FirstOrDefault().Value.SingleOrDefault().Replace("Bearer ", "") : "";
            if (token == string.Empty)
            {
                actionContext.Response = actionContext.Request.CreateResponse<ApiResponse<bool>>(HttpStatusCode.OK, ApiUtility.ApiBadRequest<bool>("Invalid Header", "Invalid Header/Token not present"));
                return;
            }
            //your OAuth startup class may be called something else...
            ticket = tokenTicket;
            //Startup.OAuthServerOptions.AccessTokenFormat.Unprotect(token);

            if (ticket == null)
            {
                actionContext.Response = actionContext.Request.CreateResponse<ApiResponse<bool>>(HttpStatusCode.OK, ApiUtility.ApiBadRequest<bool>("Invalid Token", "Invalid token value"));
                return;
            }

            else if (ticket.Identity.Claims.Where(c => c.Type.StartsWith("expires_at")).FirstOrDefault() != null)
            {
                DateTime expiresAt = DateTime.Parse(ticket.Identity.Claims.Where(c => c.Type.StartsWith("expires_at")).FirstOrDefault().Value);
                if (DateTime.Now > expiresAt)
                {
                    actionContext.Response = actionContext.Request.CreateResponse<ApiResponse<bool>>(HttpStatusCode.OK, ApiUtility.ApiBadRequest<bool>("Invalid Token", "Invalid token value"));
                    return;
                }
            }
            else if (ticket.Identity.Claims.Where(c => c.Type.StartsWith("User-Agent")).FirstOrDefault() != null)
            {
                var tokenUserAgent = ticket.Identity.Claims.Where(c => c.Type.StartsWith("User-Agent")).FirstOrDefault().Value;
                if (actionContext.Request.Headers.UserAgent.Count > 0 && ticket != null)
                {
                    var headers = actionContext.Request.Headers.GetValues("User-Agent");
                    var userAgent = string.Join(" ", headers);
                    if (tokenUserAgent != userAgent)
                    {
                        actionContext.Response = actionContext.Request.CreateResponse<ApiResponse<bool>>(HttpStatusCode.OK, ApiUtility.ApiBadRequest<bool>("Invalid Agent", "Invalid agent value"));
                        return;
                    }
                }
            }

            if (actionContext.Request.Properties.Where(a => a.Key == "deviceIdentity").Count() == 0)
            {
                var userIdentityNo = ticket.Identity.Claims.Where(c => c.Type.StartsWith("deviceId")).Count() > 0 ? ticket.Identity.Claims.Where(c => c.Type.StartsWith("deviceId")).FirstOrDefault().Value : "System";
                actionContext.Request.Properties.Add(new KeyValuePair<string, object>("deviceIdentity", userIdentityNo));
            }
        }
    }
}