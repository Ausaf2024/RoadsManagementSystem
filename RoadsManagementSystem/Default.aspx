<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RoadsManagementSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <asp:Label ID="lblmsg" runat="server" CssClass="text-danger mb-2 d-block text-center" />

   <div class="container mt-5">
   <div class="row mb-3">
    <div class="col-md-2">
        <label for="ddlzone" class="form-label">Zone:</label>
    </div>
    <div class="col-md-4">
        <asp:DropDownList ID="ddlzone" runat="server" AutoPostBack="true"
            CssClass="form-select" OnSelectedIndexChanged="ddlzone_SelectedIndexChanged">
        </asp:DropDownList>
    </div>
</div>

   <div class="row mb-3">
        <div class="col-md-2">
            <label for="ddlcircle" class="form-label">Circle:</label>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ddlcircle" runat="server" AutoPostBack="true"
                CssClass="form-select" OnSelectedIndexChanged="ddlcircle_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
    </div>

   <div class="row mb-3">
        <div class="col-md-2">
            <label for="ddlldivision" class="form-label">Division:</label>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ddlldivision" runat="server" AutoPostBack="true"
                CssClass="form-select" >
            </asp:DropDownList>
        </div>
    </div>

   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtRoadId" class="form-label">Road Id:</label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtRoadId" runat="server" CssClass="form-control" />
    </div>
</div>

   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtRoad" class="form-label">Name of Road:</label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtRoad" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
    </div>
</div>
 
   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtstartgps" class="form-label">Start From (With GPS Coordinates):</label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtstartgps" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
    </div>
</div>

   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtendgps" class="form-label">Ending To (With GPS Coordinates):</label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtendgps" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
    </div>
</div>
      
   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtrow" class="form-label">Row (In Mtrs):</label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtrow" runat="server" CssClass="form-control" />
    </div>
</div>
      
   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtcarri" class="form-label">Carriageway(In Mtrs):</label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtcarri" runat="server" CssClass="form-control" />
    </div>
</div>
      
   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtlangth" class="form-label">Length (In Km):</label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtlangth" runat="server" CssClass="form-control" />
    </div>
</div>

   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtlanes" class="form-label">No of Lanes:</label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtlanes" runat="server" CssClass="form-control" />
    </div>
</div>
      
   <div class="row mb-3">
    <div class="col-md-12">
        <label for="rblFootpath" class="form-label">Whether Footpath available along the road?</label>
    </div>
       <br />
    <div class="col-md-12">
        <asp:RadioButtonList ID="rblFootpath" runat="server" CssClass="form-check" >
            <asp:ListItem Text="Yes" Value="Yes" />
            <asp:ListItem Text="No" Value="No" />
        </asp:RadioButtonList>
    </div>
</div>

   <div class="row mb-3">
    <div class="col-md-12">
        <label for="rblwhetherroad" class="form-label">Whether Road sign  available along the road?</label>
    </div>
       <br />
    <div class="col-md-12">
        <asp:RadioButtonList ID="rblwhetherroad" runat="server" CssClass="form-check" >
            <asp:ListItem Text="Yes" Value="Yes" />
            <asp:ListItem Text="No" Value="No" />
        </asp:RadioButtonList>
    </div>
</div>

   <div class="row mb-3">
    <div class="col-md-12">
        <label for="rblwhetherdrain" class="form-label">Whether Drain   available along the road?</label>
    </div>
       <br />

    <div class="col-md-12">
        <asp:RadioButtonList ID="rblwhetherdrain" runat="server" CssClass="form-check" >
            <asp:ListItem Text="Yes" Value="Yes" />
            <asp:ListItem Text="No" Value="No" />
        </asp:RadioButtonList>
    </div>

</div>

     <div class="row mb-3">
    <div class="col-md-6 text-center">
       
        <asp:Button ID="btnsave" runat="server" Text="Submit" CssClass="btn btn-primary" ValidationGroup="ZoneGroup" OnClick="btnsave_Click" OnClientClick="validateForm();" />
        
    </div>
</div>
</form>

      </div>
</asp:Content>
