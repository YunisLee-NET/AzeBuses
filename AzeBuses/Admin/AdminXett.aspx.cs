using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AzeBuses.Admin
{
    public partial class AdminDayanacaq : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetDasiyici();
                GetBusTable();
                if (ViewState["ID"] == null)
                {
                    ViewState["ID"] = 0;
                }

                if (ViewState["axtar"] == null)
                {
                    ViewState["axtar"] = 0;
                }
            }
        }


        void GetBusTable()
        {
            DataTable dt = klas.getdatatable("Select * from TB_Bus1 order by Sira");
            RP_XettCedvel.DataSource = dt;
            RP_XettCedvel.DataBind();
        }

        protected void DDLAdminXett_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        void GetDasiyici()
        {
            DDL_AdminDasiyici.DataValueField = "DasiyiciID";
            DDL_AdminDasiyici.DataTextField = "DasiyiciAd";
            DDL_AdminDasiyici.DataSource = klas.getdatatable("Select * from TB_Dasiyici");
            DDL_AdminDasiyici.DataBind();
            DDL_AdminDasiyici.Items.Insert(0, new ListItem("Daşıyıcını seçin", "0"));
        }

        protected void DDL_AdminDasiyici_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = klas.getdatatable("Select * from TB_Dasiyici where DasiyiciID=" + DDL_AdminDasiyici.SelectedValue.ToString());
            RP_XettCedvel.DataSource = dt;
            RP_XettCedvel.DataBind();
        }

        protected void RP_XettCedvel_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string ID = e.CommandArgument.ToString();
            if (e.CommandName == "edit")
            {
                DataRow dr = klas.getdatatable("Select * from TB_Bus1 where ID=" + ID).Rows[0];
                txtBusNo.Text = dr["MarsrutNo"].ToString();
                txt1stStop.Text = dr["Baslangic"].ToString();
                txtSonStop.Text = dr["Son"].ToString();
                txtInterval.Text = dr["Interval"].ToString();
                txtGedisHaqqi.Text = dr["Gedis_haqqi"].ToString();
                txtVaxt.Text = dr["Vaxt_qrafiki"].ToString();
                txtSay.Text = dr["Avtobus_sayi"].ToString();
                txtModel.Text = dr["Avtobus_modeli"].ToString();
                DDL_AdminDasiyici.SelectedValue = dr["DasiyiciID"].ToString();
                imgbusfoto.ImageUrl = @"..\logo\" + dr["Sekil"].ToString();
                ViewState["Foto"] = dr["Sekil"].ToString();
                txtSira.Text = dr["Sira"].ToString();
                ViewState["ID"] = e.CommandArgument.ToString();
            }
            else if (e.CommandName == "sil")
            {
                SqlCommand cmd = new SqlCommand("Delete from TB_Bus1 where ID=" + e.CommandArgument.ToString(), klas.baglanti);
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetBusTable();
            }

        }

        protected void lnkOk_Click(object sender, EventArgs e)
        {
            if (txtBusNo.Text != "" && txt1stStop.Text != "" && txtSonStop.Text != "" && txtInterval.Text != "" && txtGedisHaqqi.Text != "" && txtVaxt.Text != "" && txtSay.Text != "" && txtModel.Text != "" && txtSira.Text != "")
            {
                if (ViewState["ID"].ToString() == "0")
                {
                    SqlCommand cmd = new SqlCommand(@"Insert into TB_Bus1 (MarsrutNo, Baslangic, Son, Interval, Gedis_haqqi, Vaxt_qrafiki, Avtobus_sayi, Avtobus_modeli, Dasiyici_sirket, Sekil, Sira) values (@MarsrutNo, @Baslangic, @Son, @Interval, @Gedis_haqqi, @Vaxt_qrafiki, @Avtobus_sayi, @Avtobus_modeli, @Dasiyici_sirket, @Sekil, @Sira)", klas.baglanti);
                    cmd.Parameters.AddWithValue("MarsrutNo", txtBusNo.Text);
                    cmd.Parameters.AddWithValue("Baslangic", txt1stStop.Text);
                    cmd.Parameters.AddWithValue("Son", txtSonStop.Text);
                    cmd.Parameters.AddWithValue("Interval", txtInterval.Text);
                    cmd.Parameters.AddWithValue("Gedis_haqqi", txtGedisHaqqi.Text);
                    cmd.Parameters.AddWithValue("Vaxt_qrafiki", txtVaxt.Text);
                    cmd.Parameters.AddWithValue("Avtobus_sayi", txtSay.Text);
                    cmd.Parameters.AddWithValue("Avtobus_modeli", txtModel.Text);
                    cmd.Parameters.AddWithValue("Dasiyici_sirket", DDL_AdminDasiyici.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("Sekil", fileimg.FileName);
                    cmd.Parameters.AddWithValue("Sira", txtSira.Text);
                    klas.baglanti.Open();
                    cmd.ExecuteNonQuery();
                    klas.baglanti.Close();
                    GetBusTable();
                    fileimg.SaveAs(Server.MapPath(@"\logo\" + fileimg.FileName));
                    txtBusNo.Text = "";
                    txt1stStop.Text = "";
                    txtSonStop.Text = "";
                    txtInterval.Text = "";
                    txtGedisHaqqi.Text = "";
                    txtVaxt.Text = "";
                    txtSay.Text = "";
                    txtModel.Text = "";
                    txtSira.Text = "";
                }

                else
                {
                    string fotoname;
                    fotoname = ViewState["Foto"].ToString();
                    if (fileimg.HasFile)
                    {
                        fotoname = fileimg.FileName;
                        fileimg.SaveAs(Server.MapPath(@"..\logo\" + fileimg.FileName));
                    }
                    SqlCommand cmd = new SqlCommand(@"Update  TB_Bus1 set MarsrutNo=@MarsrutNo, Baslangic=@Baslangic, Son=@Son, Interval=@Interval, Gedis_haqqi=@Gedis_haqqi, Vaxt_qrafiki=@Vaxt_qrafiki, Avtobus_sayi=@Avtobus_sayi, Avtobus_modeli=@Avtobus_modeli, Dasiyici_sirket=@Dasiyici_sirket, Sekil=@Sekil, Sira=@Sira where ID=" + ViewState["ID"].ToString(), klas.baglanti);

                    cmd.Parameters.AddWithValue("MarsrutNo", txtBusNo.Text);
                    cmd.Parameters.AddWithValue("Baslangic", txt1stStop.Text);
                    cmd.Parameters.AddWithValue("Son", txtSonStop.Text);
                    cmd.Parameters.AddWithValue("Interval", txtInterval.Text);
                    cmd.Parameters.AddWithValue("Gedis_haqqi", txtGedisHaqqi.Text);
                    cmd.Parameters.AddWithValue("Vaxt_qrafiki", txtVaxt.Text);
                    cmd.Parameters.AddWithValue("Avtobus_sayi", txtSay.Text);
                    cmd.Parameters.AddWithValue("Avtobus_modeli", txtModel.Text);
                    cmd.Parameters.AddWithValue("Dasiyici_sirket", DDL_AdminDasiyici.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("Sekil", fileimg.FileName);
                    cmd.Parameters.AddWithValue("Sira", txtSira.Text);

                    //cmd.Parameters.AddWithValue("Marşrutun №-si", txtBusNo.Text);
                    //cmd.Parameters.AddWithValue("Başlanğıc məntəqə", txt1stStop.Text);
                    //cmd.Parameters.AddWithValue("Son məntəqə", txtSonStop.Text);
                    //cmd.Parameters.AddWithValue("İnterval", txtInterval.Text);
                    //cmd.Parameters.AddWithValue("Gediş haqqı", txtGedisHaqqi.Text);
                    //cmd.Parameters.AddWithValue("Vaxt qrafiki", txtVaxt.Text);
                    //cmd.Parameters.AddWithValue("Avtobus sayı", txtSay.Text);
                    //cmd.Parameters.AddWithValue("Avtobus modeli", txtModel.Text);
                    //cmd.Parameters.AddWithValue("Daşıyıcı şirkət", DDL_AdminDasiyici.SelectedValue.ToString());
                    //cmd.Parameters.AddWithValue("LogoURL", fileimg.FileName);
                    //cmd.Parameters.AddWithValue("Sıra", txtSira.Text);
                    //cmd.Parameters.AddWithValue("Şəkil", fotoname);
                    klas.baglanti.Open();
                    cmd.ExecuteNonQuery();
                    klas.baglanti.Close();
                    GetBusTable();
                    txtBusNo.Text = "";
                    txt1stStop.Text = "";
                    txtSonStop.Text = "";
                    txtInterval.Text = "";
                    txtGedisHaqqi.Text = "";
                    txtVaxt.Text = "";
                    txtSay.Text = "";
                    txtModel.Text = "";
                    txtSira.Text = "";
                    ViewState["ID"] = 0;
                }

            }




            else
            {
                Response.Write("<script>alert('Hörmətli admin qardaş. Məlumat daxil etmədiyiviz üçün məlumatı bazaya göndərə bilmirüy.')</script>");
            }


        }

        void GetAxtar()
        {
            string axtar = "Select * from TB_Bus1 where MarsrutNo like N'%" + txtAxtar.Text + "%' or Baslangic like N'%" + txtAxtar.Text + "%' or Son like N'%" + txtAxtar.Text + "%' or Interval like '" + txtAxtar.Text + "' or Gedis_haqqi like '%" + txtAxtar.Text + "%' or Vaxt_qrafiki like '%" + txtAxtar.Text + "%' or Avtobus_sayi like '%" + txtAxtar.Text + "%' or Avtobus_modeli like N'%" + txtAxtar.Text + "%' or Dasiyici_sirket like N'" + txtAxtar.Text + "'";
            SqlDataAdapter dap = new SqlDataAdapter(axtar, klas.baglanti);
            DataTable dt = new DataTable();
            dap.Fill(dt);
            RP_XettCedvel.DataSource = dt;
            RP_XettCedvel.DataBind();
            txtAxtar.Text = "";
        }

        protected void txtAxtar_TextChanged(object sender, EventArgs e)
        {
            //
        }

        protected void lnkAxtar_Click(object sender, EventArgs e)
        {
            GetAxtar();
        }
    }
}