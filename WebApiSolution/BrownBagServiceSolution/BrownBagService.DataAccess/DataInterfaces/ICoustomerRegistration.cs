using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataInterfaces
{
    public interface ICoustomerRegistration
    {
        bool AddNewCoustomer(CustomerBasicDetails customerBasicDetails, Guid customerId);
        CustomerSummary GetCustomerByEmail(string email);
        bool ChangeCustomerPassword(string deviceId, string password, string email);
        bool CustomerLogIn(string deviceId, string password, string email);
        //bool UpdateNewCoustomer(CustomerBasicDetails customerBasicDetails);
        //bool DeleteCoustomer(CustomerBasicDetails customerBasicDetails);
        //bool GetCoustomerById(string customerId);
        //bool GetLastCoustomerByImei(string imei);

    }
}
