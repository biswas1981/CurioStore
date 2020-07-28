using BrownBagService.DataAccess.DataEntity;
using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataInterfaces
{
    public interface IOtpDetailsContract
    {
        bool AddNewOTP(OtpDetailsModel OtpDetailsModel);
        bool UpdateOTP(OtpDetailsModel OtpDetailsModel);
        bool VerifyOTP(string otp, string email);
        OtpDetail GetUnverifiedOtp(string email);
    }
}
