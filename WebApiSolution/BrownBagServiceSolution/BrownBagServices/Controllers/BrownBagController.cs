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
    [AuthFilter]
    public class BrownBagController : ApiController
    {
        private readonly ICustomerServices _customerServices;
        private readonly IOtpServicescs _otpServicescs;
        public BrownBagController(ICustomerServices customerServices)
        {
            _customerServices = customerServices;
        }

        [HttpGet]
        [Route("v{version:apiVersion}/CheckConnection")]
        public ApiResponse<bool> CheckConnection()
        {
            return ApiUtility.ApiSuccess<bool>(true);
        }

        [HttpPost]
        [Route("v{version:apiVersion}/RegisterUser")]
        [ValidateModel]
        public ApiResponse<bool> UserRegistration(CustomerBasicDetails customerBasicDetails)
        {
            bool isAdded = _customerServices.AddCustomer(customerBasicDetails);
            return ApiUtility.ApiSuccess<bool>(isAdded);
        }

        [HttpPost]
        [Route("v{version:apiVersion}/VerifyOTP")]
        [ValidateModel]
        public ApiResponse<bool> VerifyOTP(dynamic otpDetails)
        {
            bool isVrified = _otpServicescs.VerifyOTP(otpDetails.OTP, otpDetails.Email);
            return ApiUtility.ApiSuccess<bool>(isVrified);
        }

    }
}
