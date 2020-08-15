using BrownBagServices.Models;
using BrownBagServices.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace BrownBagServices.Filters
{
    /// <summary>
    /// 
    /// </summary>
    public class ValidateModel : ActionFilterAttribute
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="actionContext"></param>
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            if (actionContext.ModelState.IsValid == false)
            {
                List<string> errorCollestion = new List<string>();
                var states = actionContext.ModelState.ToList();
                foreach (var item in states)
                {
                    var errores = item.Value.Errors;
                    foreach (var error in errores)
                    {
                        errorCollestion.Add(error.ErrorMessage);
                    }
                }
                string message = String.Join("|", errorCollestion.ToArray());
                actionContext.Response = actionContext.Request.CreateResponse<ApiResponse<bool>>(HttpStatusCode.OK, ApiUtility.ApiBadRequest<bool>("Request body validation failed",message));
            }

        }
    }
}