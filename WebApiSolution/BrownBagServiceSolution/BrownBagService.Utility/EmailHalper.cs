using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BrownBagService.Utility
{
    public class EmailHalper
    {
        public static bool SendEmail(string host, string userName, string password, string recipientAddress, string recipientName, string otp)
        {
            try
            {
                string fromaddress = userName;
                string frompassword = password;
                string body = string.Empty;
                body = PopulateBody(otp) ;
                MailMessage mm = new MailMessage(fromaddress, recipientAddress);
                mm.Subject = "OTP";
                mm.Body = body;
                mm.IsBodyHtml = true;
                mm.AlternateViews.Add(Mail_Body(body));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = host; //Gmail
                smtp.EnableSsl = true;
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = fromaddress;
                NetworkCred.Password = frompassword;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 25;  //gmail
                smtp.Send(mm);
                return true;
            }
            catch
            {
                throw;
            }
        }


        private static AlternateView Mail_Body(string mailBody)
        {
            string path = System.Web.Hosting.HostingEnvironment.MapPath(@"~/Resource/otp.png");
            LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
            Img.ContentId = "MyImage"; 
            AlternateView AV =
            AlternateView.CreateAlternateViewFromString(mailBody, null, MediaTypeNames.Text.Html);
            AV.LinkedResources.Add(Img);
            return AV;
        }
        private static string PopulateBody(string otp)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(System.Web.Hosting.HostingEnvironment.MapPath(@"~/App_Data/otpTemplate.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{otpValue}", otp);
            return body;
        }      
    }
}
