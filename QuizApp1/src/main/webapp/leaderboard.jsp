<!DOCTYPE html>
<%@page import="com.qsp.users"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<html>
<head>
    <title>User Scores</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
        }
        .container {
            text-align: center;
            background: #ffffff;
            padding: 20px 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
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
        tr:nth-child(even) {
            background-color: #f9f9f9;
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
    <div class="container">
        <h2>User Scores</h2>
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Highest Score</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Sample data, replace with your logic for retrieving users and scores
                    EntityManagerFactory emf = Persistence.createEntityManagerFactory("devx");
                    EntityManager em = emf.createEntityManager();
                    EntityTransaction et = em.getTransaction();
                    
                    HttpSession hs=request.getSession();
                    String level=request.getParameter("difficulty");
                    
                    System.out.println(level);
                    
                    Query query=null;
                    if("easy".equals(level))
                    {
                    	query=em.createQuery("SELECT u FROM users u ORDER BY Highest_Score DESC");
                    }
                    if("medium".equals(level))
                    {
                    	query=em.createQuery("SELECT u FROM users u ORDER BY Medium_High_Score DESC");
                    }
                    if("hard".equals(level))
                    {
                    	query=em.createQuery("SELECT u FROM users u ORDER BY Hard_High_Score DESC");
                    }
                    
                    List<users> li=query.getResultList();
                    
                    for (users u : li) {
                %>
                    <% if("easy".equals(level)) { %>
                    <tr>
                        <td><%= u.getUser_name() %></td>
                        <td><%= u.getHighest_Score() %></td>
                    </tr>
                    <%} %>
                    <% if("medium".equals(level)) { %>
                    <tr>
                        <td><%= u.getUser_name() %></td>
                        <td><%= u.getMedium_High_Score() %></td>
                    </tr>
                    <%} %>
                    <% if("hard".equals(level)) { %>
                    <tr>
                        <td><%= u.getUser_name() %></td>
                        <td><%= u.getHard_High_Score() %></td>
                    </tr>
                    <%} %>
                <% 
                    }
                %>
            </tbody>
        </table>
        <form action="UserDashBoard.jsp" >
            <button type="submit">Back</button>
        </form>
    </div>
</body>
</html>
