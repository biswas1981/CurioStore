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
                smtp.Timeout = 1000000;
                smtp.Host = host; //Gmail
                smtp.EnableSsl = false;
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
            AlternateView AV =
           AlternateView.CreateAlternateViewFromString(mailBody, null, MediaTypeNames.Text.Html);

            string path = System.Web.Hosting.HostingEnvironment.MapPath(@"~/Resource/otp.png");
            LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
            Img.ContentId = "MyImage"; 
           

            string twitterpath = System.Web.Hosting.HostingEnvironment.MapPath(@"~/Resource/tw.gif");
            LinkedResource twitterImg = new LinkedResource(twitterpath, MediaTypeNames.Image.Jpeg);
            twitterImg.ContentId = "twitterImage";

            string facebookpath = System.Web.Hosting.HostingEnvironment.MapPath(@"~/Resource/fb.gif");
            LinkedResource facebookImg = new LinkedResource(facebookpath, MediaTypeNames.Image.Jpeg);
            facebookImg.ContentId = "facebookImage";


            AV.LinkedResources.Add(Img);
            AV.LinkedResources.Add(twitterImg);
            AV.LinkedResources.Add(facebookImg);
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
