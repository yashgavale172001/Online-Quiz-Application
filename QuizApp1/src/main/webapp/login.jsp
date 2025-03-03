<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Online Quiz App</title>
<style>
/* General styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
}

/* Login container */
.login-container {
    width: 300px;
    padding: 40px;
    margin: 100px auto;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #333;
}

.input-field {
    margin-bottom: 20px;
}

.input-field label {
    font-weight: bold;
}

.input-field input {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    margin-bottom: 10px;
}

button:hover {
    background-color: #45a049;
}

.link-section {
    text-align: center;
    margin-top: 10px;
}

.link-section a {
    color: #FF5733;
    text-decoration: none;
    font-weight: bold;
}

.link-section a:hover {
    text-decoration: underline;
}

.signup-link a {
    color: #4CAF50;
    text-decoration: none;
}

.signup-link a:hover {
    text-decoration: underline;
}

</style>
</head>
<body>

<div class="login-container">
    <h2>Login to Quiz App</h2>
    <form action="login">
        <div class="input-field">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="input-field">          
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" name="role" value="user">User Login</button>
    </form>
    <div class="link-section">
        <p><a href="admin-login.html">Admin Login</a></p>
    </div>
    <div class="signup-link">
        <p>Don't have an account? <a href="register.html">Sign up here</a></p>
    </div>
</div>   
</body>
</html>
