using BrownBagService.Business.Interfaces;
using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Business.Implementation
{
    public class CustomerServices : ICustomerServices
    {
        public bool AddCustomer(Customer customer)
        {
            return true;
        }
        public bool UpdateCustomer(Customer customer)
        {
            return true;
        }
        public Customer GetCustomer(string userId = "")
        {
            return new Customer ();
        }
    }
}
