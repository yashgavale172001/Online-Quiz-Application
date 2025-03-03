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

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	String Name=req.getParameter("adminName");
    	String Password=req.getParameter("adminPassword");
    	
    	EntityManagerFactory emf=Persistence.createEntityManagerFactory("devx");
    	EntityManager em=emf.createEntityManager();
    	EntityTransaction et=em.getTransaction();
    	HttpSession hs= req.getSession();
    	hs.setAttribute("Name", Name);
    	Admin a1=em.find(Admin.class,Name);
    	
    	if(a1!=null)
    	{
    		if(a1.getUserName().equals(Name) && a1.getPassword().equals(Password))
    		{
    			
    			RequestDispatcher rd=req.getRequestDispatcher("AdminDashboard.jsp");
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
    			RequestDispatcher rd=req.getRequestDispatcher("admin-login.html");
    			rd.include(req, resp);
    		}
    	}
    	else{
    		resp.setContentType("text/html");
    		PrintWriter pw=resp.getWriter();
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
    		        + "width: 80%; "
    		        + "top:0%;"
    		        + "User Does Not Exist!.. Login Again"
    		        + "</h2>");

    		RequestDispatcher rd=req.getRequestDispatcher("admin-login.html");
			rd.include(req, resp);
    	}
    	
    }
}
