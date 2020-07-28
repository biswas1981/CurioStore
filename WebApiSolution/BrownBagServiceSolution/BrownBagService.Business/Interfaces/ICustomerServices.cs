using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Business.Interfaces
{
    public interface ICustomerServices
    {
        bool AddCustomer(CustomerBasicDetails customer);
        bool UpdateCustomer(Customer customer);
        Customer GetCustomer(string userId = "");
    }
}
