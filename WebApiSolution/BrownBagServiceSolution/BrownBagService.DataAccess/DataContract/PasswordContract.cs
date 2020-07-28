using BrownBagService.DataAccess.DataEntity;
using BrownBagService.DataAccess.DataInterfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataContract
{
    public class PasswordContract : BaseDataContract, IPasswordContract
    {
        public bool AddNewCustomerPassword(Guid customerId, string password)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    dataContext.CustomerPasswords.Add(new DataEntity.CustomerPassword
                    {
                        CustomerId = customerId,
                        Password = password,
                        PasswordFormatId = 1,
                        CreatedOnUtc = DateTime.Now.ToUniversalTime(),
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
