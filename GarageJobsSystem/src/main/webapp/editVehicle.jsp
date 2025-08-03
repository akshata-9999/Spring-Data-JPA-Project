<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Vehicle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container { max-width: 600px; margin-top: 40px; }
        .form-label { font-weight: bold; }
    </style>
</head>
<body>

<div class="container shadow p-4 bg-light rounded">
    <h3 class="text-center text-primary mb-4">Edit Vehicle</h3>

    <form action="updateVehicle" method="post">

        <input type="hidden" name="vehicle_id" value="${vehicle.vehicle_id}"/>
        
        <div class="mb-3">
            <label class="form-label">Customer</label>
            <select name="customer.customer_id" class="form-select" required>
                <option value="">Select Customer</option>
                <c:forEach var="cust" items="${customers}">
                    <option value="${cust.customer_id}"
                            <c:if test="${cust.customer_id == vehicle.customer.customer_id}">selected</c:if>>
                        ${cust.name} - ${cust.phone}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Registration Number</label>
            <input type="text" name="regNumber" class="form-control" value="${vehicle.regNumber}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Brand</label>
            <input type="text" name="brand" class="form-control" value="${vehicle.brand}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Model</label>
            <input type="text" name="model" class="form-control" value="${vehicle.model}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Purchase Date</label>
           <input type="date" class="form-control" name="purchase_date" value="${purchaseDateStr}" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Last Service Date</label>
            <input type="date" class="form-control" name="last_service_date" value="${lastServiceDateStr}" />
        </div>

        

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Update Vehicle</button>
            <a href="viewVehicles" class="btn btn-secondary">Cancel</a>
        </div>

    </form>
</div>

</body>
</html>
