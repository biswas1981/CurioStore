using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Model
{
    public class OtpDetailsModel
    {
        public string CustomerName { get; set; }
        public int Id { get; set; }
        public System.Guid RefCustomerGuid { get; set; }
        public string Email { get; set; }
        public string OTP { get; set; }
        public bool IsActive { get; set; }
        public bool IsVerified { get; set; }
        public System.DateTime IssueDate { get; set; }
        public System.DateTime ExpiryDate { get; set; }
        public string Prupose { get; set; }
    }
}
