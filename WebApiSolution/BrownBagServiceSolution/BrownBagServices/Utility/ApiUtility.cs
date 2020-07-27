using BrownBagServices.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace BrownBagServices.Utility
{
    public class ApiUtility
    {
        public static ApiResponse<T> ApiSuccess<T>(T data)
        {
            BrownBagLog.log.Info("Ok");
            return new ApiResponse<T>
            {
                HttpStatus = data != null ? HttpStatusCode.OK : HttpStatusCode.NoContent,
                ResponseData = data
            };
        }
        public static ApiResponse<T> ApiError<T>(Exception ex)
        {
            BrownBagLog.log.Error(ex);
            return new ApiResponse<T>
            {
                HttpStatus = HttpStatusCode.InternalServerError,
                ResponseData = default(T)
            };
        }
        public static ApiResponse<T> ApiBadRequest<T>(string trace)
        {
            BrownBagLog.log.Error(trace);
            return new ApiResponse<T>
            {
                HttpStatus = HttpStatusCode.BadRequest,
                ResponseData = default(T)
            };
        }
    }
}