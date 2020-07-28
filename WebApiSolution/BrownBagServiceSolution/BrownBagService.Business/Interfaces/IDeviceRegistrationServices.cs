using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Business.Interfaces
{
    public interface IDeviceRegistrationServices
    {
        bool AddDeviceRegistration(DeviceRegistrationModel device);
        bool EditDeviceRegistration(DeviceRegistrationModel device);
        bool DeleteDeviceRegistration(string deviceId);
        DeviceRegistrationModel GetDeviceByDeviceId(string deviceId);
    }
}
