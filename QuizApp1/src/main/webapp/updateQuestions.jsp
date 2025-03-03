
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.qsp.Questions"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Questions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f0f0f0;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .delete-btn {
            padding: 5px 10px;
            color: #fff;
            background-color: #e74c3c;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .delete-btn:hover {
            background-color: #c0392b;
        }

        /* Add back button styling */
        .back-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
        }

        .back-btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <!-- Back button as a hyperlink -->
    <%if ("easy".equals(session.getAttribute("type"))) { %>
    <a href="easyQuiz.jsp" class="back-btn">Back</a>
<% } %>
<%if ("medium".equals(session.getAttribute("type"))) { %>
    <a href="mediumQuiz.jsp" class="back-btn">Back</a>
<% } %>
<%if ("hard".equals(session.getAttribute("type"))) { %>
    <a href="hardQuiz.jsp" class="back-btn">Back</a>
<% } %>

    <div class="container">
        <h1>Update Questions</h1>
        <table>
            <thead>
                <tr>
                    <th>Question ID</th>
                    <th>Difficulty Level</th>
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Answer</th>
                    <th>Action</th>
                </tr>
            </thead>
            <%
             EntityManagerFactory emf=Persistence.createEntityManagerFactory("devx");
            EntityManager em=emf.createEntityManager();
            EntityTransaction et=em.getTransaction();
            
            Query q = em.createQuery("SELECT q FROM Questions q WHERE q.Difficulty_Level = :level");
            q.setParameter("level", session.getAttribute("type"));
            List<Questions> results = q.getResultList();
            
         // Set the results list as a request attribute
            request.setAttribute("questionsList", results);
            %>
           <tbody>
     <% for (Questions question : results) { %>
        <tr>
            <td><%= question.getId() %></td>
            <td><%= question.getDifficulty_Level() %></td>
            <td><%= question.getQuestion() %></td>
            <td><%= question.getOption1() %></td>
            <td><%= question.getOption2() %></td>
            <td><%= question.getOption3() %></td>
            <td><%= question.getOption4() %></td>
            <td><%= question.getAns() %></td>
            <td>
                <!-- Delete button -->
                <form action="update.jsp"  style="display: inline;">
                    <input type="hidden" name="questionId" value="<%= question.getId() %>" />
                    
                    <button type="submit" class="delete-btn">Update</button>
                </form>
            </td>
        </tr>
    <% } %>
</tbody>
            
        </table>
    </div>
</body>
</html>
