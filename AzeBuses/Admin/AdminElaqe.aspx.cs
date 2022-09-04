using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;

namespace AzeBuses.Admin
{
    public partial class AdminElaqe : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack == true)
            {
                GetTable();
            }
        }

        void GetTable()
        {
            DataTable dt = klas.getdatatable("Select * from TB_Mail");
            RpElaqeHead.DataSource = dt;
            RpElaqeHead.DataBind();
        }

   
        MailMessage epoct = new MailMessage();

       
        void MailGonder()
        {
            if(txtAliciMail.Text!="" && txtBasliq.Text!=""&& txtMesaj.Text != "")
            {
            

            epoct.From = new MailAddress("azebusesaz@gmail.com");
            epoct.To.Add(txtAliciMail.Text.ToString());
            epoct.Subject = txtBasliq.Text.ToString();
            epoct.Body = txtMesaj.Text.ToString();

            SmtpClient smtp = new SmtpClient();
            smtp.Credentials = new System.Net.NetworkCredential("azebusesaz@gmail.com", "AzeBuseS2022");
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;

            smtp.Send(epoct);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Diqqət !!!", "tesdiqle();", true);
            Response.Redirect("AdminElaqe.aspx");

            txtAliciMail.Text = "";
            txtBasliq.Text = "";
            txtMesaj.Text = "";

                Response.Write("<script>alert('Hörmətli istifadəçi, sizin mesajınız göndərildi. Qısa zaman ərzində sizin qeyd etdiyiniz mail ünvanına cavab göndəriləcək.')</script>");

            }

            else
            {
                lblinfo.Text = "Hörmətli admin, zəhmət olmasa bütün parametrləri daxil edin";
            }

        }

        void Mesaj()
        {
            //Response.Write("<script>alert('Hörmətli istifadəçi, sizin mesajınız göndərildi. Qısa zaman ərzində sizin qeyd etdiyiniz mail ünvanına cavab göndəriləcək.')</script>");
        }



        protected void lnkGonder_Click(object sender, EventArgs e)
        {
            MailGonder();

        }

        protected void RpElaqeHead_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "Baxiw")
            {
                DataTable dt = klas.getdatatable("Select * from TB_Mail where ID=" + e.CommandArgument.ToString());
                lblAd.Text = dt.Rows[0]["Ad"].ToString();
                lblSoyad.Text = dt.Rows[0]["Soyad"].ToString();
                lblMail.Text = dt.Rows[0]["Mail"].ToString();
                lblMesaj.Text = dt.Rows[0]["Mesaj"].ToString();
            }

            if (e.CommandName.ToString() == "Sil")
            {
                SqlCommand cmd = new SqlCommand("Delete from TB_Mail where ID=" + e.CommandArgument.ToString(), klas.baglanti);
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetTable();
            }
        }

        protected void lblMew_Click(object sender, EventArgs e)
        {
            DataTable dt = klas.getdatatable("SELECT * FROM TB_Mail ORDER BY  MsgTime desc; ");
            RpElaqeHead.DataSource = dt;
            RpElaqeHead.DataBind();
        }

        protected void lblOld_Click(object sender, EventArgs e)
        {
            DataTable dt = klas.getdatatable("SELECT * FROM TB_Mail ORDER BY  MsgTime; ");
            RpElaqeHead.DataSource = dt;
            RpElaqeHead.DataBind();
        }

        protected void lnkAxtar_Click(object sender, EventArgs e)
        {
            DataTable dt = klas.getdatatable("Select * from TB_Mail where Ad like N'%" + txtAxtar.Text + "%' or Soyad like N'%" + txtAxtar.Text + "%' or Mail like N'%" + txtAxtar.Text + "%' or Mesaj like N'%" + txtAxtar.Text + "%' or MsgTime like N'%" + txtAxtar.Text + "%'");
            RpElaqeHead.DataSource = dt;
            RpElaqeHead.DataBind();
        }
    }
}