using BrownBagService.Model;
using BrownBagService.Business.Interfaces;
using BrownBagServices.Filters;
using BrownBagServices.Models;
using BrownBagServices.Utility;
using System.Web.Http;
using System.Web.Http.Cors;
using Microsoft.Web.Http;
using BrownBagServices.Providers;
using System.Collections.Generic;

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
        private readonly IBannerServices _bannerServices;
        private readonly IProductServices _productServices;
        public BrownBagController(ICustomerServices customerServices, IOtpServicescs otpServicescs, IBannerServices bannerServices, IProductServices productServices)
        {
            _customerServices = customerServices;
            _otpServicescs = otpServicescs;
            _bannerServices = bannerServices;
            _productServices = productServices;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
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
        public ApiResponse<dynamic> LogIn(LogInModel logInModel)
        {
            var deviceNo = Request.Properties["deviceIdentity"].ToString();
            var customerSummary = new CustomerSummary();
            var isLogin = _customerServices.CustomerLogIn(deviceNo.Trim(), logInModel.Password.Trim(), logInModel.Email.Trim());
            if (isLogin)
            {
                customerSummary =_customerServices.GetCustomerSummaryByEmail(logInModel.Email.Trim());
            }       
            return ApiUtility.ApiSuccess<dynamic>(new { IsLogin= isLogin, CustomerSummary= customerSummary });
        }

        [HttpGet]
        [Route("v{version:apiVersion}/LogOff")]
        public ApiResponse<bool> LogOff()
        {
            var deviceNo = Request.Properties["deviceIdentity"].ToString();
            var isLogOff = _customerServices.CustomerLogOff(deviceNo);
            return ApiUtility.ApiSuccess<bool>(isLogOff);
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
            bool isVrified = _otpServicescs.VerifyOTP(otpDetails.OTP.Value, otpDetails.Email.Value);
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

        [HttpGet]
        [Route("v{version:apiVersion}/GetBanners")]
        [CacheWebApi(Duration = 30)]
        public ApiResponse<List<BannerModel>> GetBanners()
        {
            var banners = _bannerServices.GetAllBanners();
            return ApiUtility.ApiSuccess<List<BannerModel>>(banners);
        }

        [HttpGet]
        [Route("v{version:apiVersion}/GetFeaturedProducts/{currencyName}")]
        [CacheWebApi(Duration = 30)]
        public ApiResponse<List<ProductSummaryModel>> GetFeaturedProducts(CurrencyTypeName currencyName)
        {
            var deviceNo = Request.Properties["deviceIdentity"].ToString();
            var products = _productServices.GetFeaturedProducts(currencyName, deviceNo);
            return ApiUtility.ApiSuccess<List<ProductSummaryModel>>(products);
        }


        [HttpPost]
        [Route("v{version:apiVersion}/GetAllProducts")]
        [CacheWebApi(Duration = 30)]
        public ApiResponse<ProductDetailsSummaryModel> GetAllProducts(SearchProductModel search)
        {
            var deviceNo = Request.Properties["deviceIdentity"].ToString();
            var products = _productServices.GetAllProducts(search, deviceNo);
            return ApiUtility.ApiSuccess<ProductDetailsSummaryModel>(products);
        }

        [HttpGet]
        [Route("v{version:apiVersion}/GetRootCategories/{currencyName}")]
        [CacheWebApi(Duration = 30)]
        public ApiResponse<List<RootCategoryModel>> GetRootCategories()
        {
            var categories = _productServices.GetRootCategories();
            return ApiUtility.ApiSuccess<List<RootCategoryModel>>(categories);
        }

        [HttpGet]
        [Route("v{version:apiVersion}/GetProductdetails/{productId}/{CurrencyName}")]
        [CacheWebApi(Duration = 30)]
        public ApiResponse<ProductDetailsModel> GetProductdetails(int productId, CurrencyTypeName CurrencyName)
        {
            var product = _productServices.GetProductDetails(productId, CurrencyName);
            return ApiUtility.ApiSuccess<ProductDetailsModel>(product);
        }

    }
}
