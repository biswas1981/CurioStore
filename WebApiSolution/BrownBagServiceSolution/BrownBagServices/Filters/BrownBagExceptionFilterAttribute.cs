using BrownBagServices.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http.Filters;

namespace BrownBagServices.Filters
{
    public class BrownBagExceptionFilterAttribute : ExceptionFilterAttribute
    {
        public override void OnException(HttpActionExecutedContext context)
        {
            if (context.Exception is Exception)
            {
                context.Response = context.Request.CreateResponse<ApiResponse<bool>>(HttpStatusCode.OK, new ApiResponse<bool> { HttpStatus = HttpStatusCode.InternalServerError, ResponseData = default(bool) });
            }
        }
    }
}