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
    
    public partial class ProductTier
    {
        public int Id { get; set; }
        public Nullable<int> ProductID { get; set; }
        public string Quantity { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<decimal> Price_USD { get; set; }
        public Nullable<decimal> Price_EURO { get; set; }
        public Nullable<decimal> Price_GBP { get; set; }
        public Nullable<System.DateTime> CreatedOnUtc { get; set; }
        public Nullable<System.DateTime> UpdatedOnUtc { get; set; }
    }
}
