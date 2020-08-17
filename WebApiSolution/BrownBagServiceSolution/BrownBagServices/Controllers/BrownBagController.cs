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
    /// <summary>
    /// BrownBag Services - Curio
    /// </summary>
    [ApiVersion("1.0")]
    [RoutePrefix("brownbag/api")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [BrownBagExceptionFilter]
    [AuthFilter]
    public class BrownBagController : ApiController
    {
        /// <summary>
        /// 
        /// </summary>
        private readonly ICustomerServices _customerServices;
        private readonly IOtpServicescs _otpServicescs;
        private readonly IBannerServices _bannerServices;
        private readonly IProductServices _productServices;
        /// <summary>
        /// BrownBag Controller
        /// </summary>
        /// <param name="customerServices"></param>
        /// <param name="otpServicescs"></param>
        /// <param name="bannerServices"></param>
        /// <param name="productServices"></param>
        public BrownBagController(ICustomerServices customerServices, IOtpServicescs otpServicescs, IBannerServices bannerServices, IProductServices productServices)
        {
            _customerServices = customerServices;
            _otpServicescs = otpServicescs;
            _bannerServices = bannerServices;
            _productServices = productServices;
        }

        /// <summary>
        /// Check Connection
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("v{version:apiVersion}/CheckConnection")]
        public ApiResponse<bool> CheckConnection()
        {
            return ApiUtility.ApiSuccess<bool>(true, "Checked");
        }
        /// <summary>
        /// Check Customer by email
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("v{version:apiVersion}/CheckCustomer/{email}")]
        public ApiResponse<dynamic> CheckCustomer(string email)
        {
            var customerSummary = _customerServices.GetCustomerSummaryByEmail(email.Trim());
            if (customerSummary != null)
            {
                return ApiUtility.ApiSuccess<dynamic>(new { VerifiedCustomerFound = customerSummary.IsVerifiedCustomer, IsNewCustomer = false }, "This email already present for an existing customer");
            }
            else
            {
                return ApiUtility.ApiSuccess<dynamic>(new { VerifiedCustomerFound = false, IsNewCustomer = true }, "Not found any existing customer");
            }
        }

        /// <summary>
        /// User Login
        /// </summary>
        /// <param name="logInModel"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("v{version:apiVersion}/LogIn")]
        [ValidateModel]
        public ApiResponse<dynamic> LogIn(LogInModel logInModel)
        {
            var deviceNo = GetDeviceNo();
            var customerSummary = new CustomerSummary();
            var isLogin = _customerServices.CustomerLogIn(deviceNo.Trim(), logInModel.Password.Trim(), logInModel.Email.Trim());
            customerSummary = _customerServices.GetCustomerSummaryByEmail(logInModel.Email.Trim());
            return ApiUtility.ApiSuccess<dynamic>(new { IsLogin = isLogin, CustomerSummary = customerSummary }, isLogin ? "Loging successfully" : "Failed !!! Incorrect Email or Password");
        }
        /// <summary>
        /// User Logoff
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("v{version:apiVersion}/LogOff")]
        public ApiResponse<bool> LogOff()
        {
            var deviceNo = GetDeviceNo();
            var isLogOff = _customerServices.CustomerLogOff(deviceNo);
            return ApiUtility.ApiSuccess<bool>(isLogOff, isLogOff ? "Logoff successfully" : "Failed !!!");
        }

        /// <summary>
        /// Send OTP
        /// </summary>
        /// <param name="otpBodyModel"></param>
        /// <returns></returns>
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
            return ApiUtility.ApiSuccess<bool>(isSend, isSend ? "OTP send successfully" : "Failed !!!");
        }
        /// <summary>
        /// Register new user
        /// </summary>
        /// <param name="customerBasicDetails"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("v{version:apiVersion}/RegisterUser")]
        [ValidateModel]
        public ApiResponse<bool> UserRegistration(CustomerBasicDetails customerBasicDetails)
        {
            var customerSummary = _customerServices.GetCustomerSummaryByEmail(customerBasicDetails.Email);
            if (customerSummary == null)
            {
                bool isAdded = _customerServices.AddCustomer(customerBasicDetails);
                return ApiUtility.ApiSuccess<bool>(isAdded, isAdded ? "New customer added successfully" : "Failed !!!");
            }
            else
            {
                return ApiUtility.ApiSuccess<bool>(false, "Email already found");
            }
        }


        /// <summary>
        /// Add user address
        /// </summary>
        /// <param name="customerBillingAddress"></param>
        /// <remarks>If Id = 0 then new record will insert other wise record will update by Id value.</remarks>
        /// <returns>boolen</returns>
        [HttpPost]
        [Route("v{version:apiVersion}/SaveAddress")]
        [ValidateModel]
        public ApiResponse<bool> SaveAddress(CustomerBillingAddress customerBillingAddress)
        {
            var deviceNo = GetDeviceNo();
            var isSaved = _customerServices.SaveBillingAddress(customerBillingAddress, deviceNo);
            if (isSaved)
            {
                return ApiUtility.ApiSuccess<bool>(isSaved,"New address added successfully" );
            }
            else
            {
                return ApiUtility.ApiSuccess<bool>(false, "Failed !!!");
            }
        }

        /// <summary>
        /// Show user addresses
        /// </summary>
        /// <remarks>List of Address</remarks>
        /// <returns>List of Customer Address Details</returns>
        [HttpPost]
        [Route("v{version:apiVersion}/ShowAddresses")]
        [ValidateModel]
        public ApiResponse<List<CustomerAddressDetails>> ShowAddresses()
        {
            var deviceNo = GetDeviceNo();
            var listData = _customerServices.GetAddresses(deviceNo);
            if (listData!=null && listData.Count>0)
            {
                return ApiUtility.ApiSuccess<List<CustomerAddressDetails>>(listData, "all addresses get successfully");
            }
            else
            {
                return ApiUtility.ApiSuccess<List<CustomerAddressDetails>>(null, "Failed !!!");
            }
        }


        /// <summary>
        /// Verify OTP
        /// </summary>
        /// <param name="otpDetails"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("v{version:apiVersion}/VerifyOTP")]
        public ApiResponse<bool> VerifyOTP(dynamic otpDetails)
        {
            bool isVrified = _otpServicescs.VerifyOTP(otpDetails.OTP.Value, otpDetails.Email.Value);
            return ApiUtility.ApiSuccess<bool>(isVrified, isVrified ? "OTP varified successfully" : "Failed !!!");
        }

        /// <summary>
        /// Change Password
        /// </summary>
        /// <param name="customerChangePassword"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("v{version:apiVersion}/ChangePassword")]
        [ValidateModel]
        public ApiResponse<bool> ChangePassword(CustomerChangePassword customerChangePassword)
        {
            var isSaved = false;
            if (customerChangePassword.IsForgetPassword == false)
            {
                var deviceNo = GetDeviceNo();
                isSaved = _customerServices.ChangeCustomerPassword(deviceNo, customerChangePassword.NewPassword, "");
            }
            else
            {
                isSaved = _customerServices.ChangeCustomerPassword("", customerChangePassword.NewPassword, customerChangePassword.Email);
            }
            return ApiUtility.ApiSuccess<bool>(isSaved, isSaved ? "Password saved successfully" : "Failed !!!");
        }

        /// <summary>
        /// Get Banners
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("v{version:apiVersion}/GetBanners")]
        [CacheWebApi(Duration = 30)]
        public ApiResponse<List<BannerModel>> GetBanners()
        {
            var banners = _bannerServices.GetAllBanners();
            return ApiUtility.ApiSuccess<List<BannerModel>>(banners, "Banners listing successfully");
        }

        /// <summary>
        /// Get Featured Products
        /// </summary>
        /// <param name="currencyName"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("v{version:apiVersion}/GetFeaturedProducts/{currencyName}")]
        [CacheWebApi(Duration = 30)]
        public ApiResponse<List<ProductSummaryModel>> GetFeaturedProducts(CurrencyTypeName currencyName)
        {
            var deviceNo = GetDeviceNo();
            var products = _productServices.GetFeaturedProducts(currencyName, deviceNo);
            return ApiUtility.ApiSuccess<List<ProductSummaryModel>>(products, "Featured products listing successfully");
        }

        /// <summary>
        /// Get All Products
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("v{version:apiVersion}/GetAllProducts")]
        [CacheWebApi(Duration = 30)]
        public ApiResponse<ProductDetailsSummaryModel> GetAllProducts(SearchProductModel search)
        {
            var deviceNo = GetDeviceNo();
            var products = _productServices.GetAllProducts(search, deviceNo);
            return ApiUtility.ApiSuccess<ProductDetailsSummaryModel>(products, "Search products using filter successfully");
        }

        /// <summary>
        /// Get Root Categories
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("v{version:apiVersion}/GetRootCategories/{currencyName}")]
        [CacheWebApi(Duration = 30)]
        public ApiResponse<List<RootCategoryModel>> GetRootCategories()
        {
            var categories = _productServices.GetRootCategories();
            return ApiUtility.ApiSuccess<List<RootCategoryModel>>(categories, "Categories get successfully");
        }
        /// <summary>
        /// Get Product details
        /// </summary>
        /// <param name="productId"></param>
        /// <param name="CurrencyName"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("v{version:apiVersion}/GetProductdetails/{productId}/{CurrencyName}")]
        [CacheWebApi(Duration = 30)]
        public ApiResponse<ProductDetailsModel> GetProductdetails(int productId, CurrencyTypeName CurrencyName)
        {
            var product = _productServices.GetProductDetails(productId, CurrencyName);
            return ApiUtility.ApiSuccess<ProductDetailsModel>(product, "Product details get successfully");
        }
        /// <summary>
        /// Add To WishList
        /// </summary>
        /// <param name="productId"></param>
        /// <param name="CurrencyName"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("v{version:apiVersion}/AddToWishList")]
        public ApiResponse<bool> AddToWishList(int productId, CurrencyTypeName CurrencyName)
        {
            var deviceNo = GetDeviceNo();
            var isSave = _productServices.AddToWishList(productId, CurrencyName, deviceNo);
            return ApiUtility.ApiSuccess<bool>(isSave, isSave ? "Wishlist item added successfully" : "Failed!!!");
        }
        /// <summary>
        /// Delete WishItem
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("v{version:apiVersion}/DeleteWishItem")]
        public ApiResponse<bool> DeleteWishItem(int productId)
        {
            var deviceNo = GetDeviceNo();
            var isDelete = _productServices.RemoveFromWishList(productId, deviceNo);
            return ApiUtility.ApiSuccess<bool>(isDelete, isDelete ? "Wishlist item deleted successfully" : "Failed!!!");
        }
        /// <summary>
        /// Show Wish ListItems
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("v{version:apiVersion}/ShowWishListItems")]
        public ApiResponse<List<WishListItem>> ShowWishListItems()
        {
            var deviceNo = GetDeviceNo();
            var items = _productServices.ShowWishListItems(deviceNo);
            return ApiUtility.ApiSuccess<List<WishListItem>>(items, "Wishlist item(s) found.");
        }
        /// <summary>
        /// Get Product Suggestions
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("v{version:apiVersion}/GetProductSuggestions")]
        public ApiResponse<List<ProductBasicModel>> GetProductSuggestions()
        {
            var products = _productServices.GetProductSuggestions();
            return ApiUtility.ApiSuccess<List<ProductBasicModel>>(products, "Data Found");
        }

        /// <summary>
        /// Add To Cart
        /// </summary>
        /// <param name="productId"></param>
        /// <param name="CurrencyName"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("v{version:apiVersion}/AddToCart")]
        public ApiResponse<bool> AddToCart(int productId, CurrencyTypeName CurrencyName)
        {
            var deviceNo = GetDeviceNo();
            var isSave = _productServices.AddToCart(productId, CurrencyName, deviceNo);
            if (isSave == true)
            {
                return ApiUtility.ApiSuccess<bool>(isSave, "Item added to cart");
            }
            return ApiUtility.ApiSuccess<bool>(isSave, "Failed !!!");
        }
        /// <summary>
        /// Delete Cart Item
        /// </summary>
        /// <param name="productId"></param>
        /// <param name="cuponCode"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("v{version:apiVersion}/DeleteCartItem/{productId}/{cuponCode?}")]
        public ApiResponse<CartItemSummary> DeleteCartItem(int productId, string cuponCode = "")
        {
            var deviceNo = GetDeviceNo();
            var isDelete = _productServices.RemoveFromCart(productId, deviceNo, cuponCode);
            if (isDelete.Item1 == true)
            {
                return ApiUtility.ApiSuccess<CartItemSummary>(isDelete.Item2, "Item deleted successfully from cart");
            }
            return ApiUtility.ApiSuccess<CartItemSummary>(isDelete.Item2, "Failed !!!");
        }
        /// <summary>
        /// Show Cart Items
        /// </summary>
        /// <param name="couponCode"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("v{version:apiVersion}/ShowCartItems/{couponCode?}")]
        public ApiResponse<CartItemSummary> ShowCartItems(string couponCode = "")
        {
            var deviceNo = GetDeviceNo();
            var items = _productServices.ShowCartItems(deviceNo);
            return ApiUtility.ApiSuccess<CartItemSummary>(items, "Item(s) found");
        }

        private string GetDeviceNo()
        {
            return Request.Properties["deviceIdentity"].ToString();
        }
    }
}
