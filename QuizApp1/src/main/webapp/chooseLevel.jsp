<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Difficulty Level</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .back-button {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .back-button button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .back-button button:hover {
            background-color: #0056b3;
        }
        .container {
            background: #ffffff;
            padding: 30px 40px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        select {
            width: 70%; /* Increased width */
            height: 40px; /* Increased height */
            padding: 5px;
            font-size: 16px; /* Larger font size */
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
        }
        button.submit-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin-top: 20px; /* Increased top margin */
        }
        button.submit-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <!-- Back Button -->
    <div class="back-button">
        <form action="UserDashBoard.jsp">
            <button type="submit">Back</button>
        </form>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h2>Select Difficulty Level</h2>
        <form action="leaderboard.jsp">
            <select name="difficulty" required>
                <option value="" disabled selected>Select Difficulty</option>
                <option value="easy">Easy</option>
                <option value="medium">Medium</option>
                <option value="hard">Hard</option>
            </select>
            <br>
            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>
</body>
</html>
