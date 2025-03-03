<%@page import="com.qsp.ExecuteServlet"%>
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
<meta charset="UTF-8">
<title>Score Page</title>
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
            padding: 20px 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }
        h2 {
            margin-bottom: 20px;
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

HttpSession hs=request.getSession(false);

//fetching score
String scr=(String)hs.getAttribute("score");
int score=Integer.parseInt(scr);


//System.out.println("Your final action score is "+sc);
System.out.println("Your final session score is "+score);

//fetching usename 
String name=(String)hs.getAttribute("name");
users user=em.find(users.class,name);

if("easy".equals((String)hs.getAttribute("level")))
{
	if( score > user.getHighest_Score())
	{
		et.begin();
		user.setHighest_Score(score);
		em.persist(user);
		et.commit();
	}
}
if("medium".equals((String)hs.getAttribute("level")))
{
	if( score > user.getMedium_High_Score())
	{
		et.begin();
		//user.setHighest_Score(ExecuteServlet.score);
		user.setMedium_High_Score(score);
		em.persist(user);
		et.commit();
	}
}
if("hard".equals((String)hs.getAttribute("level")))
{
	if( score > user.getMedium_High_Score())
	{
		et.begin();
		user.setHard_High_Score(score);
		em.persist(user);
		et.commit();
	}
}


%>

<div class="container">
        <h2>Your score is <%= score %> out of 10</h2>
        <form action="UserDashBoard.jsp">
            <button type="submit" name="sbt" value="submitScore">Back</button>
        </form>
    </div>
</body>
</html>