<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Difficulty Levels</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #E0F7FA, #FFFFFF);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Container Styling */
        .difficulty-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            padding: 40px 20px;
            text-align: center;
            width: 100%;
            max-width: 600px;
            animation: fadeIn 1s ease-in-out;
            display: flex;
            flex-direction: column;
            align-items: center;
            box-sizing: border-box;
        }

        .difficulty-container h1 {
            margin-bottom: 30px;
            color: #333333;
        }

        /* Button Container (Flexbox for side-by-side layout) */
        .btn-container {
            display: flex;
            gap: 15px; /* Space between buttons */
            width: 100%;
            justify-content: center; /* Center the buttons horizontally */
        }

        /* Difficulty Buttons */
        .difficulty-btn {
            background-color: #007BFF;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            width: auto; /* Adjust width to auto so the buttons are side-by-side */
            text-align: center;
            box-sizing: border-box;
        }

        .difficulty-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .difficulty-btn.easy {
            background-color: #28a745;
        }

        .difficulty-btn.easy:hover {
            background-color: #218838;
        }

        .difficulty-btn.medium {
            background-color: #ffc107;
        }

        .difficulty-btn.medium:hover {
            background-color: #e0a800;
        }

        .difficulty-btn.hard {
            background-color: #dc3545;
        }

        .difficulty-btn.hard:hover {
            background-color: #c82333;
        }

        /* Back Button */
        .back-btn {
            background-color: #6c757d;
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            margin-top: 30px;
            display: inline-block;
            transition: all 0.3s ease;
            text-align: center;
            box-sizing: border-box;
        }

        .back-btn:hover {
            background-color: #5a6268;
            transform: translateY(-3px);
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<%
 
// Simulating a user session
HttpSession s = request.getSession(false);
String userName = (String) s.getAttribute("name");
System.out.println(userName);
%>
    <div class="difficulty-container">
        <h1>Select Difficulty Level</h1>
        <form action="quiz.jsp">
            <div class="btn-container">
                <!-- Easy Difficulty -->
                <button type="submit" class="difficulty-btn easy" name="level" value="easy">Easy</button>
                <!-- Medium Difficulty -->
                <button type="submit" class="difficulty-btn medium" name="level" value="medium">Medium</button>
                <!-- Hard Difficulty -->
                <button type="submit" class="difficulty-btn hard" name="level" value="hard">Hard</button>
            </div>
        </form>
        <!-- Back Button -->
        <a href="UserDashBoard.jsp" class="back-btn">Back</a>
    </div>
</body>
</html>
