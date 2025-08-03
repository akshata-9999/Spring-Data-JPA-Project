<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Vehicles Due for Service</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h3 class="text-center text-warning">Vehicles Due for Service</h3>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>Reg. Number</th>
            <th>Customer</th>
            <th>Last Service Date</th>
            <th>Contact</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="v" items="${dueVehicles}">
            <tr>
                <td>${v.regNumber}</td>
                <td>${v.customer.name}</td>
                <td>${v.last_service_date}</td>
                <td>${v.customer.phone}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button class="btn btn-primary" onclick="window.print()">Print Reminder</button>
    <a href="Dashboard.jsp" class="btn btn-secondary">Go To Dashboard</a>
</div>
</body>
</html>
