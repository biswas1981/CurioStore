using BrownBagService.DataAccess.DataEntity;
using BrownBagService.DataAccess.DataInterfaces;
using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataContract
{
    public class DeviceRegisterContract : BaseDataContract, IDeviceRegistration
    {

        public bool AddDeviceRegistration(DeviceRegistrationModel device)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    var deviceRegistration = new DeviceRegistration
                    {
                        AccessToken = device.AccessToken.Trim(),
                        
                        CreatedOnUtc = DateTime.Now.ToUniversalTime(),
                        IMEI_Number = device.IMEINumber.Trim(),
                        IsActive = true,
                        RefCustomerGuid = string.IsNullOrEmpty(device.CustomerGuid) ? (Guid?)null : Guid.Parse(device.CustomerGuid),
                        UpdatedOnUtc = DateTime.Now.ToUniversalTime()
                    };
                    dataContext.DeviceRegistrations.Add(deviceRegistration);
                    return dataContext.SaveChanges() > 0 ? true : false;
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
                using (var dataContext = new BrownBagDataEntities())
                {
                    var selectedDevice = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == device.IMEINumber).FirstOrDefault();
                    if (selectedDevice != null)
                    {
                        selectedDevice.AccessToken = device.AccessToken.Trim();
                        
                        selectedDevice.UpdatedOnUtc = DateTime.Now.ToUniversalTime();
                        return dataContext.SaveChanges() > 0 ? true : false;
                    }
                    else
                    {
                        return false;
                    }
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
                using (var dataContext = new BrownBagDataEntities())
                {
                    var selectedDevice = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceId).FirstOrDefault();
                    if (selectedDevice != null)
                    {
                        dataContext.DeviceRegistrations.Remove(selectedDevice);
                        return dataContext.SaveChanges() > 0 ? true : false;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch
            {
                throw;
            }
        }

        public DeviceRegistrationModel GetDeviceByDeviceId(string deviceId)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    return dataContext.DeviceRegistrations
                        .Where(w => w.IMEI_Number == deviceId).AsEnumerable()
                        .Select(s => new DeviceRegistrationModel
                        {
                            AccessToken = s.AccessToken ?? "",
                            
                            Id = s.Id,
                            CustomerGuid = s.RefCustomerGuid != null ? s.RefCustomerGuid.Value.ToString() : "",
                            IMEINumber = s.IMEI_Number,
                            
                            IsActive = s.IsActive,
                            CreatedOn = s.CreatedOnUtc.ToUniversalTime(),
                            UpdatedOn = s.UpdatedOnUtc != null ? s.UpdatedOnUtc.Value : DateTime.Now.ToUniversalTime()
                        })
                        .FirstOrDefault();
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
