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
    <title>User Details</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }
        .container {
            text-align: center;
            background: #ffffff;
            padding: 30px 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        h2 {
            margin-bottom: 10px;
            color: #333;
        }
        p {
            margin: 10px 0;
            font-size: 18px;
            color: #555;
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
        <h2>User Details</h2>
        <p><strong>Username:</strong> <%= user.getUser_name() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Password:</strong> <%= user.getPassword() %></p>
        <form action="UserDashBoard.jsp" method="post">
            <button type="submit">Back</button>
        </form>
    </div>
</body>
</html>
