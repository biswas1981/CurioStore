﻿using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Business.Interfaces
{
    public interface IOtpServicescs
    {
        bool SendOTP(OtpDetailsModel OtpDetailsModel);
        bool VerifyOTP(string otp, string email);
        
    }
}
