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
    
    public partial class OrderShipment
    {
        public int Id { get; set; }
        public string OrderID { get; set; }
        public Nullable<int> ProductID { get; set; }
        public Nullable<int> Ordered { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public Nullable<int> PickUp { get; set; }
        public Nullable<System.DateTime> PickUpDate { get; set; }
        public Nullable<int> InTransit { get; set; }
        public Nullable<System.DateTime> InTransitDate { get; set; }
        public Nullable<int> Delivered { get; set; }
        public Nullable<System.DateTime> DeliveredDate { get; set; }
        public Nullable<int> DeliveryFailed { get; set; }
        public Nullable<System.DateTime> DeliveryFailedDate { get; set; }
    }
}
