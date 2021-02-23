using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World.Admin
{
    public partial class ucHeader_Admin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbDX.Visible = false;
            lbTK.Visible = false;
            if(Session["Admin"] != null)
            {
                lbDX.Visible = true;
                lbTK.Text = Session["Admin"].ToString();
                lbTK.Visible = true;
                lbDN.Visible = false;
            }
            else
            {
                lbDX.Visible = false;
                //lbTK.Text = Session["Admin"].ToString();
                lbTK.Visible = false;
                lbDN.Visible = true;
            }

            lbTN.Text = countMess().ToString();
        }

        protected void aDX_Click(object sender, EventArgs e)
        {
            lbDX.Visible = false;
            //lbTK.Text = Session["Admin"].ToString();
            lbTK.Visible = false;
            lbDN.Visible = true;
        }

        private int countMess()
        {
            DataTable dt = new DataTable();
            dt = XLDL.GetData("select * from ThongTinLienHe where DaDuyet = 0");
            return int.Parse(dt.Rows.Count.ToString());

        }
    }
}