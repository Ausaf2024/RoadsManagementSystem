<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="RoadsManagementSystem.Demopage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Label ID="lblmsg" runat="server" CssClass="text-danger mb-2 d-block text-center" />

    <div class="container mt-5">
   <div class="row mb-3">
    <div class="col-md-2">
        <label for="ddlzone" class="form-label">Zone:<font color="red">&nbsp; *</font></label>
    </div>

    <div class="col-md-4">
        <asp:DropDownList ID="ddlzone" runat="server"  AutoPostBack="true"
            CssClass="form-select" OnSelectedIndexChanged="ddlzone_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="req_zone" runat="server"
    ControlToValidate="ddlzone" InitialValue="0"
    ErrorMessage="Please select Zone"
    ForeColor="Red" Display="Dynamic"
    ValidationGroup="ZoneGroup" />

    </div>

</div>

   <div class="row mb-3">
        <div class="col-md-2">
            <label for="ddlcircle" class="form-label">Circle:<font color="red">&nbsp; *</font></label>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ddlcircle" runat="server" AutoPostBack="true"
                CssClass="form-select" OnSelectedIndexChanged="ddlcircle_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="req_circle" runat="server"
    ControlToValidate="ddlcircle" InitialValue="0"
    ErrorMessage="Please select Circle"
    ForeColor="Red" Display="Dynamic"
    ValidationGroup="ZoneGroup" />
        </div>
    </div>

   <div class="row mb-3">
        <div class="col-md-2">
            <label for="ddlldivision" class="form-label">Division:<font color="red">&nbsp; *</font></label>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ddlldivision" runat="server" 
                CssClass="form-select">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="req_division" runat="server"
    ControlToValidate="ddlldivision" InitialValue="0"
    ErrorMessage="Please select Division"
    ForeColor="Red" Display="Dynamic"
    ValidationGroup="ZoneGroup" />
             
        </div>
    </div>

   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtRoadId" class="form-label">Road Id:<font color="red">&nbsp; *</font></label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtRoadId" runat="server" CssClass="form-control" />
     <asp:RequiredFieldValidator ID="req_RoadId" runat="server"
    ControlToValidate="txtRoadId"
    ErrorMessage="Road ID is required"
    ForeColor="Red" Display="Dynamic"
    SetFocusOnError="true"
    ValidationGroup="ZoneGroup"/>

    <asp:RegularExpressionValidator 
    ID="regex_RoadId" 
    runat="server" 
    ControlToValidate="txtRoadId"
    ErrorMessage="Only numbers are allowed"
    ValidationExpression="^\d+$" 
    ForeColor="Red"
    Display="Dynamic"
    ValidationGroup="ZoneGroup"/>
    </div>
</div>

   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtRoad" class="form-label">Name of Road:<font color="red">&nbsp; *</font></label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtRoad" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
        <asp:RequiredFieldValidator ID="req_RoadName" runat="server"
    ControlToValidate="txtRoad"
    ErrorMessage="Road Name is required"
    ForeColor="Red" Display="Dynamic"
    SetFocusOnError="true"
    ValidationGroup="ZoneGroup" />
    </div>
</div>
 
   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtstartgps" class="form-label">Start From (With GPS Coordinates):<font color="red">&nbsp; *</font></label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtstartgps" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
   <asp:RequiredFieldValidator ID="req_StartGPS" runat="server"
    ControlToValidate="txtstartgps"
    ErrorMessage="Start GPS is required"
    ForeColor="Red" Display="Dynamic"
    SetFocusOnError="true"
    ValidationGroup="ZoneGroup" />
        </div>
</div>

   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtendgps" class="form-label">Ending To (With GPS Coordinates):<font color="red">&nbsp; *</font></label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtendgps" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
   <asp:RequiredFieldValidator ID="req_EndGPS" runat="server"
    ControlToValidate="txtendgps"
    ErrorMessage="End GPS is required"
    ForeColor="Red" Display="Dynamic"
    SetFocusOnError="true"
    ValidationGroup="ZoneGroup" />
        </div>
