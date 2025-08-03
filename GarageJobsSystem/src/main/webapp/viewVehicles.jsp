<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Vehicles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container { margin-top: 40px; }
        .table thead { background-color: #004080; color: white; }
        .btn-action { margin-right: 5px; }
    </style>
</head>

<body>
<div class="container">
    <h2 class="text-center text-primary mb-4">Vehicle List</h2>

    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Registration No.</th>
            <th>Vehicle Brand</th>
            <th>Vehicle Model</th>
            <th>Purchase Date</th>
            <th>Last Service Date</th>
            <th>Customer Name</th> 
            <th>Customer Phone</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach var="v" items="${list}">
                    <tr>
                        <td>${v.vehicle_id}</td>
                        <td>${v.regNumber}</td>
                        <td>${v.brand}</td>
                        <td>${v.model}</td>
                        <td>${v.purchase_date}</td>
                        <td>${v.last_service_date}</td>
                        <td>${v.customer.name}</td>  
                        <td>${v.customer.phone}</td>
                        <td>
                            <a href="editVehicle?vehicle_id=${v.vehicle_id}" class="btn btn-sm btn-primary">Edit</a>
                            <a href="deleteVehicle?vehicle_id=${v.vehicle_id}" class="btn btn-sm btn-danger"
   onclick="return confirm('Are you sure you want to delete this vehicle?');">Delete</a>

                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="9" class="text-center">No vehicles found.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

    <a href="Dashboard.jsp" class="btn btn-secondary">Go To Dashboard</a>
</div>
</body>
</html>
