using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World.UC
{
    public partial class footer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String email = txtEmail.Value;
            string smtpUserName = "soncucdep@gmail.com";
            string smtpPassword = "Thythy1234";
            string smtpHost = "smtp.gmail.com";
            int smtpPort = 25;

            string emailTo = email;
            string subject = "Vương quốc son môi";
            string body = string.Format("Chúng tôi sẽ sớm liên lạc với bạn! Cảm ơn bạn đã ghé thăm shop!");

            MailUtils service = new MailUtils();
            bool kq = service.Send(smtpUserName, smtpPassword, smtpHost, smtpPort, emailTo, subject, body);
        }
    }
}