</div>
      
   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtrow" class="form-label">Row (In Mtrs):<font color="red">&nbsp; *</font></label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtrow" runat="server" CssClass="form-control" />
        <asp:RequiredFieldValidator ID="req_Row" runat="server"
    ControlToValidate="txtrow"
    ErrorMessage="Row is required"
    ForeColor="Red" Display="Dynamic"
    SetFocusOnError="true"
    ValidationGroup="ZoneGroup" />

        
    <asp:RegularExpressionValidator 
    ID="RegularExpressionValidator1" 
    runat="server" 
    ControlToValidate="txtrow"
    ErrorMessage="Only numbers are allowed"
    ValidationExpression="^\d+$" 
    ForeColor="Red"
    Display="Dynamic"
    ValidationGroup="ZoneGroup"/>
    </div>
</div>
      
   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtcarri" class="form-label">Carriageway(In Mtrs):<font color="red">&nbsp;*</font></label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtcarri" runat="server" CssClass="form-control" /> 
        <asp:RequiredFieldValidator ID="req_Carriage" runat="server"
    ControlToValidate="txtcarri"
    ErrorMessage="Carriageway is required"
    ForeColor="Red" Display="Dynamic"
    SetFocusOnError="true"
    ValidationGroup="ZoneGroup" />

        
    <asp:RegularExpressionValidator 
    ID="RegularExpressionValidator2" 
    runat="server" 
    ControlToValidate="txtcarri"
    ErrorMessage="Only numbers are allowed"
    ValidationExpression="^\d+$" 
    ForeColor="Red"
    Display="Dynamic"
    ValidationGroup="ZoneGroup"/>

    </div>
</div>
      
   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtlangth" class="form-label">Length (In Km):<font color="red">&nbsp; *</font></label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtlangth" runat="server" CssClass="form-control" />
        <asp:RequiredFieldValidator ID="req_Length" runat="server"
    ControlToValidate="txtlangth"
    ErrorMessage="Length is required"
    ForeColor="Red" Display="Dynamic"
    SetFocusOnError="true"
    ValidationGroup="ZoneGroup" />

        
    <asp:RegularExpressionValidator 
    ID="RegularExpressionValidator3" 
    runat="server" 
    ControlToValidate="txtlangth"
    ErrorMessage="Only numbers are allowed"
    ValidationExpression="^\d+$" 
    ForeColor="Red"
    Display="Dynamic"
    ValidationGroup="ZoneGroup"/>

    </div>
</div>

   <div class="row mb-3">
    <div class="col-md-2">
        <label for="txtlanes" class="form-label">No of Lanes:<font color="red">&nbsp; *</font></label>
    </div>
    <div class="col-md-4">
        <asp:TextBox ID="txtlanes" runat="server" CssClass="form-control" />
        <asp:RequiredFieldValidator ID="req_Lanes" runat="server"
    ControlToValidate="txtlanes"
    ErrorMessage="No. of Lanes is required"
    ForeColor="Red" Display="Dynamic"
    SetFocusOnError="true"
    ValidationGroup="ZoneGroup" />

        
    <asp:RegularExpressionValidator 
    ID="RegularExpressionValidator4" 
    runat="server" 
    ControlToValidate="txtlanes"
    ErrorMessage="Only numbers are allowed"
    ValidationExpression="^\d+$" 
    ForeColor="Red"
    Display="Dynamic"
    ValidationGroup="ZoneGroup"/>
    </div>
</div>
      
   <div class="row mb-3">
    <div class="col-md-12">
        <label for="rblFootpath" class="form-label">Whether Footpath available along the road?<font color="red">&nbsp; *</font></label>
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
        <label for="rblwhetherroad" class="form-label">Whether Road sign  available along the road?<font color="red">&nbsp; *</font></label>
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
        <label for="rblwhetherdrain" class="form-label">Whether Drain   available along the road?<font color="red">&nbsp; *</font></label>
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
        <asp:Button ID="btnsave" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnsave_Click" ValidationGroup="ZoneGroup"/>
    </div>
</div>
      </div>

 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="User Name" />
    </Columns>
</asp:GridView>


</asp:Content>
