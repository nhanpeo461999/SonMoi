using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Lipstick_World
{
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static List<string> GetCompletionList(string pre)
        {
            List<string> TenSP = new List<string>();
            String sql = "select * from San_Pham where TenSP like '%" + pre + "%'";
            DataTable dtSP = XLDL.GetData(sql);
            
            foreach (DataRow dr in dtSP.Rows)
            {
                TenSP.Add(dr["TenSP"].ToString());
            }
            return TenSP;
        }
        public string HelloWorld()
        {
            return "Hello World";
        }
    }
}
