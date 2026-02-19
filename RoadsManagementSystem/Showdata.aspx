<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Showdata.aspx.cs" Inherits="RoadsManagementSystem.Showdata" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <%--<div class="container-fluid">
    <div class="col-12">
        <div class="row mb-2">
            <div class="col-sm-10">
                <h1>Infrastructure Data View</h1>
            </div>
        </div>
    </div>
</div>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    .center-btn {
    display: block;         
    margin: 0 auto;
   </style>

<div class="card-body">
    <h1 style="text-align:center;">Welcome To User </h1>
     <table id="example1" class="table table-bordered table-striped" >
        
         <thead >
             <tr>
                 <th>S.No.</th>
                <th>Zone</th>
                <th id="thCircle" runat="server">Circle</th>
                 <th id="thDivision" runat="server">Division</th>
                 <th>Road Id</th>
                <th>Name of Road</th>
                 <th>Start From</th>
                  <th>Ending To</th>
                    <th>ROW</th>
                 <th>Carriageway</th>
                  <th>Length</th>
                 <th>No of Lanes</th>
                 <th>Footpath</th>
                  <th>Road Sign</th>
                   <th>Drain</th>
                   <th>Action</th>
             </tr>
         </thead>

         <tbody>

             <% for (int i = 0; i < dt.Rows.Count; i++)
                 { %>
             <tr>
                 <td><% = (i+1) %></td>
                <td><% = dt.Rows[i]["ZoneName"].ToString()%></td>
                <td><% = dt.Rows[i]["CircleName"].ToString()%></td>
                 <td><% = dt.Rows[i]["DivisionName"].ToString()%></td>
                 <td><% = dt.Rows[i]["roadid"].ToString()%></td>
                 <td><% = dt.Rows[i]["name_of_road"].ToString()%></td>
                 <td><% = dt.Rows[i]["start_gps"].ToString()%></td>
                 <td><% = dt.Rows[i]["end_gps"].ToString()%></td>
                 <td><% = dt.Rows[i]["row_mtrs"].ToString()%></td>
                 <td><% = dt.Rows[i]["carriageway_mtrs"].ToString()%></td>
                 <td><% = dt.Rows[i]["length_km"].ToString()%></td>
                 <td><% = dt.Rows[i]["lanes"].ToString()%></td>
                 <td><% = dt.Rows[i]["footpath"].ToString()%></td>
                 <td><% = dt.Rows[i]["road_sign"].ToString()%></td>
                 <td><% = dt.Rows[i]["drain"].ToString()%></td>
                 <td>
                <asp:LinkButton ID="lnkDelete" runat="server"
                    Text="Delete"
                    CommandName="Delete" OnClick="lnkDelete_Click"
                    CommandArgument='<%# Eval("roadid") %>'
                    CssClass="btn btn-danger btn-sm" />
            </td>

                 
              </tr>
             <% 
                }
             %>
         </tbody>
             
    <tr class="d-flex justify-button-center">
       
    <td class="p-0"><asp:Button ID="btnback" runat="server" Text="Back" CssClass="btn btn-primary" OnClick="btnback_Click"/></td>
  </tr>
     </table>
 </div>
</asp:Content>
