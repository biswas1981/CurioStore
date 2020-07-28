using BrownBagService.Business.Interfaces;
using BrownBagService.DataAccess.DataContract;
using BrownBagService.Model;
using BrownBagService.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Business.Implementation
{
    public class EmailConfigServices : IEmailConfigServices
    {
        public EmailConfigModel GetEmailConfig()
        {
            try
            {
                using (var dataContract = new EmailConfigContract())
                {
                    return dataContract.GetEmailConfig().Select(s => new EmailConfigModel
                    {
                        DisplayName = s.DisplayName ?? "",
                        EmailAddress = s.EmailAddress ?? "",
                        Host = s.Host ?? "",
                        Id = s.Id,
                        //Password = CryptorEngine.Decrypt(s.Password ?? "", true),
                        Password = "Password@1234567890",
                        Port = s.Port ?? "",
                        SendEmailTo = s.SendEmailTo ?? "",
                        UserName = s.UserName ?? ""
                    }).FirstOrDefault();
                }
            }
            catch
            {
                throw;
            }

        }
    }
}
