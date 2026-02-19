<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Addroad.aspx.cs" Inherits="RoadsManagementSystem.Addroad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <h1 style="text-align:center; background-color:aqua;">Welcome Add Road Detalis </h1>
    <div class="container">
    <div class="row">
        <!-- Form - occupies 6 columns (50%) -->
        <div class="col-md-6">
            <asp:Panel ID="pnlAddRoad" runat="server">
                <div class="form-group">
                    <label for="txtRoadName">Road Name</label>
                    <asp:TextBox ID="txtRoadName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvRoadName" runat="server" ControlToValidate="txtRoadName"
                        ErrorMessage="Road Name is required" ForeColor="Red" Display="Dynamic" />
                      <asp:RegularExpressionValidator ID="revRoadName" runat="server" ControlToValidate="txtRoadName"
                        ErrorMessage="Only alphabetic characters and spaces are allowed"
                        ValidationExpression="^[A-Za-z\s]+$"
                        ForeColor="Red" Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label for="txtLength">Length (in km)</label>
                    <asp:TextBox ID="txtLength" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvLength" runat="server" ControlToValidate="txtLength"
                        ErrorMessage="Length is required" ForeColor="Red" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revLength" runat="server" ControlToValidate="txtLength"
                        ErrorMessage="Please enter a valid number" ValidationExpression="^\d+(\.\d{1,2})?$"
                        ForeColor="Red" Display="Dynamic" />
                </div>



                <div class="form-group">
                    <label for="txtLocation">Location</label>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label for="ddlRoadType">Road Type</label>
                    <asp:DropDownList ID="ddlRoadType" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select Type" Value="" />
                        <asp:ListItem Text="Highway" Value="Highway" />
                        <asp:ListItem Text="Street" Value="Street" />
                        <asp:ListItem Text="Alley" Value="Alley" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvRoadType" runat="server" ControlToValidate="ddlRoadType"
                        InitialValue="" ErrorMessage="Road Type is required" ForeColor="Red" Display="Dynamic" />
                </div>

                <div class="form-group">
                    <asp:Button ID="btnSubmit" runat="server" Text="Add Road" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </asp:Panel>
        </div>

<div class="col-md-6 d-flex align-items-center justify-content-center">
  <img src="image/Aus.png" alt="Road Image"
       class="img-fluid"
       style="width: 300px; height: 300px; border-radius: 50%; object-fit: cover;" />
</div>
    </div>
        </div>

</asp:Content>
