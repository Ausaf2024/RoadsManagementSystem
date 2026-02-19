
using RoadsManagementSystem.DataUtility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.UI.WebControls;


namespace RoadsManagementSystem
{
    public partial class Demopage : System.Web.UI.Page
    {
        public DataTable dt;
        GetData data;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Getzone();
            }
        }

        // ---------------- ZONE ----------------
        public void Getzone()
        {
            data = new GetData();
            string query = "SELECT * FROM zonemaster";

            SqlCommand cmd = new SqlCommand(query);

            DataTable dt = data.GetDataTable(cmd);

            ddlzone.DataSource = dt;
            ddlzone.DataValueField = "ZoneID";
            ddlzone.DataTextField = "ZoneName";
            ddlzone.DataBind();

            ddlzone.Items.Insert(0, new ListItem("Select", "0"));
        }

        protected void ddlzone_SelectedIndexChanged(object sender, EventArgs e)
        {
            Getcircle();
        }

        // ---------------- CIRCLE ----------------
        public void Getcircle()
        {
            data = new GetData();

            string query = "SELECT CircleID, CircleName FROM circlemaster WHERE ZoneID = @ZoneID";

            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@ZoneID", Convert.ToInt32(ddlzone.SelectedValue));

            DataTable dtCircle = data.GetDataTable(cmd);

            ddlcircle.DataSource = dtCircle;
            ddlcircle.DataValueField = "CircleID";
            ddlcircle.DataTextField = "CircleName";
            ddlcircle.DataBind();

            ddlcircle.Items.Insert(0, new ListItem("Select", "0"));
        }

        protected void ddlcircle_SelectedIndexChanged(object sender, EventArgs e)
        {
            Getdivision();
        }

        // ---------------- DIVISION ----------------
        public void Getdivision()
        {
            data = new GetData();

            string query = "SELECT DivisionID, DivisionName FROM divisionmaster WHERE CircleID = @CircleID";

            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@CircleID", Convert.ToInt32(ddlcircle.SelectedValue));

            DataTable dtDivision = data.GetDataTable(cmd);

            ddlldivision.DataSource = dtDivision;
            ddlldivision.DataValueField = "DivisionID";
            ddlldivision.DataTextField = "DivisionName";
            ddlldivision.DataBind();

            ddlldivision.Items.Insert(0, new ListItem("Select", "0"));
        }

        // ---------------- SAVE BUTTON ----------------
        protected void btnsave_Click(object sender, EventArgs e)
        {
            List<SqlCommand> cmdList = new List<SqlCommand>();
            lblmsg.Text = "";

            // VALIDATIONS
            if (ddlzone.SelectedValue == "0" || ddlcircle.SelectedValue == "0" || ddlldivision.SelectedValue == "0")
            {
                lblmsg.Text = "Please select Zone, Circle, and Division.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrWhiteSpace(txtRoadId.Text) ||
                string.IsNullOrWhiteSpace(txtRoad.Text) ||
                string.IsNullOrWhiteSpace(txtstartgps.Text) ||
                string.IsNullOrWhiteSpace(txtendgps.Text))
            {
                lblmsg.Text = "All road details must be filled.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrWhiteSpace(txtrow.Text) ||
                string.IsNullOrWhiteSpace(txtcarri.Text) ||
                string.IsNullOrWhiteSpace(txtlangth.Text) ||
                string.IsNullOrWhiteSpace(txtlanes.Text))
            {
                lblmsg.Text = "Please fill all road dimension fields.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (rblFootpath.SelectedItem == null ||
                rblwhetherroad.SelectedItem == null ||
                rblwhetherdrain.SelectedItem == null)
            {
                lblmsg.Text = "Please select options for footpath, road sign, and drain.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            data = new GetData();

            string insertQuery = @"
                INSERT INTO road_details
                (zone, circle, division, roadid, name_of_road, start_gps, end_gps,
                 row_mtrs, carriageway_mtrs, length_km, lanes,
                 footpath, road_sign, drain,usertype)
                VALUES
                (@zone, @circle, @division, @roadid, @name_of_road, @start_gps, @end_gps,
                 @row_mtrs, @carriageway_mtrs, @length_km, @lanes,
                 @footpath, @road_sign, @drain,@usertype)";

            SqlCommand cmd = new SqlCommand(insertQuery);

            cmd.Parameters.AddWithValue("@zone", ddlzone.SelectedValue);
            cmd.Parameters.AddWithValue("@circle", ddlcircle.SelectedValue);
            cmd.Parameters.AddWithValue("@division", ddlldivision.SelectedValue);
            cmd.Parameters.AddWithValue("@roadid", txtRoadId.Text.Trim());
            cmd.Parameters.AddWithValue("@name_of_road", txtRoad.Text.Trim());
            cmd.Parameters.AddWithValue("@start_gps", Convert.ToDecimal(txtstartgps.Text.Trim()));
            cmd.Parameters.AddWithValue("@end_gps", Convert.ToDecimal(txtendgps.Text.Trim()));

            cmd.Parameters.AddWithValue("@row_mtrs", Convert.ToDecimal(txtrow.Text.Trim()));
            cmd.Parameters.AddWithValue("@carriageway_mtrs", Convert.ToDecimal(txtcarri.Text.Trim()));
            cmd.Parameters.AddWithValue("@length_km", Convert.ToDecimal(txtlangth.Text.Trim()));
            cmd.Parameters.AddWithValue("@lanes", Convert.ToDecimal(txtlanes.Text.Trim()));
            cmd.Parameters.AddWithValue("@usertype", Session["usertype"].ToString());

            cmd.Parameters.Add("@footpath", SqlDbType.Bit).Value =
                rblFootpath.SelectedValue == "Yes" ? 1 : 0;

            cmd.Parameters.Add("@road_sign", SqlDbType.Bit).Value =
                rblwhetherroad.SelectedValue == "Yes" ? 1 : 0;

            cmd.Parameters.Add("@drain", SqlDbType.Bit).Value =
                rblwhetherdrain.SelectedValue == "Yes" ? 1 : 0;

            cmdList.Add(cmd);

            int insertCount = data.SaveData(cmdList);

            if (insertCount > 0)
            {
                Response.Write(
                    "<script>alert('Road data saved successfully.');" +
                    "window.location='Showdata.aspx';</script>");
                Response.End();
            }
        }
    }
}








