<%@page import="com.qsp.users"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Highest Scores</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .container {
            text-align: center;
            background: #ffffff;
            padding: 20px 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
EntityManagerFactory emf = Persistence.createEntityManagerFactory("devx");
EntityManager em = emf.createEntityManager();
EntityTransaction et = em.getTransaction();

HttpSession hs=request.getSession();
String name=(String)hs.getAttribute("name");



users user=em.find(users.class,name);


%>
    <div class="container">
        <h2>Quiz Highest Scores</h2>
        <table>
            <tr>
                <th>Easy Quiz High Score</th>
                <th>Medium Quiz High Score</th>
                <th>Hard Quiz High Score</th>
            </tr>
            <tr>
                <td><%= user.getHighest_Score() %></td>
                <td><%= user.getMedium_High_Score() %></td>
                <td><%= user.getHard_High_Score() %></td>
            </tr>
        </table>
        <form action="UserDashBoard.jsp" >
            <button type="submit">Back</button>
        </form>
    </div>
</body>
</html>
