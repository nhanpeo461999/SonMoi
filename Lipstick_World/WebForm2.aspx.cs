using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml;
using WebApplication2;
using OpenFileDialog = Microsoft.Win32.OpenFileDialog;
using SaveFileDialog = Microsoft.Win32.SaveFileDialog;

namespace Lipstick_World
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        RSAManager rsa = new RSAManager();
        protected SaveFileDialog saveFileDialog = new SaveFileDialog();
        protected OpenFileDialog openFileDialog = new OpenFileDialog();
        String privateK;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            txtBanGhi2.InnerText = rsa.DecryptWithPrivate(txtBanMa.InnerText);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txtBanMa.InnerText = rsa.EncryptWithPublic(txtBanGhi1.InnerText);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            txtPuK.InnerText = "";
            txtPrK.InnerText = "";


            rsa.GenerateNewKeys(512);
            txtPuK.InnerText = rsa.rsaCrypto.ToXmlString(false);
            txtPrK.InnerText = rsa.rsaCrypto.ToXmlString(true);

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            privateK = rsa.rsaCrypto.ToXmlString(true);
            Session["pri"] = privateK;
            Session["banma"] = txtBanMa.InnerText;
            Response.Redirect("WebForm3.aspx?");

        }
    }
}