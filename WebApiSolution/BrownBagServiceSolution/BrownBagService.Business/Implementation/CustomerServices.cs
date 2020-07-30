﻿using BrownBagService.Business.Interfaces;
using BrownBagService.DataAccess.DataContract;
using BrownBagService.Model;
using BrownBagService.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
                        return dataContract.ChangeCustomerPassword(deviceId.Trim(), encryptedPassword ,"");
                    }
                    else if(string.IsNullOrEmpty(deviceId) && !string.IsNullOrEmpty(email))
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
                        return dataContract.ChangeCustomerPassword(deviceId.Trim(), encryptedPassword, "");
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
