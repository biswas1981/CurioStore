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
    
    public partial class ProductImage
    {
        public int Id { get; set; }
        public Nullable<int> ProductID { get; set; }
        public string ImageURL { get; set; }
        public string ThumbImageURL { get; set; }
        public string GalleryImageURL { get; set; }
        public Nullable<int> Sequences { get; set; }
        public Nullable<System.DateTime> CreatedOnUtc { get; set; }
        public Nullable<System.DateTime> UpdatedOnUtc { get; set; }
    }
}
