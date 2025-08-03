<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Status</title>
</head>
<body>
<%
    String status = (String) request.getAttribute("status");
    if (status != null && !status.isEmpty()) {
%>
    <script type="text/javascript">
        let status = "<%= status.replaceAll("\"", "\\\"") %>"; // escape any quotes
        alert(status);
        if (status.trim() === "Registration success" || status.trim() === "Invalid password" || status.trim() === "Username not found") {
            window.location.href = "index.jsp";
        }
        else if (status.trim() === "Login success" || status.trim() === "Add Customer success" || status.trim() === "Add Vehicle success" || status.trim() === "Add Job Card success") {
            window.location.href = "/dashboard";
        }
        else if (status.trim() === "Registration failed: Phone number already exists"){
        	window.location.href = "addCustomer.jsp";
        }
        else if (status.trim() === "Registration failed: Registration number already exists"){
        	window.location.href = "/registerVehicle";
        }
        else {
            window.location.href = "register.jsp";
        }
    </script>
<%
    }
%>
</body>
</html>
