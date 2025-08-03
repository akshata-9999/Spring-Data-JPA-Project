<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Transport Synergy</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f1f1f1;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .card {
            margin: 15px 0;
        }
    </style>
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="Dashboard.jsp">Garage System</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">

            <!-- Customer Module -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="customerDropdown" role="button" data-toggle="dropdown">
                    Customer Module
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="addCustomer.jsp">Add Customer</a>
                    <a class="dropdown-item" href="viewCust">View Customers</a>
                </div>
            </li>

            <!-- Vehicle Module -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="vehicleDropdown" role="button" data-toggle="dropdown">
                    Vehicle Module
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="registerVehicle">Register Vehicle</a>
                    <a class="dropdown-item" href="viewVehicles">View Vehicles</a>
                </div>
            </li>

            <!-- Service & Repair Jobs -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="serviceDropdown" role="button" data-toggle="dropdown">
                    Service & Repair
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="createJobCard">Create Job Card</a>
                    <a class="dropdown-item" href="jobCardList">Mark Job Complete</a>
                    <a class="dropdown-item" href="jobCard?status=Complete">View Completed Job</a>
                </div>
            </li>

            <!-- Reminders System -->
            <li class="nav-item">
                <a class="nav-link" href="dueVehicles">Service Reminders</a>
            </li>
        </ul>

        <!-- Right Side -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link text-white" href="logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Dashboard Content -->
<div class="container mt-4">
    <div class="jumbotron bg-light text-center">
        <h2>Welcome to 2-Wheeler Garage Jobs System Dashboard</h2>
        <p class="lead">Manage customers, vehicles, repairs, and reminders efficiently.</p>
    </div>

    <!-- Feature Cards -->
    <div class="row">

        <div class="col-md-4">
            <div class="card border-primary">
                <div class="card-body">
                    <h5 class="card-title">Customer Management</h5>
                    <p class="card-text">Register and manage customer details.</p>
                    <a href="addCustomer.jsp" class="btn btn-primary">Add Customer</a>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card border-success">
                <div class="card-body">
                    <h5 class="card-title">Vehicle Registration</h5>
                    <p class="card-text">Register and assign vehicles to customers.</p>
                    <a href="registerVehicle" class="btn btn-success">Register Vehicle</a>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card border-warning">
                <div class="card-body">
                    <h5 class="card-title">Service & Repair</h5>
                    <p class="card-text">Create job cards, assign parts and update service.</p>
                    <a href="createJobCard" class="btn btn-warning">Create Job Card</a>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card border-danger">
                <div class="card-body">
                    <h5 class="card-title">Reminders</h5>
                    <p class="card-text">Track vehicles due for service.</p>
                    <a href="dueVehicles" class="btn btn-danger">View Reminders</a>
                </div>
            </div>
        </div>
        <c:if test="${dueCount > 0}">
    <div class="alert alert-warning">
        <strong>${dueCount}</strong> vehicle(s) due for service!
        <a href="dueVehicles" class="btn btn-sm btn-outline-primary ms-3">View</a>
    </div>
</c:if>
        
        
    </div>
</div>

<!-- Bootstrap JS CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
