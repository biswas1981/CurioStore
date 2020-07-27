using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Infrastructure;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;


namespace BrownBagServices.Providers
{
    /// <summary>
    /// 
    /// </summary>
    public class ApplicationAccessTokenProvider : IAuthenticationTokenProvider
    {
        private static ConcurrentDictionary<string, AuthenticationTicket> _accessTokens = new ConcurrentDictionary<string, AuthenticationTicket>();
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public async Task CreateAsync(AuthenticationTokenCreateContext context)
        {
            string cDetails = GetRequestUserAgent(context);

            var newUserClaim = context.Ticket.Identity.Claims.FirstOrDefault(c => c.Type == "User-Agent");
            if (newUserClaim == null)
            {
                context.Ticket.Identity.AddClaim(new System.Security.Claims.Claim("User-Agent", cDetails));
            }

            var newClaim = context.Ticket.Identity.Claims.FirstOrDefault(c => c.Type == "expires_at");
            if (newClaim != null)
            {
                context.Ticket.Identity.RemoveClaim(newClaim);
            }
            var newTime = DateTime.Now.AddMinutes(int.Parse(System.Web.Configuration.WebConfigurationManager.AppSettings["tokenExpires"])).ToString();
            context.Ticket.Identity.AddClaim(new System.Security.Claims.Claim("expires_at", newTime));


            context.SetToken(context.SerializeTicket());
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>

        public async Task ReceiveAsync(AuthenticationTokenReceiveContext context)
        {
            AuthenticationTicket ticket;
            if (_accessTokens.TryRemove(context.Token, out ticket))
            {
                context.SetTicket(ticket);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        public void Create(AuthenticationTokenCreateContext context)
        {
            throw new NotImplementedException();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        public void Receive(AuthenticationTokenReceiveContext context)
        {
            throw new NotImplementedException();
        }



        private string GetRequestUserAgent(AuthenticationTokenCreateContext context)
        {
            var headers = context.Request.Headers.GetValues("User-Agent");
            var userAgent = string.Join(" ", headers);
            return userAgent;
        }
    }
}