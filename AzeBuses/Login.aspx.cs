using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AzeBuses
{
    public partial class Login : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ID"] = 0;
        }

        protected void btnGirish_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from TB_AdminInfo where UserName=@p1 and UserPassword=@p2", klas.baglanti);
            cmd.Parameters.AddWithValue("p1", txtUser.Text);
            cmd.Parameters.AddWithValue("p2", txtParol.Text);
            klas.baglanti.Open();
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dap.Fill(dt);

            SqlCommand cmd1 = new SqlCommand("Insert into TB_GirisVaxti (GirisVaxt) values (GETDATE())", klas.baglanti);
            cmd1.ExecuteNonQuery();

            if (dt.Rows.Count == 1)
            {
                Session["ID"] = 1;
                Response.Redirect("Admin/AdminPanel.aspx");
                txtUser.Text = "";
                txtParol.Text = "";
            }
            else
            {
                Session["ID"] = 0;


                Page.ClientScript.RegisterStartupScript(this.GetType(), "Diqqət !!!", "mesaj();", true);


            }
            klas.baglanti.Close();
        }
    }
}