using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace AzeBuses
{
    public partial class BusSite : System.Web.UI.MasterPage
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetMenu();
            }
        }

        protected void GetMenu()
        {
            ltlMenu.Text += "<div class='menu col-lg - 12' style='background - color: #005ea0;'>";
            DataTable dt = klas.getdatatable("Select * from TB_Menu order by MenuRow");
            ltlMenu.Text += "<ul class='menuul'>";
            foreach (DataRow dr in dt.Rows)
            {
                ltlMenu.Text += @"<li class='menuli'><a href='" + dr["MenuURL"] + "'><span>" + dr["MenuName"] + "</span></a></li>";
            }
            ltlMenu.Text += "</ul>";
            ltlMenu.Text += "</div>";
        }
    }
}