using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Model
{
    public class CustomerAttribute
    {
        public int Id { get; set; }
        public Nullable<System.Guid> Customer_Id { get; set; }
        public string Customer_Name { get; set; }
        public string Customer_Email { get; set; }
        public string Customer_Phone { get; set; }
        public string Customer_Address { get; set; }
        public string Customer_Address2 { get; set; }
        public string Customer_Zip { get; set; }
        public Nullable<int> OTP_Verified { get; set; }
        public Nullable<int> Customer_Active { get; set; }
        public Nullable<System.DateTime> Created_Date { get; set; }
        public string Created_By { get; set; }
        public Nullable<System.DateTime> Modified_Date { get; set; }
        public string Modified_By { get; set; }
    }
}
