using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Model
{
    public class Customer
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime UpdatedOn { get; set; }
    }


    public class CustomerBasicDetails
    {
        [Required(ErrorMessage = "First Name is required")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "Last Name is required")]
        public string LastName { get; set; }
        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required]
        [StringLength(18, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [RegularExpression(@"^((?=.*[a-z])(?=.*[A-Z])(?=.*\d)).+$")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required(ErrorMessage = "Mobile Number is required.")]
        [RegularExpression(@"^([0-9]{10})$", ErrorMessage = "Please Enter Valid Mobile Number.")]
        public string PhoneNumber { get; set; }
    }


    public class CustomerSummary
    {
        public bool IsVerifiedCustomer { get; set; }
        public string CustomerName { get; set; }
        public string CustomerContactNumber { get; set; }
        public string CustomerEmail { get; set; }
        public Guid CustomerId { get; set; }
    }

    public class CustomerChangePassword
    {
        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required]
        [StringLength(18, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [RegularExpression(@"^((?=.*[a-z])(?=.*[A-Z])(?=.*\d)).+$")]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }
        public bool IsForgetPassword { get; set; }
    }


    public class LogInModel
    {
        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required]
        [StringLength(18, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [RegularExpression(@"^((?=.*[a-z])(?=.*[A-Z])(?=.*\d)).+$")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

    }



    public class CustomerBillingAddress
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Country name is required")]
        public string Country { get; set; }
        [Required(ErrorMessage = "Address line 1 is required")]
        public string StreetAddress1 { get; set; }
        public string StreetAddress2 { get; set; }
        [Required(ErrorMessage = "City name is required")]
        public string City { get; set; }
        [Required(ErrorMessage = "Sate name is required")]
        public string State { get; set; }
        [Required(ErrorMessage = "Zip code is required")]
        public string ZipCode { get; set; }
    }

    public class CustomerAddressDetails : CustomerBillingAddress
    {
        public bool UseAsShipingAddress { get; set; }
        public bool UseAsBillingAddress { get; set; }
    }


}
