<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register - 2Wheeler Garage</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f0f8ff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .register-box {
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
      width: 100%;
      max-width: 450px;
    }
    .register-title {
      font-weight: bold;
      color: #004080;
      text-align: center;
      margin-bottom: 20px;
    }
    .btn-register {
      background-color: #004080;
      color: white;
    }
    .btn-register:hover {
      background-color: #0059b3;
    }
    .login-link {
      text-align: center;
      margin-top: 15px;
    }
  </style>
</head>
<body>
  <div class="register-box">
    <h3 class="register-title">Register Account</h3>
    <form action="adduser" method="post">
      <div class="mb-3">
        <label for="user_id" class="form-label">User ID</label>
        <input type="text" name="user_id" id="user_id" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="username" class="form-label">Username</label>
        <input type="text" name="username" id="username" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="password_hash" class="form-label">Password</label>
        <input type="password" name="password_hash" id="password_hash" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="role" class="form-label">Role</label>
        <select name="role" id="role" class="form-select" required>
          <option value="">-- Select Role --</option>
          <option value="admin">Admin</option>
          <option value="mechanic">Mechanic</option>
        </select>
      </div>
      <button type="submit" class="btn btn-register w-100">Register</button>
    </form>
    <div class="login-link">
      <p>Already have an account? <a href="index.jsp">Login here</a></p>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
