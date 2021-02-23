using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Lipstick_World
{
    public class XLDL
    {
        public static string strCon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString.ToString();

        public static DataTable GetData(string lenhSql)
        {
            SqlConnection sqlCon = new SqlConnection(strCon);
            /*try
            {*/
                SqlDataAdapter sqlDa = new SqlDataAdapter(lenhSql, sqlCon);
                DataTable dt = new DataTable();
                sqlDa.Fill(dt);
                return dt;
/*            }
            catch(Exception ex)
            {
                throw ex;
            }*/
        }

        public static void Execute(string lenhSql)
        {
            using (SqlConnection sqlCon = new SqlConnection(strCon))
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand(lenhSql, sqlCon);
                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();
            }
        }

    }
}