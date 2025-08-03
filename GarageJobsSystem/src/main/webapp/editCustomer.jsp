<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background: #f4f4f4;
        }
        .form-container {
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 12px rgba(0,0,0,0.1);
            max-width: 500px;
            margin: auto;
        }
        h2 {
            text-align: center;
            color: #007bff;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button {
            margin-top: 20px;
            background: #007bff;
            color: #fff;
            border: none;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }
        button:hover {
            background: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #555;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Edit Customer</h2>
    <form action="updateCustomer" method="post">
        <input type="hidden" name="customer_id" value="${customer.customer_id}">

        <label for="name">Customer Name:</label>
        <input type="text" id="name" name="name" value="${customer.name}" required>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="${customer.phone}" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${customer.email}">

        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="3">${customer.address}</textarea>

        <button type="submit">Update Customer</button>
    </form>

    <a href="viewCust">Back to Customer List</a>
</div>

</body>
</html>
