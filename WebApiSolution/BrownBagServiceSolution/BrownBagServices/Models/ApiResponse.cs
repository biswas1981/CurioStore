using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace BrownBagServices.Models
{
    public class ApiResponse<T>
    {
        public HttpStatusCode HttpStatus { get; set; }
        public T ResponseData { get; set; }
        public dynamic ErrorData { get; set; }
        public string Message { get; set; }
    }
}