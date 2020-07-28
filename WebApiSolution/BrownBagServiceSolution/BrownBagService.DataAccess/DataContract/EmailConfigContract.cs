using BrownBagService.DataAccess.DataEntity;
using BrownBagService.DataAccess.DataInterfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataContract
{
    public class EmailConfigContract : BaseDataContract, IEmailConfigContract
    {
        public List<EmailConfig> GetEmailConfig()
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    return dataContext.EmailConfigs.ToList();
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
