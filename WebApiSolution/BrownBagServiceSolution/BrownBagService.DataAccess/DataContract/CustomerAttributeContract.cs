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
    public class CustomerAttributeContract : BaseDataContract, ICustomerAttributeContract
    {
        public bool AddNewAddress(Model.CustomerDetailAttribute customerAddress)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    dataContext.CustomerAttributes.Add(new DataEntity.CustomerAttribute
                    {
                        Customer_Id = customerAddress.Customer_Id,
                        Customer_Email = customerAddress.Customer_Email,
                        Customer_Phone = customerAddress.Customer_Phone,
                        OTP_Verified = 0,
                        Modified_Date = DateTime.Now.ToUniversalTime(),
                        Customer_Name = customerAddress.Customer_Name,
                        Customer_Active = customerAddress.Customer_Active,
                        Created_Date = DateTime.Now.ToUniversalTime(),
                        Created_By = customerAddress.Customer_Email
                    });
                    return dataContext.SaveChanges() > 0 ? true : false;
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
                using (var dataContext = new BrownBagDataEntities())
                {
                    var device = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceNo).FirstOrDefault();
                    if (device == null)
                    {
                        return null;
                    }
                    if (device.RefCustomerGuid == null)
                    {
                        return null;
                    }
                    var addresses = dataContext.Addresses
                        .Where(a => a.CustomerGUID == device.RefCustomerGuid && a.Status == 1)
                        .Select(s => new CustomerAddressDetails
                        {
                            City = s.City ?? "",
                            Country = s.Country ?? "",
                            Id = s.Id,
                            State = s.State ?? "",
                            StreetAddress1 = s.StreetAddress1 ?? "",
                            StreetAddress2 = s.StreetAddress2 ?? "",
                            ZipCode = s.ZipCode ?? ""
                        }).ToList();

                    var relatedDetails = dataContext.Customers
                        .Where(a => a.CustomerGuid == device.RefCustomerGuid
                        && addresses.Any(b => b.Id == a.ShippingAddress_Id || b.Id == a.BillingAddress_Id))
                        .ToList();

                    if (relatedDetails != null && relatedDetails.Count() > 0)
                    {
                        addresses.ForEach(x =>
                        {
                            if (relatedDetails.Where(y => y.BillingAddress_Id == x.Id).Count() > 0)
                            {
                                x.UseAsBillingAddress = true;
                            }
                            if (relatedDetails.Where(y => y.ShippingAddress_Id == x.Id).Count() > 0)
                            {
                                x.UseAsShipingAddress = true;
                            }
                        });
                    }


                    return addresses;
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
                using (var dataContext = new BrownBagDataEntities())
                {
                    var addressEntity = new DataEntity.Address();
                    var device = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceNo).FirstOrDefault();
                    if (device == null)
                    {
                        return false;
                    }
                    if (device.RefCustomerGuid == null)
                    {
                        return false;
                    }
                    var customerOtherDetails = dataContext.CustomerAttributes.Where(a => a.Customer_Id == device.RefCustomerGuid).FirstOrDefault();
                    if (customerOtherDetails == null)
                    {
                        return false;
                    }
                    var nameSegments = customerOtherDetails.Customer_Name.Split(' ');
                    var firstName = "";
                    for (int i = 0; i < nameSegments.Length - 1; i++)
                    {
                        firstName += nameSegments[i].Trim() + " ";
                    }

                    if (customerBillingAddress != null)
                    {
                        if (customerBillingAddress.Id == 0)
                        {
                            addressEntity = new DataEntity.Address
                            {
                                Country = customerBillingAddress.Country,
                                CompanyName = "",
                                City = customerBillingAddress.City ?? "",
                                State = customerBillingAddress.State ?? "",
                                StreetAddress1 = customerBillingAddress.StreetAddress1,
                                StreetAddress2 = customerBillingAddress.StreetAddress2 ?? "",
                                ZipCode = customerBillingAddress.ZipCode ?? "",
                                CreatedOnUtc = DateTime.Now.ToUniversalTime(),
                                UpdatedOnUtc = DateTime.Now.ToUniversalTime(),
                                Status = 1,
                                CustomerGUID = device.RefCustomerGuid,
                                FirstName = firstName.Trim(),
                                LastName = nameSegments[nameSegments.Length - 1].Trim()
                            };
                            dataContext.Addresses.Add(addressEntity);
                        }
                        else
                        {
                            var selectedAddress = dataContext.Addresses.Where(a => a.Id == customerBillingAddress.Id).FirstOrDefault();
                            if (selectedAddress != null)
                            {
                                selectedAddress.Country = customerBillingAddress.Country ?? "";
                                selectedAddress.City = customerBillingAddress.City ?? "";
                                selectedAddress.State = customerBillingAddress.State ?? "";
                                selectedAddress.StreetAddress1 = customerBillingAddress.StreetAddress1 ?? "";
                                selectedAddress.StreetAddress2 = customerBillingAddress.StreetAddress2 ?? "";
                                selectedAddress.ZipCode = customerBillingAddress.ZipCode ?? "";
                                selectedAddress.CreatedOnUtc = DateTime.Now.ToUniversalTime();
                                selectedAddress.UpdatedOnUtc = DateTime.Now.ToUniversalTime();
                            }
                        }
                    }
                    var isSave = dataContext.SaveChanges() > 0 ? true : false;
                    if (customerBillingAddress.Id == 0 && dataContext.Addresses.Where(x => x.CustomerGUID == device.RefCustomerGuid).Count() == 1)
                    {
                        var customer = dataContext.Customers.Where(a => a.CustomerGuid == device.RefCustomerGuid).FirstOrDefault();
                        customer.ShippingAddress_Id = addressEntity.Id;
                        customer.BillingAddress_Id = addressEntity.Id;
                        dataContext.SaveChanges();
                    }
                    return isSave;
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
                using (var dataContext = new BrownBagDataEntities())
                {
                    var device = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceNo).FirstOrDefault();
                    if (device == null)
                    {
                        return false;
                    }
                    if (device.RefCustomerGuid == null)
                    {
                        return false;
                    }
                    var address = dataContext.Addresses
                        .Where(a => a.Id == id && a.CustomerGUID == device.RefCustomerGuid && a.Status == 1)
                        .FirstOrDefault();

                    var relatedDetail = dataContext.Customers
                        .Where(a => a.CustomerGuid == device.RefCustomerGuid
                        && a.ShippingAddress_Id == address.Id || a.BillingAddress_Id == address.Id)
                        .FirstOrDefault();

                    if (relatedDetail != null)
                    {
                        if (relatedDetail.BillingAddress_Id == address.Id)
                        {
                            relatedDetail.BillingAddress_Id = null;
                        }
                        if (relatedDetail.ShippingAddress_Id == address.Id)
                        {
                            relatedDetail.ShippingAddress_Id = null;
                        }

                    }
                    dataContext.Addresses.Remove(address);
                    dataContext.SaveChanges();
                    return true;
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
