<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.Persistence"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Question Form</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #f0f4f8, #d6e1f2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .form-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            position: relative;
            width: 400px;
        }

        h1 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 20px;
        }

        .success-message {
            color: #28a745;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        .error-message {
            text-align: center;
            color: red;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-size: 16px;
            color: #333;
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .form-container button:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .back-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    
    <div class="form-container">
        <%if ("easy".equals(session.getAttribute("type"))) { %>
        <% session.setAttribute("type", "easy"); %>
        <a href="easyQuiz.jsp" class="back-btn">Back</a>
        <% } %>
        <%if ("medium".equals(session.getAttribute("type"))) { %>
        <% session.setAttribute("type", "medium"); %>
        <a href="mediumQuiz.jsp" class="back-btn">Back</a>
        <% } %>
        <%if ("hard".equals(session.getAttribute("type"))) { %>
        <% session.setAttribute("type", "hard"); %>
        <a href="hardQuiz.jsp" class="back-btn">Back</a>
        <% } %>
        <% System.out.println(session.getAttribute("type")); %>

        <h2>Add Quiz Question</h2>
        <form action="submitQuestions.jsp">
            <div class="form-group">
                <label for="questionId">Question ID:</label>
                <input type="text" id="questionId" name="questionId" required>
            </div>
            <div class="form-group">
                <label for="difficultyLevel">Difficulty Level:</label>
                <select id="difficultyLevel" name="difficultyLevel" required>
                <% if ("easy".equals(session.getAttribute("type"))) { %>
                    <option value="easy">Easy</option>
                <% } %> 
                <% if ("medium".equals(session.getAttribute("type"))) { %>
                    <option value="medium">Medium</option>
                <% } %>
                <% if ("hard".equals(session.getAttribute("type"))) { %>
                    <option value="hard">Hard</option>
                <% } %> 
                </select>
            </div>
            <div class="form-group">
                <label for="questionText">Question:</label>
                <input type="text" id="questionText" name="questionText" required>
            </div>
            <div class="form-group">
                <label for="option1">Option 1:</label>
                <input type="text" id="option1" name="option1" required>
            </div>
            <div class="form-group">
                <label for="option2">Option 2:</label>
                <input type="text" id="option2" name="option2" required>
            </div>
            <div class="form-group">
                <label for="option3">Option 3:</label>
                <input type="text" id="option3" name="option3" required>
            </div>
            <div class="form-group">
                <label for="option4">Option 4:</label>
                <input type="text" id="option4" name="option4" required>
            </div>
            <div class="form-group">
                <label for="answer">Answer:</label>
                <input type="text" id="answer" name="answer" required>
            </div>
            <button type="submit">Submit Question</button>
        </form>
    </div>
</body>
</html>
