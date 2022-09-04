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
    public partial class AdminFooter : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetMenuTable();
                GetSosialTable();
                if (ViewState["ID"] == null)
                {
                    ViewState["ID"] = 0;
                }
            }
        }

        void GetMenuTable()
        {
            DataTable dt = klas.getdatatable("Select * from TB_Menu");
            RP_FTMenu.DataSource = dt;
            RP_FTMenu.DataBind();
        }

        void GetSosialTable()
        {
            DataTable dt = klas.getdatatable("Select * from TB_Sosial");
            RP_Sosial.DataSource = dt;
            RP_Sosial.DataBind();
        }

        protected void RP_FTMenu_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void RP_Sosial_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string ID = e.CommandArgument.ToString();
            if (e.CommandName == "edit")
            {
                DataRow dr = klas.getdatatable("Select * from TB_Sosial where ID=" + ID).Rows[0];
                txtSebeke.Text = dr["SosialName"].ToString();
                txtLink.Text = dr["SosialName"].ToString();
                imgftlogo.ImageUrl = @"..\logo\" + dr["LogoURL"].ToString();
                ViewState["Foto"] = dr["LogoURL"].ToString();
                ViewState["ID"] = e.CommandArgument.ToString();
            }
            else if (e.CommandName == "sil")
            {
                SqlCommand cmd = new SqlCommand("Delete from TB_Sosial where ID=" + e.CommandArgument.ToString(), klas.baglanti);
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetSosialTable();
            }

            
        }

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
        }

        protected void txtTesdiq_Click(object sender, EventArgs e)
        {
            if (txtSebeke.Text != "" && txtLink.Text != "") 
            {
                if (ViewState["ID"].ToString() == "0")
                {
                    SqlCommand cmd = new SqlCommand(@"Insert into TB_Sosial (SosialName, SosialURL, LogoURL) values (@SosialName, @SosialURL, @LogoURL)", klas.baglanti);
                    cmd.Parameters.AddWithValue("SosialName", txtSebeke.Text);
                    cmd.Parameters.AddWithValue("SosialURL", txtLink.Text);
                    cmd.Parameters.AddWithValue("LogoURL", fileimg.FileName);
                    klas.baglanti.Open();
                    cmd.ExecuteNonQuery();
                    klas.baglanti.Close();
                    GetSosialTable();
                    fileimg.SaveAs(Server.MapPath(@"\logo\" + fileimg.FileName));
                    txtSebeke.Text = "";
                    txtLink.Text = "";
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
                    SqlCommand cmd = new SqlCommand(@"Update  TB_Sosial set SosialName=@SosialName, SosialURL=@SosialURL, LogoURL=@LogoURL where ID=" + ViewState["ID"].ToString(), klas.baglanti);
                    cmd.Parameters.AddWithValue("SosialName", txtSebeke.Text);
                    cmd.Parameters.AddWithValue("SosialURL", txtLink.Text);
                    cmd.Parameters.AddWithValue("LogoURL", fotoname);
                    klas.baglanti.Open();
                    cmd.ExecuteNonQuery();
                    klas.baglanti.Close();
                    GetSosialTable();
                    txtSebeke.Text = "";
                    txtLink.Text = "";
                }
            }

            else
            {
                Response.Write("<script>alert('Hörmətli admin qardaş. Məlumat daxil etmədiyiviz üçün məlumatı bazaya göndərə bilmirüy.')</script>");
            }

        }
    }
}