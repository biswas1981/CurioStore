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
    public class DeviceRegistrationServices : IDeviceRegistrationServices
    {
        public DeviceRegistrationModel GetDeviceByDeviceId(string deviceId)
        {
            try
            {
                using (var dataContract = new DeviceRegisterContract())
                {
                    return dataContract.GetDeviceByDeviceId(deviceId);
                }
            }
            catch
            {
                throw;
            }
        }
        public bool AddDeviceRegistration(DeviceRegistrationModel device)
        {
            try
            {
                using (var dataContract = new DeviceRegisterContract())
                {
                    return dataContract.AddDeviceRegistration(device);
                }
            }
            catch
            {
                throw;
            }
        }

        public bool EditDeviceRegistration(DeviceRegistrationModel device)
        {
            try
            {
                using (var dataContract = new DeviceRegisterContract())
                {
                    return dataContract.EditDeviceRegistration(device);
                }
            }
            catch
            {
                throw;
            }
        }

        public bool DeleteDeviceRegistration(string deviceId)
        {
            try
            {
                using (var dataContract = new DeviceRegisterContract())
                {
                    return dataContract.DeleteDeviceRegistration(deviceId);
                }
            }
            catch
            {
                throw;
            }
        }

    }
}
