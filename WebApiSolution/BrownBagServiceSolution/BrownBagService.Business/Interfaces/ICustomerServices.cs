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
        CustomerSummary GetCustomerSummaryByEmail(string email);
        bool ChangeCustomerPassword(string deviceId, string password, string email);
        bool CustomerLogIn(string deviceId, string password, string email);
        bool CustomerLogOff(string deviceId);
        bool SaveBillingAddress(CustomerBillingAddress customerBillingAddress, string deviceNo);
        List<CustomerAddressDetails> GetAddresses(string deviceNo);
        bool DeleteAddress(string deviceNo, int id);
    }
}
