<%@page import="java.io.PrintWriter"%>
<%@page import="com.qsp.Questions"%>
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
<title>Insert title here</title>
</head>
<body>
<%


EntityManagerFactory emf=Persistence.createEntityManagerFactory("devx");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();

String Id=request.getParameter("questionId");
String difficultyLevel =request.getParameter("difficultyLevel");
String Question=request.getParameter("questionText");
String Op1=request.getParameter("option1");
String Op2=request.getParameter("option2");
String Op3=request.getParameter("option3");
String Op4=request.getParameter("option4");
String Ans=request.getParameter("answer");



int id=Integer.parseInt(Id);

Questions que=em.find(Questions.class,id);

if(que == null)
{
	Questions q=new Questions();

	q.setId(id);
	q.setQuestion(Question);
	q.setOption1(Op1);
	q.setOption2(Op2);
	q.setOption3(Op3);
	q.setOption4(Op4);
	q.setDifficulty_Level(difficultyLevel);
	q.setAns(Ans);


	et.begin();
	em.persist(q);
	et.commit();

	response.setContentType("text/html");
	PrintWriter pw=response.getWriter();
	pw.print("<h1 class='success-message'> Data Saved Successfully! Add Another Question</h1>");
    
    	RequestDispatcher rd = request.getRequestDispatcher("addQuestions.jsp"); 
    	rd.include(request, response);
    
	
}
else{
	response.setContentType("text/html");
	PrintWriter pw = response.getWriter();
	pw.print("<h1 class='error-message'> Id already exist! Please Enter another Id</h1>");

	RequestDispatcher rd = request.getRequestDispatcher("addQuestions.jsp"); 
	rd.include(request, response);
}

%>
</body>
</html>