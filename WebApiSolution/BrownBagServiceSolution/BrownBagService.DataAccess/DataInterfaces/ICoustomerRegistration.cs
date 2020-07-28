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
        //bool UpdateNewCoustomer(CustomerBasicDetails customerBasicDetails);
        //bool DeleteCoustomer(CustomerBasicDetails customerBasicDetails);
        //bool GetCoustomerById(string customerId);
        //bool GetLastCoustomerByImei(string imei);
        
    }
}
