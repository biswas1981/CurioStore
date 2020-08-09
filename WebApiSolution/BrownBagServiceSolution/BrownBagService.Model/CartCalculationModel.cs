using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Model
{
    public class CartCalculationModel
    {
        public decimal SubTotal { get; set; }
        public List<TaxComponant> TaxHeads { get; set; }
        public decimal TaxTotal { get; set; }
        public decimal ShippingValue { get; set; }
        public decimal Discount { get; set; }
        public decimal TotalAmount { get; set; }
    }
    public class TaxComponant
    {
        public int TaxHeadId { get; set; }
        public string TaxHeadName { get; set; }
        public decimal TaxPercentage { get; set; }
    }
}
