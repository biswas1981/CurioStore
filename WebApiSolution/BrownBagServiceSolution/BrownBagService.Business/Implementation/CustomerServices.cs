using BrownBagService.Business.Interfaces;
using BrownBagService.DataAccess.DataContract;
using BrownBagService.Model;
using BrownBagService.Utility;
using System;
using System.Collections.Generic;
using System.Transactions;

namespace BrownBagService.Business.Implementation
{
    public class CustomerServices : ICustomerServices
    {
        public bool AddCustomer(CustomerBasicDetails customer)
        {
            try
            {

                using (var dataContract = new CustomerContract())
                {
                    using (var scope = new TransactionScope())
                    {

                        Guid customerId = Guid.NewGuid();
                        var isSaved = dataContract.AddNewCoustomer(customer, customerId);
                        if (isSaved)
                        {
                            new CustomerAttributeServices().AddCustomerAddress(customer, customerId);
                            new PasswordServices().CreateAccountPassword(customerId, customer.Password);
                            new OtpServicescs().SendOTP(new OtpDetailsModel { Email = customer.Email, RefCustomerGuid = customerId, CustomerName = customer.FirstName + " " + customer.LastName, Prupose = "RegisterUser" });
                        }
                        scope.Complete();

                        return true;
                    }
                }
            }
            catch
            {
                throw;
            }

        }
        public bool UpdateCustomer(Customer customer)
        {
            return true;
        }
        public Customer GetCustomer(string userId = "")
        {
            return new Customer();
        }

        public CustomerSummary GetCustomerSummaryByEmail(string email)
        {
            try
            {
                using (var dataContract = new CustomerContract())
                {
                    return dataContract.GetCustomerByEmail(email);
                }
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
                using (var dataContract = new CustomerContract())
                {
                    string encryptedPassword = CryptorEngine.Encrypt(password, true);
                    if (!string.IsNullOrEmpty(deviceId) && string.IsNullOrEmpty(email))
                    {
                        return dataContract.ChangeCustomerPassword(deviceId.Trim(), encryptedPassword, "");
                    }
                    else if (string.IsNullOrEmpty(deviceId) && !string.IsNullOrEmpty(email))
                    {
                        return dataContract.ChangeCustomerPassword("", encryptedPassword, email);
                    }
                    return false;
                }
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
                using (var dataContract = new CustomerContract())
                {
                    string encryptedPassword = CryptorEngine.Encrypt(password, true);
                    if (!string.IsNullOrEmpty(deviceId) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
                    {
                        return dataContract.CustomerLogIn(deviceId.Trim(), encryptedPassword, email);
                    }
                    return false;
                }
            }
            catch
            {
                throw;
            }
        }

        public bool CustomerLogOff(string deviceId)
        {
            try
            {
                using (var dataContract = new CustomerContract())
                {

                    if (!string.IsNullOrEmpty(deviceId))
                    {
                        return dataContract.CustomerLogOff(deviceId.Trim());
                    }
                    return false;
                }
            }
            catch
            {
                throw;
            }
        }


        public bool SaveBillingAddress(CustomerBillingAddress customerBillingAddress, string deviceNo)
        {
            try
            {
                using (var dataContract = new CustomerAttributeContract())
                {
                    if (!string.IsNullOrEmpty(deviceNo))
                    {
                        return dataContract.SaveBillingAddress(customerBillingAddress, deviceNo.Trim());
                    }
                    return false;
                }
            }
            catch
            {
                throw;
            }
        }

        public List<CustomerAddressDetails> GetAddresses(string deviceNo)
        {
            try
            {
                using (var dataContract = new CustomerAttributeContract())
                {
                    if (!string.IsNullOrEmpty(deviceNo))
                    {
                        return dataContract.GetAddresses(deviceNo.Trim());
                    }
                    return null;
                }
            }
            catch
            {
                throw;
            }
        }
        public bool DeleteAddress(string deviceNo, int id)
        {
            try
            {
                using (var dataContract = new CustomerAttributeContract())
                {
                    if (id>0)
                    {
                        return dataContract.DeleteAddress(deviceNo, id);
                    }
                    return false;
                }
            }
            catch
            {
                throw;
            }
        }

    }
}
