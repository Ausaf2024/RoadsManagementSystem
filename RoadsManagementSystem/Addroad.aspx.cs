using Npgsql;
using RoadsManagementSystem.DataUtility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace RoadsManagementSystem
{
    public partial class Addroad : System.Web.UI.Page
    {
        public DataTable dt;
        GetData data;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            List<SqlCommand> cmdList = new List<SqlCommand>();
            data = new GetData();

            string Qry = "INSERT INTO AddRoad (roadname, road_length, location, road_type) " +
                         "VALUES (@roadname, @road_length, @location, @road_type)";

            SqlCommand cmd = new SqlCommand(Qry);

            cmd.Parameters.AddWithValue("@roadname", txtRoadName.Text);
            cmd.Parameters.AddWithValue("@road_length", Convert.ToInt32(txtLength.Text));
            cmd.Parameters.AddWithValue("@location", txtLocation.Text);
            cmd.Parameters.AddWithValue("@road_type", ddlRoadType.SelectedValue);

            cmdList.Add(cmd);

            int insertCount = data.SaveData(cmdList);

            if (insertCount > 0)
            {
                Response.Write("<script>alert('AddRoad data saved successfully..');</script>");
            }

            clear();
        }

        public void clear()
        {
            txtRoadName.Text = "";
            txtLength.Text = "";
            txtLocation.Text = "";
            ddlRoadType.ClearSelection();   // Better than SelectedValue = ""
        }
    }
}
