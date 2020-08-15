using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace BrownBagServices.Models
{
    /// <summary>
    /// 
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class ApiResponse<T>
    {
        /// <summary>
        /// 
        /// </summary>
        public HttpStatusCode HttpStatus { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public T ResponseData { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public dynamic ErrorData { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Message { get; set; }
    }
}