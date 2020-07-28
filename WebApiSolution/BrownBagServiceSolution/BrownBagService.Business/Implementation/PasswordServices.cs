using BrownBagService.Business.Interfaces;
using BrownBagService.DataAccess.DataContract;
using BrownBagService.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Business.Implementation
{
    public class PasswordServices : IPasswordServices
    {
        public bool CreateAccountPassword(Guid customerId, string password)
        {
            try
            {
                string encryptedPassword = CryptorEngine.Encrypt(password, true);
                using (var dataContract = new PasswordContract())
                {
                    return dataContract.AddNewCustomerPassword(customerId, encryptedPassword);

                }
            }
            catch
            {
                throw;
            }
        }
    }
}
