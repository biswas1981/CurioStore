using BrownBagService.Business.Interfaces;
using BrownBagService.DataAccess.DataContract;
using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Business.Implementation
{
   public class CustomerAttributeServices : ICustomerAttributeServices
    {
        public bool AddCustomerAddress(CustomerBasicDetails customer, Guid customerId)
        {
            try
            {
                using (var dataAddressContract = new CustomerAttributeContract())
                {
                  return  dataAddressContract.AddNewAddress(new CustomerAttribute {  Customer_Id = customerId,  Customer_Name = customer.FirstName.Trim() +" "+ customer.LastName.Trim(),  Customer_Phone = customer.PhoneNumber, Customer_Email= customer.Email, Customer_Active=1 });
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
