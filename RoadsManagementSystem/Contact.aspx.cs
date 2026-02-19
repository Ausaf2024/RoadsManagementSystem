using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoadsManagementSystem
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string message = txtMessage.Text;

            // You can store this info in DB or send an email
            // For now, simple confirmation (you can show this in a Label or alert)
            Response.Write("<script>alert('Thank you for contacting us!');</script>");
        }
    }
}