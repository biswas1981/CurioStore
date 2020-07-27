using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataInterfaces
{
    public interface IDeviceRegistration
    {
        bool AddDeviceRegistration(DeviceRegistrationModel contact);
        bool EditDeviceRegistration(DeviceRegistrationModel contact);
        bool DeleteDeviceRegistration(int id);
        DeviceRegistrationModel GetDeviceRegistrationByDeviceId(string deviceId);
        
    }
}
