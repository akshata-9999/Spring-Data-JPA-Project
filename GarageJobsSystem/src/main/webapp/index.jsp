<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>2Wheeler Garage Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #e9f0f7;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .login-box {
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
      width: 100%;
      max-width: 400px;
    }
    .login-title {
      font-weight: bold;
      color: #004080;
      text-align: center;
      margin-bottom: 20px;
    }
    .register-link {
      text-align: center;
      margin-top: 15px;
    }
    .btn-login {
      background-color: #004080;
      color: white;
    }
    .btn-login:hover {
      background-color: #0059b3;
    }
  </style>
</head>
<body>
  <div class="login-box">
    <h3 class="login-title">2Wheeler Garage Login</h3>
    <form action="login" method="post">
      <div class="mb-3">
        <label for="username" class="form-label">Username</label>
        <input type="text" name="username" class="form-control" id="username" required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" name="password_hash" class="form-control" id="password" required>
      </div>
      <button type="submit" class="btn btn-login w-100">Login</button>
    </form>
    <div class="register-link">
      <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
  </div>

  <!-- Bootstrap JS (Optional) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>