using BrownBagService.DataAccess.DataEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataInterfaces
{
   public interface IEmailConfigContract
    {
        List<EmailConfig> GetEmailConfig();
    }
}
