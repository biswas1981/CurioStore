using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Model
{
    public class EmailConfigModel
    {
        public int Id { get; set; }
        public string EmailAddress { get; set; }
        public string DisplayName { get; set; }
        public string Host { get; set; }
        public string Port { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string SendEmailTo { get; set; }
    }
}
