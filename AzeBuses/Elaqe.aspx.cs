using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AzeBuses
{
    public partial class Elaqe : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        Random rdm = new Random();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack == true)
            {
                ViewState["ID"] = 0;
                GetSimvol();
            }
        }

        void GetSimvol()
        {
            string k1;
            string[] msv1 = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R", "Q", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "r", "q", "s", "t", "u", "v", "w", "x", "y", "z" };
            int s1 = rdm.Next(0, msv1.Length);
            k1 = (msv1[s1]);

            string k2;
            string[] msv2 = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R", "Q", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "r", "q", "s", "t", "u", "v", "w", "x", "y", "z" };
            int s2 = rdm.Next(0, msv1.Length);
            k2 = (msv2[s2]);

            string k3;
            string[] msv3 = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R", "Q", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "r", "q", "s", "t", "u", "v", "w", "x", "y", "z" };
            int s3 = rdm.Next(0, msv1.Length);
            k3 = (msv3[s3]);

            string k4;
            string[] msv4 = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R", "Q", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "r", "q", "s", "t", "u", "v", "w", "x", "y", "z" };
            int s4 = rdm.Next(0, msv1.Length);
            k4 = (msv4[s4]);

            string k5;
            string[] msv5 = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R", "Q", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "r", "q", "s", "t", "u", "v", "w", "x", "y", "z" };
            int s5 = rdm.Next(0, msv1.Length);
            k5 = (msv5[s5]);
            
            lblSimvol.Text = k1 + k2 + k3 + k4 + k5;
        }



        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (txtName.Text != "" && txtSurname.Text != "" && txtMail.Text != "" && txtMessage.Text != "" && txtSimvol.Text == lblSimvol.Text)
            {
                if (ViewState["ID"].ToString() == "0")
                {
                    SqlCommand cmd = new SqlCommand(@"Insert into TB_Mail (Ad, Soyad, Mail, Mesaj, MsgTime) values (@Ad, @Soyad, @Mail, @Mesaj,GETDATE())", klas.baglanti);
                    cmd.Parameters.AddWithValue("Ad", txtName.Text);
                    cmd.Parameters.AddWithValue("Soyad", txtSurname.Text);
                    cmd.Parameters.AddWithValue("Mail", txtMail.Text);
                    cmd.Parameters.AddWithValue("Mesaj", txtMessage.Text);
                    klas.baglanti.Open();
                    cmd.ExecuteNonQuery();
                    klas.baglanti.Close();
                }

                Response.Redirect("Gonderildi.aspx");
            }
            else
            {
                lblXeberdarliq.Text = "Xahiş edirik, məlumatları tam daxil edin!";
            }

            txtName.Text = "";
            txtSurname.Text = "";
            txtMail.Text = "";
            txtMessage.Text = "";
        }
    }
}