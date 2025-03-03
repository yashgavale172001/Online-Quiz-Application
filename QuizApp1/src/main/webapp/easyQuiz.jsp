<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Easy Quiz</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #e8f1f7, #d4e6f2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .dashboard-container {
            text-align: center;
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-out;
            position: relative;
        }

        h2 {
            font-size: 24px;
            color: #007BFF;
            margin-bottom: 20px;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .dashboard-btn {
            background-color: #007BFF;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            animation: slideIn 0.8s ease-in-out;
        }

        .dashboard-btn:hover {
            background-color: #0056b3;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            transform: translateY(-3px);
        }

        .dashboard-btn:nth-child(1) {
            animation-delay: 0.1s;
        }

        .dashboard-btn:nth-child(2) {
            animation-delay: 0.2s;
        }

        .dashboard-btn:nth-child(3) {
            animation-delay: 0.3s;
        }

        .back-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #6c757d;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            text-decoration: none;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background-color: #5a6268;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
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

        @keyframes slideIn {
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
	<% session.setAttribute("type", "easy"); %>

    <div class="dashboard-container">
        <a href="AdminDashboard.jsp" class="back-btn">Back</a>
        <h2>Manage Easy Quiz</h2>
        <div class="btn-container">
            <a href="addQuestions.jsp" class="dashboard-btn">Add Questions</a>
            <a href="deleteQuestions.jsp" class="dashboard-btn">Delete Questions</a>
            <a href="updateQuestions.jsp" class="dashboard-btn">Update Questions</a>
        </div>
    </div>
</body>
</html>
