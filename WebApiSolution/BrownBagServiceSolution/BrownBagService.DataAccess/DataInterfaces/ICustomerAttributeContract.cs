using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataInterfaces
{
    public interface ICustomerAttributeContract
    {
        bool AddNewAddress(CustomerDetailAttribute customerAddress);
        bool SaveBillingAddress(CustomerBillingAddress customerBillingAddress, string deviceNo);
    }
}
