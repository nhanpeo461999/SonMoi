using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        RSAManager rsa = new RSAManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            rsa.GenerateNewKeys(2048);
            //lbPriKey.Text = Session["pri"].ToString();
            //txtBanMa.InnerText = Session["banma"].ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            rsa._rsaPrivate.FromXmlString(txtBanMa.InnerText);
            lbPriKey.Text = rsa.DecryptWithPrivate(txtBanGhi.InnerText);

        }
    }
}