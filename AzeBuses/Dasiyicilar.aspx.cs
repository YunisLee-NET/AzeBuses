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
    public partial class Dasiyicilar : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack == true)
            {
                GetDasiyici();
            }
        }

        void GetDasiyici()
        {
            DDLDasiyici.DataValueField = "DasiyiciID";
            DDLDasiyici.DataTextField = "DasiyiciAd";
            DDLDasiyici.DataSource = klas.getdatatable("Select * from TB_Dasiyici");
            DDLDasiyici.DataBind();
            DDLDasiyici.Items.Insert(0, new ListItem("Daşıyıcını seçin", "0"));
        }

        void GetBusKart()
        {
            RP_Dasiyici.DataSource = klas.getdatatable("Select * from TB_Bus1 order by Sira");
            RP_Dasiyici.DataBind();
        }

        protected void DDLDasiyici_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = klas.getdatatable("Select * from TB_Bus1 where DasiyiciID=" + DDLDasiyici.SelectedValue.ToString());
            RP_Dasiyici.DataSource = dt;
            RP_Dasiyici.DataBind();

        }

        protected void lnkAllXett_Click(object sender, EventArgs e)
        {
            GetBusKart();
        }




        protected void lnkAxtar_Click(object sender, EventArgs e)
        {
            //
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //
        }
    }
}