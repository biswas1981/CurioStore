using BrownBagService.Model;
using BrownBagService.Business.Interfaces;
using BrownBagServices.Filters;
using BrownBagServices.Models;
using BrownBagServices.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Microsoft.Web.Http;
using BrownBagServices.Providers;

namespace BrownBagServices.Controllers
{
    [ApiVersion("1.0")]
    [RoutePrefix("brownbag/api")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [BrownBagExceptionFilter]
    public class BrownBagController : ApiController
    {
        private readonly ICustomerServices _customerServices;
        public BrownBagController(ICustomerServices customerServices)
        {
            _customerServices = customerServices;
        }

        [HttpGet]
        [Route("v{version:apiVersion}/CheckConnection")]
        [AuthFilter]
        public ApiResponse<bool> CheckConnection()
        {
           
            return ApiUtility.ApiSuccess<bool>(true);
        } 
    }
}
