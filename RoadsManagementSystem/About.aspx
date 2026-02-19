<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="RoadsManagementSystem.About1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Image Banner -->
   <%-- <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-10 text-center">
                <img src="~/assets/Image/banner3.jpg" alt="Infrastructure Banner" class="img-fluid rounded shadow" style="max-height: 350px; object-fit: cover;" />
            </div>
        </div>
    </div>--%>

    <!-- Page Title -->
    <div class="container mt-5 mb-4">
        <h2 class="text-center text-primary mb-4">About Infrastructure Management System</h2>

        <!-- Intro Section -->
        <div class="row justify-content-center">
            <div class="col-md-10">
                <p class="lead text-justify">
                    The <strong>Infrastructure Management System (IMS)</strong> is a web-based application developed to help government and municipal bodies effectively monitor, manage, and maintain infrastructure assets such as roads, bridges, footpaths, drainage, and signage.
                </p>
            </div>
        </div>

        <!-- System Objectives -->
        <div class="row mt-4">
            <div class="col-md-6">
                <h4 class="text-success">Objectives</h4>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Centralized database for infrastructure records</li>
                    <li class="list-group-item">Track condition and maintenance activities</li>
                    <li class="list-group-item">Facilitate transparency and digital governance</li>
                    <li class="list-group-item">Enable GIS-based planning using GPS data</li>
                </ul>
            </div>

            <!-- Key Features -->
            <div class="col-md-6">
                <h4 class="text-success">Key Features</h4>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Zone, Circle, and Division-based road management</li>
                    <li class="list-group-item">Length, carriageway, lanes, and footpath tracking</li>
                    <li class="list-group-item">Drainage and signage availability</li>
                    <li class="list-group-item">User authentication and report generation</li>
                </ul>
            </div>
        </div>

        <!-- Benefits -->
        <div class="row mt-5">
            <div class="col-md-12">
                <h4 class="text-success">Benefits</h4>
                <p>
                    The IMS empowers departments to digitize infrastructure data, ensures better planning for repairs and expansions, and improves service delivery. It also helps streamline budget allocations and make informed policy decisions.
                </p>
            </div>
        </div>

        <!-- Contact -->
        <div class="row mt-4">
            <div class="col-md-12">
                <h4 class="text-success">Contact & Support</h4>
                <p>
                    For technical support or suggestions, contact the IT Department or the Project Management Unit (PMU) of the Municipal Corporation.
                </p>
            </div>
        </div>
    </div>
</asp:Content>
