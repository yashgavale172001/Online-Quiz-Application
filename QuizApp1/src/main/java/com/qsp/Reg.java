package com.qsp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Reg extends HttpServlet
{
  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String Name=req.getParameter("username");
	String Password=req.getParameter("password");
    String Email=req.getParameter("email");
    
	if(Password.length()>6)
	{
		
		//RequestDispatcher rd=req.getRequestDispatcher("");
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("devx");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		users u=em.find(users.class,Name);
		System.out.println(u);
		if(u==null)
		{
			users u1=new users();
			u1.setUser_name(Name);
			u1.setPassword(Password);
			u1.setEmail(Email);
			u1.setHighest_Score(0);
			et.begin();
			em.persist(u1);
			et.commit();
		
			
			resp.setContentType("text/html");
			PrintWriter pw = resp.getWriter();
			pw.print("<h2>Registration Successful. Login here:</h2>");
			RequestDispatcher rd = req.getRequestDispatcher("login.html"); 
			rd.include(req, resp);
		}
		else {
			resp.setContentType("text/html");
			RequestDispatcher rd = req.getRequestDispatcher("register.html"); 
			PrintWriter pw = resp.getWriter();
			rd.include(req, resp);
		
			pw.print("<h2 style='"
			        + "color: #D32F2F; " /* Error Red */
			        + "font-family: Arial, sans-serif; " 
			        + "text-align: center; " 
			        + "background-color: #F8D7DA; " /* Light Red Background */
			        + "border: 1px solid #F5C6CB; " /* Light Red Border */
			        + "padding: 15px; " 
			        + "border-radius: 8px; " 
			        + "box-shadow: 0 4px 6px rgba(0,0,0,0.1); " 
			        + "margin: 20px auto; " 
			        + "width: 80%;'>"
			        + "UserName Already Exists, Please choose another one"
			        + "</h2>");

		}
		
				  
	}
	else {
		RequestDispatcher rd=req.getRequestDispatcher("register.html");
		PrintWriter pw=resp.getWriter();
		rd.include(req, resp);
		//pw.print("<h5>Password must be more than 6 digits.</h5>");
		pw.print("<div style='"
		        + "width: 400px; "
		        + "margin: 50px auto; "
		        + "padding: 20px; "
		        + "background-color: #fff3cd; "
		        + "border: 1px solid #ffeeba; "
		        + "border-radius: 8px; "
		        + "font-family: Arial, sans-serif; "
		        + "color: #856404; "
		        + "text-align: center; "
		        + "box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>"
		        + "<h5 style='margin: 0; font-size: 18px;'>Password must be more than 6 digits.</h5>"
		        + "</div>");

	}
	
	
}
}

