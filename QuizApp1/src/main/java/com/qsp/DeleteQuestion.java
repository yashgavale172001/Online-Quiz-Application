package com.qsp;

import java.io.IOException;

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

@WebServlet("/deleteQuestion")
public class DeleteQuestion extends HttpServlet
{
  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("devx");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	String Id=req.getParameter("questionId");
	int id=Integer.parseInt(Id);
	

	Questions q=em.find(Questions.class,id);
	
	et.begin();
	em.remove(q);
	et.commit();
	
	
	RequestDispatcher rd=req.getRequestDispatcher("deleteQuestions.jsp");
	rd.forward(req, resp);
	
	
//	if(q.getDifficulty_Level().equalsIgnoreCase("easy"))
//	{
//		RequestDispatcher rd=req.getRequestDispatcher("deleteQuestions.jsp");
//		rd.forward(req, resp);
//	}
//	if(q.getDifficulty_Level().equalsIgnoreCase("medium"))
//	{
//		RequestDispatcher rd=req.getRequestDispatcher("deleteMediumQuestions.jsp");
//		rd.forward(req, resp);
//	}
//	if(q.getDifficulty_Level().equalsIgnoreCase("hard"))
//	{
//		RequestDispatcher rd=req.getRequestDispatcher("deleteHardQuestions.jsp");
//		rd.forward(req, resp);
//	}
	
	
}
}
