<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Vehicle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 600px;
            margin-top: 40px;
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center text-primary mb-4">Register Vehicle</h2>
    <form action="addVehicle" method="post" class="border p-4 rounded shadow bg-light">
        <div class="mb-3">
            <label for="customer_id" class="form-label">Customer</label>
            <select name="customer.customer_id" class="form-select" required>
    <option value="">Select Customer</option>
    <c:forEach items="${customers}" var="cust">
        <option value="${cust.customer_id}">${cust.name} - ${cust.phone}</option>
    </c:forEach>
</select>

            
        </div>

        <div class="mb-3">
            <label for="regNumber" class="form-label">Registration Number</label>
            <input type="text" class="form-control" id="regNumber" name="regNumber" required>
        </div>

        <div class="mb-3">
            <label for="brand" class="form-label">Brand</label>
            <input type="text" class="form-control" id="brand" name="brand" required>
        </div>

        <div class="mb-3">
            <label for="model" class="form-label">Model</label>
            <input type="text" class="form-control" id="model" name="model" required>
        </div>

        <div class="mb-3">
            <label for="purchase_date" class="form-label">Purchase Date</label>
            <input type="date" class="form-control" id="purchase_date" name="purchase_date">
        </div>

        <div class="mb-3">
            <label for="last_service_date" class="form-label">Last Service Date</label>
            <input type="date" class="form-control" id="last_service_date" name="last_service_date">
        </div>
     <br>
        <div class="text-center">
                    <button type="submit" class="btn btn-primary">Register Vehicles</button>
                    <a href="Dashboard.jsp" class="btn btn-secondary">Cancel</a>
                </div>
    </form>
    <br>
</div>

</body>
</html>
