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
    public class CustomerAttributeContract : BaseDataContract, ICustomerAttributeContract
    {
        public bool AddNewAddress(Model.CustomerDetailAttribute customerAddress)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    dataContext.CustomerAttributes.Add(new DataEntity.CustomerAttribute
                    {
                        Customer_Id = customerAddress.Customer_Id,
                        Customer_Email = customerAddress.Customer_Email,
                        Customer_Phone = customerAddress.Customer_Phone,
                        OTP_Verified = 0,
                        Modified_Date = DateTime.Now.ToUniversalTime(),
                        Customer_Name = customerAddress.Customer_Name,
                        Customer_Active = customerAddress.Customer_Active,
                        Created_Date = DateTime.Now.ToUniversalTime(),
                        Created_By = customerAddress.Customer_Email
                    });
                    return dataContext.SaveChanges() > 0 ? true : false;
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
