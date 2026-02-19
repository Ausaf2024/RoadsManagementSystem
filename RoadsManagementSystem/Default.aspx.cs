using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration; 
using System.Data;
using Npgsql;
using RoadsManagementSystem;

namespace RoadsManagementSystem
{
    public partial class _Default : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MYISS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Getzone();
            }
        }

        public void Getzone()
        {
            try
            {
                using (NpgsqlConnection con = new NpgsqlConnection(connStr))
                {
                    con.Open();

                    string query = "select * from com.zonemaster";
                    using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                    {
                        using (NpgsqlDataReader reader = cmd.ExecuteReader())
                        {
                            DataTable dt = new DataTable();
                            dt.Load(reader);

                            ddlzone.DataSource = dt;
                            ddlzone.DataValueField = "zoneid";
                            ddlzone.DataTextField = "zonename";
                            ddlzone.DataBind();

                            ddlzone.Items.Insert(0, new ListItem("Select", "0"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void ddlzone_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Write("Zone changed!<br/>");
            Getcircle();
        }

        public void Getcircle()
        {
            try
            {
                using (NpgsqlConnection con = new NpgsqlConnection(connStr))
                {
                    con.Open();

                    string query = "SELECT circleid, circlename FROM com.circlemaster WHERE zoneid = @zoneid";

                    using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                    {
                        // Using parameterized query (safer)
                        cmd.Parameters.AddWithValue("@zoneid", Convert.ToInt32(ddlzone.SelectedValue));

                        using (NpgsqlDataReader reader = cmd.ExecuteReader())
                        {
                            DataTable dt = new DataTable();
                            dt.Load(reader);

                            ddlcircle.DataSource = dt;
                            ddlcircle.DataValueField = "circleid";
                            ddlcircle.DataTextField = "circlename";
                            ddlcircle.DataBind();

                            ddlcircle.Items.Insert(0, new ListItem("Select", "0"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void ddlcircle_SelectedIndexChanged(object sender, EventArgs e)
        {
            Getdivision();
        }

        public void Getdivision()
        {
            try
            {
                using (NpgsqlConnection con = new NpgsqlConnection(connStr))
                {
                    con.Open();

                    string query = "SELECT divisionid, divisionname FROM com.divisionmaster WHERE circleid = @circleid";

                    using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                    {
                        // Using parameterized query (safer)
                        cmd.Parameters.AddWithValue("@circleid", Convert.ToInt32(ddlcircle.SelectedValue));

                        using (NpgsqlDataReader reader = cmd.ExecuteReader())
                        {
                            DataTable dt = new DataTable();
                            dt.Load(reader);

                            ddlldivision.DataSource = dt;
                            ddlldivision.DataValueField = "divisionid";
                            ddlldivision.DataTextField = "divisionname";
                            ddlldivision.DataBind();

                            ddlldivision.Items.Insert(0, new ListItem("Select", "0"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {
                lblmsg.Text = "";

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
                    lblmsg.Text = "All road details (ID, Name, GPS coordinates) must be filled.";
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

                // You can also check if a RadioButtonList has a selected item
                if (rblFootpath.SelectedItem == null ||
                    rblwhetherroad.SelectedItem == null ||
                    rblwhetherdrain.SelectedItem == null)
                {
                    lblmsg.Text = "Please select options for footpath, road sign, and drain availability.";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // All validations passed — continue saving data
                lblmsg.ForeColor = System.Drawing.Color.Green;
                lblmsg.Text = "All data is valid. Proceeding to save...";


                using (NpgsqlConnection con = new NpgsqlConnection(connStr))
                {
                    con.Open();

                    string insertQuery = @"
                    INSERT INTO road_details 
                    (zone, circle, division, roadid, name_of_road, start_gps, end_gps,
                    row_mtrs, carriageway_mtrs, length_km, lanes, footpath, road_sign, drain)
                    VALUES
                    (@zone, @circle, @division, @roadid, @name_of_road, @start_gps, @end_gps,
                    @row_mtrs, @carriageway_mtrs, @length_km, @lanes, @footpath, @road_sign, @drain)";

                    using (NpgsqlCommand cmd = new NpgsqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@zone", ddlzone.SelectedValue);
                        cmd.Parameters.AddWithValue("@circle", ddlcircle.SelectedValue);
                        cmd.Parameters.AddWithValue("@division", ddlldivision.SelectedValue);
                        cmd.Parameters.AddWithValue("@roadid", txtRoadId.Text.Trim());
                        cmd.Parameters.AddWithValue("@name_of_road", txtRoad.Text.Trim());
                        cmd.Parameters.AddWithValue("@start_gps", txtstartgps.Text.Trim());
                        cmd.Parameters.AddWithValue("@end_gps", txtendgps.Text.Trim());

                        //// Parse numeric values safely
                        //decimal rowValue = 0, carriValue = 0, lengthValue = 0;
                        //int lanesValue = 0;

                        //decimal.TryParse(txtrow.Text.Trim(), out rowValue);
                        //decimal.TryParse(txtcarri.Text.Trim(), out carriValue);
                        //decimal.TryParse(txtlangth.Text.Trim(), out lengthValue);
                        //int.TryParse(txtlanes.Text.Trim(), out lanesValue);

                        cmd.Parameters.AddWithValue("@row_mtrs", Convert.ToDecimal(txtrow.Text.Trim()));
                        cmd.Parameters.AddWithValue("@carriageway_mtrs", Convert.ToDecimal(txtcarri.Text.Trim()));
                        cmd.Parameters.AddWithValue("@length_km", Convert.ToDecimal(txtlangth.Text.Trim()));
                        cmd.Parameters.AddWithValue("@lanes", Convert.ToDecimal(txtlanes.Text.Trim()));

                        // Radio button values
                        cmd.Parameters.AddWithValue("@footpath", rblFootpath.SelectedValue);
                        cmd.Parameters.AddWithValue("@road_sign", rblwhetherroad.SelectedValue);
                        cmd.Parameters.AddWithValue("@drain", rblwhetherdrain.SelectedValue);

                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Road data saved successfully.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }


        }

    }
   }
