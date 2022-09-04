using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace AzeBuses
{
    public class ClassSQL
    {
        public SqlConnection baglanti = new SqlConnection(@"Server=DESKTOP-98GDPR0; Database=DB_Buses;Trusted_Connection=True;");

        public DataTable getdatatable (string sqltext)
        {
            baglanti.Open();
            SqlDataAdapter dap = new SqlDataAdapter(sqltext, baglanti);
            DataTable dt = new DataTable();
            dap.Fill(dt);
            baglanti.Close();
            return dt;
        }
    }
    
}