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

        [HttpGet]
        [Route("v{version:apiVersion}/CheckCustomer/{email}")]
        public ApiResponse<dynamic> CheckCustomer(string email)
        {
            var customerSummary = _customerServices.GetCustomerSummaryByEmail(email.Trim());
            if (customerSummary != null)
            {
                return ApiUtility.ApiSuccess<dynamic>(new { VerifiedCustomerFound = customerSummary.IsVerifiedCustomer, IsNewCustomer = false });
            }
            else
            {
                return ApiUtility.ApiSuccess<dynamic>(new { VerifiedCustomerFound = false, IsNewCustomer = true });
            }
        }


        [HttpPost]
        [Route("v{version:apiVersion}/LogIn")]
        [ValidateModel]
        public ApiResponse<bool> LogIn(LogInModel logInModel)
        {
            var deviceNo = Request.Properties["deviceIdentity"].ToString();
            var isLogin = _customerServices.CustomerLogIn(deviceNo, logInModel.Password, logInModel.Email);            
            return ApiUtility.ApiSuccess<bool>(isLogin);
        }


        [HttpPost]
        [Route("v{version:apiVersion}/SendOtp")]
        [ValidateModel]
        public ApiResponse<bool> SendOtp(OtpBodyModel otpBodyModel)
        {
            var summary = _customerServices.GetCustomerSummaryByEmail(otpBodyModel.Email);
            var isSend = _otpServicescs.SendOTP(new OtpDetailsModel
            {
                Email = otpBodyModel.Email,
                Prupose = otpBodyModel.IsForRegisterUser == true ? "Register" : otpBodyModel.IsForResetPassword == true ? "Reset" : "Default",
                CustomerName = summary.CustomerName,
                RefCustomerGuid = summary.CustomerId
            });
            return ApiUtility.ApiSuccess<bool>(isSend);
        }

        [HttpPost]
        [Route("v{version:apiVersion}/RegisterUser")]
        [ValidateModel]
        public ApiResponse<bool> UserRegistration(CustomerBasicDetails customerBasicDetails)
        {
            var customerSummary = _customerServices.GetCustomerSummaryByEmail(customerBasicDetails.Email);
            if (customerSummary == null || (customerSummary != null && customerSummary.IsVerifiedCustomer))
            {
                bool isAdded = _customerServices.AddCustomer(customerBasicDetails);
                return ApiUtility.ApiSuccess<bool>(isAdded);
            }
            else
            {
                return ApiUtility.ApiBadRequest<bool>("Email already found");
            }
        }

        [HttpPost]
        [Route("v{version:apiVersion}/VerifyOTP")]
        public ApiResponse<bool> VerifyOTP(dynamic otpDetails)
        {
            bool isVrified = _otpServicescs.VerifyOTP(otpDetails.OTP, otpDetails.Email);
            return ApiUtility.ApiSuccess<bool>(isVrified);
        }

        [HttpPost]
        [Route("v{version:apiVersion}/ChangePassword")]
        [ValidateModel]
        public ApiResponse<bool> ChangePassword(CustomerChangePassword customerChangePassword)
        {
            var isSaved = false;
            if (customerChangePassword.IsForgetPassword == false)
            {
                var deviceNo = Request.Properties["deviceIdentity"].ToString();
                isSaved = _customerServices.ChangeCustomerPassword(deviceNo, customerChangePassword.NewPassword, "");
            }
            else
            {
                isSaved = _customerServices.ChangeCustomerPassword("", customerChangePassword.NewPassword, customerChangePassword.Email);
            }
            return ApiUtility.ApiSuccess<bool>(isSaved);
        }



    }
}
