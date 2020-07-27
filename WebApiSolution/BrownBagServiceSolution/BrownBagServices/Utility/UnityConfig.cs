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
    public static class UnityConfig
    {
        public static UnityContainer RegisterComponents()
        {
            var container = new UnityContainer();
            container.RegisterType<ICustomerServices, CustomerServices>();

            return container;
        }
    }
}