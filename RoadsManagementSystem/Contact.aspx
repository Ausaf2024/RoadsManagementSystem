<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RoadsManagementSystem.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <div class="container mt-5 mb-5">

        <h2 class="text-center text-primary mb-4">Contact Us</h2>

        <!-- Contact Info -->
        <div class="row mb-4">

          <div class="col-md-6">
              <h5>Infrastructure Management Cell</h5>
              <p><strong>Department:</strong> Urban Development / IT Department</p>
              <p><strong>Address:</strong> 123 Municipal Office, City Center, New Delhi, India</p>
              <p><strong>Email:</strong> support@ims.gov.in</p>
              <p><strong>Phone:</strong>+91-11-12345678</p>
          </div>

            <!-- Contact Form -->
            <div class="col-md-6">

                <h5>Send us a message</h5>
                <div class="mb-3">
                    <asp:Label ID="lblName" runat="server" Text="Your Name" CssClass="form-label" />
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblEmail" runat="server" Text="Email Address" CssClass="form-label"/>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"/>
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblMessage" runat="server" Text="Your Message" CssClass="form-label"/>
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
                </div>
                <asp:Button ID="btnSend" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSend_Click" />
            </div>
        </div>

        <!-- Optional Map or Banner -->
<footer class="bg-light py-4">
  <div class="container">
    <div class="row">
     <%-- <div class="col-md-12 text-center">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.123456789!2d-122.084249!3d37.422476!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fb0...etc"
          width="80%"
          height="300"
          style="border:0;"
          allowfullscreen=""
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
          class="rounded shadow">
        </iframe>
      </div>--%>
    </div>
  </div>
</footer>
</div>
</asp:Content>

