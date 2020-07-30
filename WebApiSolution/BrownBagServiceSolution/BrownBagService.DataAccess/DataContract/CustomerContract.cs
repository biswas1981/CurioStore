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
    public class CustomerContract : BaseDataContract, ICoustomerRegistration
    {
        public bool AddNewCoustomer(CustomerBasicDetails customerBasicDetails, Guid customerId)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    var customer = new BrownBagService.DataAccess.DataEntity.Customer
                    {
                        Active = 0,
                        AdminComment = null,
                        AffiliateId = 0,
                        IsTaxExempt = 0,
                        VendorId = 0,
                        CannotLoginUntilDateUtc = DateTime.Now.ToUniversalTime(),
                        Deleted = 0,
                        Email = customerBasicDetails.Email.Trim(),
                        EmailToRevalidate = null,
                        Username = customerBasicDetails.Email.Trim(),
                        CustomerGuid = customerId,
                        BillingAddress_Id = null,
                        FailedLoginAttempts = 0,
                        HasShoppingCartItems = 0,
                        IsSystemAccount = 0,
                        ShippingAddress_Id = null,
                        LastActivityDateUtc = DateTime.Now.ToUniversalTime(),
                        LastIpAddress = null,
                        LastLoginDateUtc = null,
                        RequireReLogin = 0,
                        RegisteredInStoreId = 1,
                        SystemName = null,
                        CreatedOnUtc = DateTime.Now.ToUniversalTime(),
                    };
                    dataContext.Customers.Add(customer);

                    int rowCount = dataContext.SaveChanges();
                    if (rowCount > 0)
                    {
                        dataContext.Customer_CustomerRole_Mapping.Add(new Customer_CustomerRole_Mapping { CustomerRole_Id = 3, Customer_Id = customer.Id });
                    }
                    return dataContext.SaveChanges() > 0 ? true : false;
                }
            }
            catch
            {
                throw;
            }
        }

        public CustomerSummary GetCustomerByEmail(string email)
        {
            try
            {
                var customerSummary = new CustomerSummary();
                using (var dataContext = new BrownBagDataEntities())
                {
                    var customerData = dataContext.Customers.Where(a => a.Email == email).ToList();
                    if (customerData != null && customerData.Count() > 0)
                    {
                        customerSummary.IsVerifiedCustomer = customerData.Where(a => a.Email == email && a.Active == 1).Count() > 0 ? true : false;
                        customerSummary.CustomerName = dataContext.CustomerAttributes.Where(a => a.Customer_Email == email).FirstOrDefault().Customer_Name ?? "";
                        customerSummary.CustomerId = customerData.FirstOrDefault().CustomerGuid.Value;
                    }
                    else
                    {
                        return null;
                    }
                }
                return customerSummary;
            }
            catch
            {
                throw;
            }
        }


        public bool ChangeCustomerPassword(string deviceId, string password, string email)
        {
            try
            {
                bool isSave = false;
                using (var dataContext = new BrownBagDataEntities())
                {

                    if (!string.IsNullOrEmpty(deviceId) && string.IsNullOrEmpty(email))
                    {
                        var deviceData = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceId).FirstOrDefault();
                        if (deviceData != null)
                        {
                            var passwordDetails = dataContext.CustomerPasswords.Where(a => a.CustomerId == deviceData.RefCustomerGuid).FirstOrDefault();
                            passwordDetails.Password = password;
                        }
                    }
                    else if (string.IsNullOrEmpty(deviceId) && !string.IsNullOrEmpty(email))
                    {
                        var emailData = dataContext.Customers.Where(a => a.Email == email).FirstOrDefault();
                        if (emailData != null)
                        {
                            var passwordDetails = dataContext.CustomerPasswords.Where(a => a.CustomerId == emailData.CustomerGuid
                            ).FirstOrDefault();
                            passwordDetails.Password = password;
                        }
                    }
                    isSave = dataContext.SaveChanges() > 0 ? true : false;
                }
                return isSave;
            }
            catch
            {
                throw;
            }
        }

        public bool CustomerLogIn(string deviceId, string password, string email)
        {
            try
            {
                bool isLogin = false;
                using (var dataContext = new BrownBagDataEntities())
                {
                    if (!string.IsNullOrEmpty(deviceId) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
                    {
                        var deviceData = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceId).FirstOrDefault();
                        var customerData = dataContext.Customers.Where(a => a.Email == email).FirstOrDefault();
                        if (customerData != null)
                        {
                            var passwordData = dataContext.CustomerPasswords.Where(a => a.Password == password && a.CustomerId == customerData.CustomerGuid).FirstOrDefault();
                            if (deviceData != null && passwordData!=null)
                            {
                                isLogin = true;
                                deviceData.RefCustomerGuid = customerData.CustomerGuid;
                            }
                        }
                    }
                    isLogin = dataContext.SaveChanges() > 0 ? true : false;
                }
                return isLogin;
            }
            catch
            {
                throw;
            }
        }

        //bool UpdateNewCoustomer(CustomerBasicDetails customerBasicDetails);
        //bool DeleteCoustomer(CustomerBasicDetails customerBasicDetails);
        //bool GetCoustomerById(string customerId);
        //bool GetLastCoustomerByImei(string imei);
    }
}
