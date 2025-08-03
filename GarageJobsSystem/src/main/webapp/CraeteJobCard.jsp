<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Card</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.container {
	max-width: 600px;
	margin-top: 40px;
}

.form-label {
	font-weight: bold;
}
</style>

<script>
    let index = 1;
    function addRow() {
        const table = document.getElementById("sparePartsTable").getElementsByTagName('tbody')[0];
        const newRow = table.insertRow();
        newRow.innerHTML = `
            <td><input type="text" name="spareParts[${index}].part_name" class="form-control" required></td>
            <td><input type="number" name="spareParts[${index}].quantity" class="form-control" required></td>
            <td><input type="number" name="spareParts[${index}].cost" class="form-control" step="0.01" required></td>
            <td><button type="button" onclick="removeRow(this)">x</button></td>
        `;
        index++;
    }

    function removeRow(btn) {
        const row = btn.closest('tr');
        row.remove();
    }
</script>
</head>
<body>
	<div class="container">
		<h2 class="text-center text-primary mb-4">Create Job Card</h2>
		<form action="addJobCard" method="post"
			class="border p-4 rounded shadow bg-light">
			<div class="mb-3">
				<label for="vehicle_id" class="form-label">Vehicle</label> <select
					name="vehicle.vehicle_id" class="form-select" required>
					<option value="">Select Vehicle</option>
					<c:forEach items="${vehicles}" var="veh">
						<option value="${veh.vehicle_id}">${veh.regNumber} -
							${veh.customer.name}</option>
					</c:forEach>
				</select>

			</div>

			<div class="mb-3">
				<label for="service_date" class="form-label"> Service Date</label> <input
					type="date" class="form-control" id="service_date"
					name="service_date" required>
			</div>

			<div class="mb-3">
				<label for="service_type" class="form-label">Service Type</label> <select
					name="service_type" class="form-select" required>
					<option value="">Select Service Type</option>
					<option value="Oil Change">Oil Change</option>
					<option value="Brakes">Brakes</option>
					<option value="Wash">Wash</option>
					<option value="Engine Tuning">Engine Tuning</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="description" class="form-label">Description </label>
				<textarea name="description" class="form-control" rows="3" required></textarea>
			</div>

			<div class="mb-3">
				<label for="cost" class="form-label">Service Cost</label> <input type="text"
					class="form-control" id="cost" name="cost" required>
			</div>
               
			<div class="mb-3">
				<label for="status" class="form-label"> Status</label> <input
					type="text" class="form-control" id="status" value="Pending"
					readonly name="status" required>
			</div>
			
			<h5>Spare Parts Used</h5>
    <table class="table" id="sparePartsTable">
        <thead>
            <tr>
                <th>Part Name</th>
                <th>Quantity</th>
                <th>Cost</th>
                <th><button type="button" onclick="addRow()">+</button></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="text" name="spareParts[0].part_name" class="form-control" required></td>
                <td><input type="number" name="spareParts[0].quantity" class="form-control" required></td>
                <td><input type="number" name="spareParts[0].cost" class="form-control" step="0.01" required></td>
                <td></td>
            </tr>
        </tbody>
    </table>
    
			<br>
			<div class="text-center">
				<button type="submit" class="btn btn-primary">Create Job
					Card</button>
				<a href="Dashboard.jsp" class="btn btn-secondary">Cancel</a>
			</div>
		</form>
		<br>
	</div>

</body>
</html>