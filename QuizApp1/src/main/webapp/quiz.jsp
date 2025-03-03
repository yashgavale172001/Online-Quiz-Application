<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.qsp.Questions"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Easy Quiz</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #E0F7FA, #FFFFFF);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container Styling */
        .quiz-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 100%;
            max-width: 800px;
            text-align: center;
            box-sizing: border-box;
            margin-bottom: 20px; /* Add spacing for the submit button */
        }

        .quiz-container h2 {
            color: #333;
            margin-bottom: 30px;
            font-size: 30px;
        }

        .quiz-question {
            text-align: left;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .quiz-options {
            display: flex;
            flex-direction: column;
            gap: 15px;
            text-align: left;
            margin-top: 20px;
        }

        .quiz-option {
            background-color: #007BFF;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.3s ease;
            text-align: left;
            box-sizing: border-box;
        }

        .quiz-option:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }

        /* Buttons Styling */
        .prev-btn, .next-btn, .save-btn, .submit-btn {
            background-color: #007BFF; /* Blue */
            color: white;
            padding: 14px 30px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
            display: inline-block;
            max-width: 200px;
            transition: all 0.3s ease;
        }

        .prev-btn:hover, .next-btn:hover, .save-btn:hover, .submit-btn:hover {
            background-color: #0056b3;
        }

        .save-btn {
            background-color: #28a745;
        }

        .save-btn:hover {
            background-color: #218838;
        }

        .submit-btn {
            background-color: #6c757d;
        }

        .submit-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
<%
HttpSession hs = request.getSession();

String userName = (String) hs.getAttribute("name");
System.out.println(userName);
//set level =difficulty_level (which just came 1st time when you click easy quiz)
if(request.getParameter("level")!=null)
{
	hs.setAttribute("level",request.getParameter("level") );
}

String index = (String) hs.getAttribute("index");

System.out.println(hs.getAttribute("level"));

if (index == null) {
	System.out.println("index "+index);
    RequestDispatcher rd = request.getRequestDispatcher("executeServlet");
    rd.include(request, response);
}

String index1 = (String) hs.getAttribute("index");
int ind=Integer.parseInt(index1);


System.out.println("index " + ind);
List<Questions> que = (List<Questions>)hs.getAttribute("list");
%>


<div class="quiz-container">
    <h2> Quiz</h2>
    <form action="executeServlet" method="post">
        <!-- Question Display -->
        <div class="quiz-question">
            <p>Question: <%= que.get(ind).getQuestion() %></p>
        </div>

        <!-- Options Display -->
        <div class="quiz-options">
            <label>
                <input type="radio" name="selectedOption" value="<%= que.get(ind).getOption1() %>"> 
                A) <%= que.get(ind).getOption1() %>
            </label>
            <label>
                <input type="radio" name="selectedOption" value="<%= que.get(ind).getOption2() %>"> 
                B) <%= que.get(ind).getOption2() %>
            </label>
            <label>
                <input type="radio" name="selectedOption" value="<%= que.get(ind).getOption3() %>"> 
                C) <%= que.get(ind).getOption3() %>
            </label>
            <label>
                <input type="radio" name="selectedOption" value="<%= que.get(ind).getOption4() %>"> 
                D) <%= que.get(ind).getOption4() %>
            </label>
        </div>

        <!-- Navigation Buttons -->
        <input type="hidden" name="index" value="<%= ind %>">
        
        <% if(ind > 0) { %>
        <button type="submit" name="action" value="previous" class="prev-btn">Previous</button>
        <%} %>
        <% if(ind== 0) { %>
       <button disabled type="submit" name="action" value="previous" class="prev-btn">Previous</button>
        <%} %>
        
        <% if(ind < que.size()-1) { %>
        <button type="submit" name="action" value="next" class="next-btn">Save & Next</button>
        <%} %>
        
        <% if(ind==que.size()-1) { %>
        <button  type="submit" name="action" value="save" class="save-btn">Save & submit</button>
        <%} %>
    </form>
</div>

<!-- Submit Button Outside and Below Quiz Container -->
<form action="submitScore.jsp">
    <button type="submit" name="action" value="saveSubmit" class="submit-btn">Submit Quiz</button>
</form>
</body>
</html>
