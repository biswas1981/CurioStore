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
    
    public partial class ShoppingCartItem
    {
        public int Id { get; set; }
        public Nullable<System.Guid> Customer_Id { get; set; }
        public Nullable<int> ProductId { get; set; }
        public Nullable<int> Quantity { get; set; }
        public string Currency { get; set; }
        public Nullable<decimal> ProductPrice { get; set; }
        public Nullable<decimal> RevisedPrice { get; set; }
        public Nullable<System.DateTime> CreatedOnUtc { get; set; }
        public Nullable<System.DateTime> UpdatedOnUtc { get; set; }
    }
}
