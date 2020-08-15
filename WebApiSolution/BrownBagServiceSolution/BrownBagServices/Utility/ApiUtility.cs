using BrownBagServices.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace BrownBagServices.Utility
{
    /// <summary>
    /// 
    /// </summary>
    public class ApiUtility
    {
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="data"></param>
        /// <param name="message"></param>
        /// <returns></returns>
        public static ApiResponse<T> ApiSuccess<T>(T data, string message = "")
        {
            return new ApiResponse<T>
            {
                HttpStatus = data != null ? HttpStatusCode.OK : HttpStatusCode.NoContent,
                ResponseData = data,
                ErrorData = null,
                Message = data == null || string.IsNullOrEmpty(message) ? "No data found" : message
            };
        }
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="ex"></param>
        /// <param name="message"></param>
        /// <returns></returns>
        public static ApiResponse<T> ApiError<T>(Exception ex, string message = "")
        {
            BrownBagLog.log.Error(ex);
            return new ApiResponse<T>
            {
                HttpStatus = HttpStatusCode.InternalServerError,
                ResponseData = default(T),
                ErrorData = ex,
                Message = message
            };
        }
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="trace"></param>
        /// <param name="message"></param>
        /// <returns></returns>
        public static ApiResponse<T> ApiBadRequest<T>(string trace, string message = "")
        {
            BrownBagLog.log.Error(trace);
            return new ApiResponse<T>
            {
                HttpStatus = HttpStatusCode.BadRequest,
                ResponseData = default(T),
                ErrorData = trace,
                Message = message
            };
        }
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static ApiResponse<T> ApiInvalidLogin<T>()
        {
            BrownBagLog.log.Error("Failed Login");
            return new ApiResponse<T>
            {
                HttpStatus = HttpStatusCode.Forbidden,
                ResponseData = default(T),
                ErrorData = "Invalid UserId or Password"
            };
        }
    }
}