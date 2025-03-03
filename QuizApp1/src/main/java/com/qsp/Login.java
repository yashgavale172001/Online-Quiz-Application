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
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet
{
	public static String name;
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String Name=req.getParameter("username");
	String Password=req.getParameter("password");
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("devx");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	 
	HttpSession hs=req.getSession();
	hs.setAttribute("name",Name );
	name=Name;
	
	users u=em.find(users.class,Name);
    if(u!=null)
    {
    	if(u.getUser_name().equals(Name) && u.getPassword().equals(Password))
    	{
    	  RequestDispatcher rd=req.getRequestDispatcher("UserDashBoard.jsp");
    	  rd.include(req, resp);
    	}
    	else {
    		resp.setContentType("text/html");
    		PrintWriter pw=resp.getWriter();
    		pw.print("<div style='"
    		        + "width: 400px; "
    		        + "margin: 50px auto; "
    		        + "padding: 20px; "
    		        + "background-color: #f8d7da; "
    		        + "border: 1px solid #f5c6cb; "
    		        + "border-radius: 8px; "
    		        + "font-family: Arial, sans-serif; "
    		        + "color: #721c24; "
    		        + "text-align: center; "
    		        + "box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>"
    		        + "<h3 style='margin: 0; font-size: 18px;'>Wrong username or Password</h3>"
    		        + "</div>");

    		RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
    		rd.include(req, resp);
    		
    	}
    }
    else {
    	resp.setContentType("text/html");
		PrintWriter pw=resp.getWriter();
		pw.print("<div style='"
		        + "width: 400px; "
		        + "margin: 50px auto; "
		        + "padding: 20px; "
		        + "background-color: #f8d7da; "
		        + "border: 1px solid #f5c6cb; "
		        + "border-radius: 8px; "
		        + "font-family: Arial, sans-serif; "
		        + "color: #721c24; "
		        + "text-align: center; "
		        + "box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>"
		        + "<h3 style='margin: 0; font-size: 18px;'>User Not Exist!.. Register Here</h3>"
		        + "</div>");

		RequestDispatcher rd=req.getRequestDispatcher("register.html");
		rd.include(req, resp);
    }
}
}
