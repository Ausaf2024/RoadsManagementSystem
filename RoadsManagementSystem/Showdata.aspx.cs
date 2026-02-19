using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using RoadsManagementSystem.DataUtility;

namespace RoadsManagementSystem
{
    public partial class Showdata : System.Web.UI.Page
    {
        public DataTable dt;
        GetData data;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillData();
            }
        }

        private void fillData()
        {
            data = new GetData();

            string sqlStr = @"
SELECT 
    ZM.ZoneName,
    CM.CircleName,
    DM.DivisionName,
    RD.roadid,
    RD.name_of_road,
    RD.start_gps,
    RD.end_gps,
    RD.row_mtrs,
    RD.carriageway_mtrs,
    RD.length_km,
    RD.lanes,
    RD.footpath,
    RD.road_sign,
    RD.drain,
    UTS.Username

FROM road_details RD

INNER JOIN dbo.usermaster UTS 
    ON RD.usertype = UTS.UserID

INNER JOIN dbo.zonemaster ZM 
    ON ZM.ZoneName = RD.ZoneName

INNER JOIN dbo.circlemaster CM 
    ON CM.CircleName = RD.CircleName

INNER JOIN dbo.divisionmaster DM 
    ON DM.DivisionName = RD.DivisionName

WHERE RD.usertype = @usertype";

            SqlCommand sqlCmd = new SqlCommand(sqlStr);
            sqlCmd.Parameters.AddWithValue("@usertype", Session["usertype"].ToString());

            dt = data.GetDataTable(sqlCmd);
        }



        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        // ---------------- DELETE ----------------
        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = (LinkButton)sender;
                string id = lnk.CommandArgument;

                if (!int.TryParse(id, out int parsedId))
                {
                    Response.Write("<script>alert('Invalid ID format.');</script>");
                    return;
                }

                GetData data = new GetData();

                string qry = "DELETE FROM road_details WHERE id = @id";

                SqlCommand sqlCmd = new SqlCommand(qry);
                sqlCmd.Parameters.AddWithValue("@id", parsedId);

                List<SqlCommand> cmdList = new List<SqlCommand> { sqlCmd };

                int deleteCount = data.SaveData(cmdList);

                if (deleteCount > 0)
                {
                    Response.Write("<script>alert('Record deleted successfully.'); window.location='Showdata.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Delete failed. Record not found.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}










