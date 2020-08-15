using BrownBagService.Business.Implementation;
using BrownBagService.Business.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Dependencies;
using Unity;

namespace BrownBagServices.Utility
{
    /// <summary>
    /// 
    /// </summary>
    public static class UnityConfig
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static UnityContainer RegisterComponents()
        {
            var container = new UnityContainer();
            container.RegisterType<ICustomerServices, CustomerServices>();
            container.RegisterType<IOtpServicescs, OtpServicescs>();
            container.RegisterType<IBannerServices, BannerServices>();
            container.RegisterType<IProductServices, ProductServices>();
            return container;
        }
    }
}