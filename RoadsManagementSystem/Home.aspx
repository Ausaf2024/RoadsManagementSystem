<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RoadsManagementSystem.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Hero Section -->
    <div class="container text-center mb-5">
        <h1 class="display-5">Welcome to the Infrastructure Management System</h1>
        <p class="lead">Manage Roads, Utilities, and Public Assets efficiently and transparently.</p>
    </div>

    <!-- Feature Cards -->
    <div class="container mb-5">
        <div class="row g-4 text-center">
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Road Management</h5>
                        <p class="card-text">Track and maintain road infrastructure, lengths, GPS paths, and lanes.</p>
                        <a href="#" class="btn btn-outline-primary">View Roads</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Bridge Management</h5>
                        <p class="card-text">Monitor bridge conditions, maintenance status, and locations.</p>
                        <a href="#" class="btn btn-outline-primary">View Bridges</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Drainage & Utilities</h5>
                        <p class="card-text">Manage roadside drains, water lines, and other civic utilities.</p>
                        <a href="#" class="btn btn-outline-primary">View Utilities</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
   

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>

