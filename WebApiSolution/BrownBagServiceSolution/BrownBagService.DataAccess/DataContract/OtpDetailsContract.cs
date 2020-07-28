
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
    public class OtpDetailsContract : BaseDataContract, IOtpDetailsContract
    {
        public bool AddNewOTP(OtpDetailsModel OtpDetailsModel)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    dataContext.OtpDetails.Add(new DataEntity.OtpDetail
                    {
                        Email = OtpDetailsModel.Email,
                        ExpiryDate = OtpDetailsModel.ExpiryDate,
                        IsActive = OtpDetailsModel.IsActive,
                        IsVerified = OtpDetailsModel.IsVerified,
                        OTP = OtpDetailsModel.OTP,
                        Prupose = OtpDetailsModel.Prupose,
                        IssueDate = OtpDetailsModel.IssueDate,
                        RefCustomerGuid = OtpDetailsModel.RefCustomerGuid
                    });
                    return dataContext.SaveChanges() > 0 ? true : false;
                }
            }
            catch
            {
                throw;
            }
        }

        public bool UpdateOTP(OtpDetailsModel OtpDetailsModel)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    var otp = dataContext.OtpDetails.Where(a => a.Id == OtpDetailsModel.Id).FirstOrDefault();

                    otp.ExpiryDate = OtpDetailsModel.ExpiryDate;
                    otp.IsActive = OtpDetailsModel.IsActive;
                    otp.IsVerified = OtpDetailsModel.IsVerified;
                    otp.IssueDate = OtpDetailsModel.IssueDate;

                    return dataContext.SaveChanges() > 0 ? true : false;
                }
            }
            catch
            {
                throw;
            }
        }

        public OtpDetail GetUnverifiedOtp(string email)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    DateTime currentTime = DateTime.Now.ToUniversalTime();
                    var latestOtp = dataContext.OtpDetails
                        .Where(a => a.Email == email
                        && a.IsActive == true
                        && a.IsVerified == false
                        && a.IssueDate < currentTime && a.ExpiryDate > currentTime)
                        .OrderByDescending(o => o.Id).FirstOrDefault();
                    if (latestOtp != null)
                    {
                        return latestOtp;
                    }
                    else
                    {
                        return null;
                    }

                }
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
                using (var dataContext = new BrownBagDataEntities())
                {
                    DateTime currentTime = DateTime.Now.ToUniversalTime();
                    var latestOtp = dataContext.OtpDetails
                        .Where(a => a.Email == email
                        && a.OTP == otp
                        && a.IsActive == true
                        && a.IsVerified == false
                        && a.IssueDate < currentTime && a.ExpiryDate > currentTime)
                        .OrderByDescending(o => o.Id).FirstOrDefault();
                    if (latestOtp != null)
                    {
                        latestOtp.IsActive = false;
                        latestOtp.IsVerified = true;
                        int rows = dataContext.SaveChanges();
                        if (rows > 0)
                        {
                            var customer = dataContext.Customers.Where(a => a.CustomerGuid == latestOtp.RefCustomerGuid).FirstOrDefault();
                            if (customer != null)
                            {
                                customer.Active = 1;
                                customer.LastActivityDateUtc = DateTime.Now.ToUniversalTime();
                                dataContext.SaveChanges();
                            }
                            var customerProfile = dataContext.CustomerAttributes.Where(a => a.Customer_Id == latestOtp.RefCustomerGuid).FirstOrDefault();
                            if (customerProfile != null)
                            {
                                customerProfile.OTP_Verified = 1;
                                customerProfile.Modified_Date = DateTime.Now.ToUniversalTime();
                                dataContext.SaveChanges();
                            }
                        }
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                }
            }
            catch
            {
                throw;
            }
        }
    }
}
