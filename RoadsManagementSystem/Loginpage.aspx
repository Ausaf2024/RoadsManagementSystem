<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Loginpage.aspx.cs" Inherits="RoadsManagementSystem.Loginpage" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

   <%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
    <style>
        body {
            background-color: #f8f9fa;
             }

        .login-container {
            height: 65vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }

        .login-header {
            background-color: #0d6efd;
            color: white;
            border-top-left-radius: 16px;
            border-top-right-radius: 16px;
            padding: 1rem;
            text-align: center;
        }
    </style>

    <script>
       
        function validateLoginForm() {
            var userId = document.getElementById("<%= txtUsername.ClientID %>").value;
        var password = document.getElementById("<%= txtPassword.ClientID %>").value;

            if (userId.trim() === "") {
                alert("Please Enter Your UserId.");
                return false;
            }

            if (password.trim() === "") {
                alert("Please Enter Your Password.");
                return false;
            }

            return true; 
        }
    </script>

    <div class="container login-container">
    
    <div class="card login-card">

    <div class="login-header">
                <h3>User Login</h3>
            </div>
    <div class="card-body">
    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mb-2 d-block text-center" />

    <div class="mb-3" style="max-width: 350px; margin: 0 auto;">
    <label class="form-label"><b>User ID</b></label>
    <div class="input-group">
        <span class="input-group-text"><i class="fa fa-user"></i></span>
        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Enter your user ID" />
    </div>
</div>

<div class="mb-3" style="max-width: 350px; margin: 0 auto;">
    <label class="form-label"><b>Password</b></label>
    <div class="input-group">
        <span class="input-group-text"><i class="fa fa-lock"></i></span>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Enter your password" />
    </div>
</div>

        <div class="mb-3 text-center">
    <div class="d-flex justify-content-center">
        <cc1:CaptchaControl ID="Captcha1" runat="server"
            CaptchaBackgroundNoise="Low"
            CaptchaLength="6"
            CaptchaHeight="60"
            CaptchaWidth="200"
            CaptchaMinTimeout="5"
            CaptchaMaxTimeout="240"
            FontColor="YellowGreen"
            NoiseColor="#B1B1B1"
            CssClass="captcha-img" />
        <asp:ImageButton ImageUrl="~/image/refresh.png" runat="server" CausesValidation="false"
            CssClass="ms-2" ToolTip="Refresh CAPTCHA"/>
    </div>
</div>

<div class="mb-3" style="max-width: 350px; margin: 0 auto;">
    <div class="input-group">
        <span class="input-group-text"><i class="fa fa-key"></i></span>
        <asp:TextBox ID="txtCaptcha" runat="server" placeholder="Enter above shown code" CssClass="form-control"></asp:TextBox>
    </div>
</div>

    <div class="d-grid" style="max-width: 150px; margin: 0 auto;">
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" OnClientClick="return validateLoginForm();"/>
    </div>
</div>
   </div>
         </div>
</asp:Content>








