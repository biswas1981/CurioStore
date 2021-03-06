﻿using BrownBagServices.Models;
using BrownBagServices.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http.Filters;

namespace BrownBagServices.Filters
{
    /// <summary>
    /// 
    /// </summary>
    public class BrownBagExceptionFilterAttribute : ExceptionFilterAttribute
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        public override void OnException(HttpActionExecutedContext context)
        {
            if (context.Exception is Exception)
            {
                BrownBagLog.log.Error(context.Exception.StackTrace);
                context.Response = context.Request.CreateResponse<ApiResponse<bool>>(HttpStatusCode.OK, new ApiResponse<bool> { HttpStatus = HttpStatusCode.InternalServerError, ResponseData = default(bool), ErrorData= context.Exception.Message, Message= "Internal Server Error" });
            }
        }
    }
}