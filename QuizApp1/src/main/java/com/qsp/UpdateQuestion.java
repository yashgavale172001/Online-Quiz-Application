package com.qsp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateQuestion")
public class UpdateQuestion extends HttpServlet
{
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("devx");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	String Id=req.getParameter("Id");
	int id=Integer.parseInt(Id);
	
	String Question=req.getParameter("questionText");
	String Op1=req.getParameter("option1");
	String Op2=req.getParameter("option2");
	String Op3=req.getParameter("option3");
	String Op4=req.getParameter("option4");
	String Ans=req.getParameter("answer");
	

	Questions q=em.find(Questions.class,id);
	
	q.setQuestion(Question);
	q.setOption1(Op1);
	q.setOption2(Op2);
	q.setOption3(Op3);
	q.setOption4(Op4);
	q.setAns(Ans);


	et.begin();
	em.persist(q);
	et.commit();

	resp.setContentType("text/html");
	PrintWriter pw=resp.getWriter();
	pw.print("<h2 style='"
	        + "color: #388E3C; " /* Success Green */
	        + "font-family: Arial, sans-serif; " 
	        + "text-align: center; " 
	        + "background-color: #C8E6C9; " /* Light Green Background */
	        + "border: 1px solid #A5D6A7; " /* Light Green Border */
	        + "padding: 15px; " 
	        + "border-radius: 8px; " 
	        + "box-shadow: 0 4px 6px rgba(0,0,0,0.1); " 
	        + "margin: 20px auto; " 
	        + "width: 80%;'>"
	        + "Question Updated Successfully!"
	        + "</h2>");
    
    	RequestDispatcher rd = req.getRequestDispatcher("update.jsp"); 
    	rd.include(req, resp);
	
	
}
}
