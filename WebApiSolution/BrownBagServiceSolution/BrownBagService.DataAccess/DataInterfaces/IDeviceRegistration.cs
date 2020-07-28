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
        bool AddDeviceRegistration(DeviceRegistrationModel device);
        bool EditDeviceRegistration(DeviceRegistrationModel device);
        bool DeleteDeviceRegistration(string deviceId);
        DeviceRegistrationModel GetDeviceByDeviceId(string deviceId);
        
    }
}
