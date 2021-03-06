//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BrownBagService.DataAccess.DataEntity
{
    using System;
    using System.Collections.Generic;
    
    public partial class Customer
    {
        public int Id { get; set; }
        public Nullable<System.Guid> CustomerGuid { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string EmailToRevalidate { get; set; }
        public string AdminComment { get; set; }
        public Nullable<int> IsTaxExempt { get; set; }
        public Nullable<int> AffiliateId { get; set; }
        public Nullable<int> VendorId { get; set; }
        public Nullable<int> HasShoppingCartItems { get; set; }
        public Nullable<int> RequireReLogin { get; set; }
        public Nullable<int> FailedLoginAttempts { get; set; }
        public Nullable<System.DateTime> CannotLoginUntilDateUtc { get; set; }
        public Nullable<int> Active { get; set; }
        public Nullable<int> Deleted { get; set; }
        public Nullable<int> IsSystemAccount { get; set; }
        public string SystemName { get; set; }
        public string LastIpAddress { get; set; }
        public Nullable<System.DateTime> CreatedOnUtc { get; set; }
        public Nullable<System.DateTime> LastLoginDateUtc { get; set; }
        public Nullable<System.DateTime> LastActivityDateUtc { get; set; }
        public Nullable<int> RegisteredInStoreId { get; set; }
        public Nullable<int> BillingAddress_Id { get; set; }
        public Nullable<int> ShippingAddress_Id { get; set; }
    }
}
