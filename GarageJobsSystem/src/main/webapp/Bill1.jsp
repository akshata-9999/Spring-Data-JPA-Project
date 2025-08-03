<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Service Bill</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @media print {
            .no-print {
                display: none;
            }
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center text-success mb-4">Garage Service Bill</h2>

    <div class="card p-4">
        <h5>Job Card ID: <strong>${job.service_id}</strong></h5>
        <p>Customer Name: <strong>${job.vehicle.customer.name}</strong></p>
        <p>Vehicle: <strong>${job.vehicle.regNumber}</strong> | 
            Brand: <strong>${job.vehicle.brand}</strong> | 
            Model: <strong>${job.vehicle.model}</strong>
        </p>
        <p>Service Date: <strong>${job.service_date}</strong></p>
        <p>Service Type: <strong>${job.service_type}</strong></p>
        <p>Status: <strong class="text-info">${job.status}</strong></p>
        <p>Description: <em>${job.description}</em></p>
    </div>

    <div class="mt-4">
        <h5>Spare Parts Used</h5>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Part Name</th>
                    <th>Quantity</th>
                    <th>Cost per Unit</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
            <c:set var="partsTotal" value="0" />
            <c:forEach var="part" items="${job.spareParts}">
                <c:set var="partCost" value="${part.quantity * part.cost}" />
                <tr>
                    <td>${part.part_name}</td>
                    <td>${part.quantity}</td>
                    <td>₹${part.cost}</td>
                    <td>₹${partCost}</td>
                </tr>
                <c:set var="partsTotal" value="${partsTotal + partCost}" />
            </c:forEach>
            </tbody>
        </table>

        <div class="text-end">
            <p>Service Cost: <strong>₹${job.cost}</strong></p>
            <p>Spare Parts Total: <strong>₹${partsTotal}</strong></p>
            <hr>
            <h4>Total Bill Amount: <strong class="text-success">₹${job.cost + partsTotal}</strong></h4>
        </div>
    </div>

    <div class="text-center mt-4 no-print">
        <a href="jobCard?status=Complete" class="btn btn-secondary">Back to Job Cards</a>
        <button onclick="window.print()" class="btn btn-success">Print Bill</button>
    </div>
</div>
</body>
</html>
