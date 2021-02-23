using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class Admin_TinNhan : System.Web.UI.Page
    {
        RSAManager rsa = new RSAManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            rsa.GenerateNewKeys(2048);
            getMess();
        }


        private void getMess()
        {
            DataTable dt = XLDL.GetData("select * from ThongTinLienHe where DaDuyet = 0");
            
            for(int i=0; i<dt.Rows.Count; i++)
            {
                Session["pri"] =  dt.Rows[i]["PriKey"];
                //Response.Write("<script>alert('"+ Session["pri"].ToString()+ "')</script>");
                //rsa._rsaPrivate.FromXmlString(pri);

                if (String.Compare(Session["Admin"].ToString(), dt.Rows[i]["admin"].ToString(), true) == 0)
                {
                    rsa._rsaPrivate.FromXmlString(Session["pri"].ToString());
                    dt.Rows[i]["CauHoi"] = rsa.DecryptWithPrivate(dt.Rows[i]["CauHoi"].ToString());
                }
            }
            //RSAManager._rsaPrivate.FromXmlString(dt.Rows[][]);
            //txtBanGhi.InnerText = RSAManager.DecryptWithPrivate(txtBanMa.InnerText);


            gvDSLH.DataSource = dt;
            gvDSLH.DataBind();
        }

        protected void gvDSLH_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}