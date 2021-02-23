using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Lipstick_World
{
    public class  XuLyDonHang
    {
        public static void  getDonDatHang(int daThanhToan, String sdt, String hoten, String maDH, Decimal TongThanhTien, String datetime, DataTable dt, String email, String diachi, int TrangThai)
        {
            String maSP;
            int soluong;
            String insert_DonHang = "INSERT INTO DonDatHang (SDT, TaiKhoan, MaDH, TongTien, NgayDatHang, TrangThai, ThanhToan, Choduyet, email, diachi)" +
                "VALUES(" +
                "'" + sdt + "'" +
                ",'" + hoten + "'" +
                ",'" + maDH + "'" +
                "," + TongThanhTien + "" +
                ",'" + datetime + "'" +
                ",0" +
                "," + daThanhToan +
                ",0" +
                ",'"+email+"'" +
                ",N'"+diachi+"')";
            String insert_CT_DH;
            String update_SP;
            XLDL.GetData(insert_DonHang);
            foreach (DataRow dr in dt.Rows)
            {
                DataTable up_SP = new DataTable();
                int daban = 0;
                int conlai = 0;
                maSP = dr["MaSP"].ToString();
                soluong = int.Parse(dr["SoLuong"].ToString());
                insert_CT_DH = "insert into CT_DonHang (MaDH,MaSP,SoLuong)" +
                    "values(" +
                    "'" + maDH + "'" +
                    ",'" + maSP + "'" +
                    "," + soluong + ")";

                up_SP = XLDL.GetData("select * from San_Pham where Ma_SP ='" + maSP + "'");

                daban = int.Parse(up_SP.Rows[0]["DaBan"].ToString());
                conlai = int.Parse(up_SP.Rows[0]["SoLuong"].ToString());
                daban += soluong;
                conlai -= soluong;
                update_SP = "UPDATE San_Pham" +
                    " SET DaBan = " + daban + ", SoLuong = " + conlai +
                    " WHERE Ma_SP ='" + maSP + "'";

                XLDL.GetData(insert_CT_DH);
                XLDL.GetData(update_SP);
            }
        }

        public static void getCart(DataTable dt,ref Decimal TongThanhTien)
        {
            foreach (DataRow r in dt.Rows)
            {
                r["ThanhTien"] = Convert.ToInt32(r["SoLuong"]) * Convert.ToDecimal(r["DonGia"]);
                TongThanhTien += Convert.ToDecimal(r["ThanhTien"]);
            }
        }
    }
}