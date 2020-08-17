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
    public class OtpServicescs : IOtpServicescs
    {
        public bool SendOTP(OtpDetailsModel OtpDetailsModel)
        {
            string OtpCharacters = string.Empty;
            string OTPPassword = string.Empty;
            bool isSave = false;
            try
            {
                using (var dataContract = new OtpDetailsContract())
                {
                    var otp = dataContract.GetUnverifiedOtp(OtpDetailsModel.Email);
                    OtpDetailsModel.IssueDate = DateTime.Now.ToUniversalTime();
                    OtpDetailsModel.ExpiryDate = DateTime.Now.AddMinutes(30).ToUniversalTime();
                    OtpDetailsModel.IsVerified = false;
                    OtpDetailsModel.IsActive = true;
                    
                    if (otp == null)
                    {
                        Random rng = new Random();
                        OtpCharacters = OTPGenerate.OTPCharacters();
                        OTPPassword = OTPGenerate.OTPGenerator(OtpCharacters, rng.Next(10).ToString());
                        OtpDetailsModel.OTP = OTPPassword;
                        isSave =dataContract.AddNewOTP(OtpDetailsModel);
                    }
                    else
                    {
                        OtpDetailsModel.OTP = otp.OTP;
                        OtpDetailsModel.Id = otp.Id;
                        isSave = dataContract.UpdateOTP(OtpDetailsModel);
                    }
                }
                if (isSave)
                {
                    var config = new EmailConfigServices().GetEmailConfig();
                    EmailHalper.SendEmail(config.Host, config.UserName, config.Password, OtpDetailsModel.Email, OtpDetailsModel.CustomerName, OtpDetailsModel.OTP);
                }
                return isSave;
            }
            catch
            {
                throw;
            }
        }
        public bool VerifyOTP(string otp, string email)
        {
            try
            {
                using (var dataContract = new OtpDetailsContract())
                {
                    return dataContract.VerifyOTP(otp, email);
                }
            }
            catch
            {
                throw;
            }
        }
        
    }
}
