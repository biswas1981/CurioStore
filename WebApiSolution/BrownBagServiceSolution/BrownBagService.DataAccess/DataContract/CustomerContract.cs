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

                    int rowCount =dataContext.SaveChanges();
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
        //bool UpdateNewCoustomer(CustomerBasicDetails customerBasicDetails);
        //bool DeleteCoustomer(CustomerBasicDetails customerBasicDetails);
        //bool GetCoustomerById(string customerId);
        //bool GetLastCoustomerByImei(string imei);
    }
}
