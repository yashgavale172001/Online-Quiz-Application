<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Quiz Levels</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f3f7f9, #dbe6f6);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .dashboard-container {
            text-align: center;
            background: #ffffff;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            font-size: 26px;
            color: #333;
            margin-bottom: 30px;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .dashboard-btn {
            display: inline-block;
            background-color: #007BFF;
            color: #fff;
            padding: 15px 25px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            animation: bounceIn 0.8s ease-out;
        }

        .dashboard-btn:hover {
            background-color: #0056b3;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .dashboard-btn:nth-child(1) {
            background-color: #28a745;
            animation-delay: 0.1s;
        }

        .dashboard-btn:nth-child(2) {
            background-color: #ffc107;
            animation-delay: 0.2s;
        }

        .dashboard-btn:nth-child(3) {
            background-color: #dc3545;
            animation-delay: 0.3s;
        }

        /* Back and Logout Buttons */
        .utility-btn {
            position: absolute;
            top: 20px;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .back-btn {
            left: 20px;
            background-color: #6c757d; /* Gray */
        }

        .back-btn:hover {
            background-color: #5a6268;
            box-shadow: 0 4px 10px rgba(108, 117, 125, 0.5);
        }

        .logout-btn {
            right: 20px;
            background-color: #ff5c5c; /* Light Red */
        }

        .logout-btn:hover {
            background-color: #e04e4e;
            box-shadow: 0 4px 10px rgba(255, 92, 92, 0.5);
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.8);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes bounceIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <!-- Back Button -->
    <a href="admin-login.html" class="utility-btn back-btn">Back</a>
    <!-- Logout Button -->
    <a href="logout.jsp" class="utility-btn logout-btn">Logout</a>

<% 
HttpSession s=request.getSession();
String Name=(String)s.getAttribute("Name");
%>
<h3> Welcome <%= Name %></h3>
    <div class="dashboard-container">
        <h2>Select Quiz To Manage </h2>
        <div class="btn-container">
            <a href="easyQuiz.jsp" class="dashboard-btn">Easy</a>
            <a href="mediumQuiz.jsp" class="dashboard-btn">Medium</a>
            <a href="hardQuiz.jsp" class="dashboard-btn">Hard</a>
        </div>
    </div>
</body>
</html>