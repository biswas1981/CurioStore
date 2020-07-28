using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataInterfaces
{
    public interface IPasswordContract
    {
        bool AddNewCustomerPassword(Guid customerId, string password);
    }
}
