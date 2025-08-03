<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Customers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container { margin-top: 40px; }
        .table thead { background-color: #004080; color: white; }
        .btn-action { margin-right: 5px; }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center text-primary mb-4">Customer List</h2>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Customer Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
  <c:choose>
    <c:when test="${not empty list}">
      <c:forEach items="${list}" var="c" varStatus="loop">
        <tr>
          <td>${loop.index + 1}</td>
          <td>${c.name}</td>
          <td>${c.phone}</td>
          <td>${c.email}</td>
          <td>${c.address}</td>
          <td>
            <a href="editCustomer?customer_id=${c.customer_id}" class="btn btn-sm btn-warning btn-action">Edit</a>
            <a href="deleteCustomer?customer_id=${c.customer_id}" class="btn btn-sm btn-danger btn-action"
               onclick="return confirm('Are you sure you want to delete this customer?')">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </c:when>
    <c:otherwise>
      <tr>
        <td colspan="6" class="text-center">No customers found.</td>
      </tr>
    </c:otherwise>
  </c:choose>
</tbody>
  
    </table>
     <a href="Dashboard.jsp" class="btn btn-secondary">Go To Dashboard</a>
</div>
     
</body>
</html>
