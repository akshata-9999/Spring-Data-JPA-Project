<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Job Card List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center text-primary mb-4">Pending Job Cards</h2>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Job Card ID</th>
                <th>Customer Name</th>
                <th>Service Date</th>
                <th>Service Type</th>
                <th>Status</th>
                <th>Total Cost</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="job" items="${jobCards}">
            <tr>
                <td>${job.service_id}</td>
                <td>${job.vehicle.customer.name}</td>
                <td>${job.service_date}</td>
                <td>${job.service_type}</td>
                <td>${job.status}</td>
                <td>
                    <c:set var="total" value="${job.cost}" />
                    <c:forEach var="part" items="${job.spareParts}">
                        <c:set var="total" value="${total + (part.quantity * part.cost)}" />
                    </c:forEach>
                    ₹${total}
                </td>
                <td>
                   <a href="markComplete?jobId=${job.service_id}" 
   class="btn btn-sm btn-success"
   onclick="return confirm('Mark this job card as complete and generate bill?');">
   Mark Complete
</a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="Dashboard.jsp" class="btn btn-secondary">Go To Dashboard</a>
</div>
</body>
</html>
