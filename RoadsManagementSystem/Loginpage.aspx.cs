using MSCaptcha;
using Npgsql;
using RoadsManagementSystem.DataUtility;
using SecurityUtility.Salt;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoadsManagementSystem
{
    public partial class Loginpage : System.Web.UI.Page
    {
        public DataTable dt;
        GetData data;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string hashedPassword = ComputeSha512Hash(password);
            Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());
            bool isCaptcha = Captcha1.UserValidated;
            if (!isCaptcha)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Invalid Code.";
                txtUsername.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtCaptcha.Text = string.Empty;
                return;
            }

            string query = "SELECT Username, UserType FROM usermaster WHERE Username=@Username AND Password=@Password AND isactive=1";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", hashedPassword);

            GetData data = new GetData();
            string[] row = data.SelectColumns(cmd);

            if (row.Length > 0 && !string.IsNullOrEmpty(row[0]))
            {
                Session["usertype"] = row[1];
                Response.Redirect("Index.aspx");
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Invalid username or password.";
            }

        }
        public static string ComputeSha512Hash(string rawData)
        {
            using (SHA512 sha512Hash = SHA512.Create())
            {
                byte[] bytes = sha512Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2")); // convert to hex
                }
                return builder.ToString();
            }
        }
    }
}