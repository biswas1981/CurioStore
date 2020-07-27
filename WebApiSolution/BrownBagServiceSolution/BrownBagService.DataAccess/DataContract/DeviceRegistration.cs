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
    public class DeviceRegistration : BaseDataContract, IDeviceRegistration
    {
        public DeviceRegistrationModel GetDeviceRegistrationByDeviceId(string deviceId)
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
                            RefreshToken = s.RefreshToken ?? "",
                            Id = s.Id,
                            CustomerGuid = s.RefCustomerGuid != null ? s.RefCustomerGuid.Value.ToString() : "",
                            IMEINumber = s.IMEI_Number,
                            ExpiryTime = s.ExpiryTime.ToLocalTime(),
                            IsActive = s.IsActive,
                            CreatedOn = s.CreatedOnUtc.ToLocalTime(),
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
