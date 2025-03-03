package com.qsp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import javax.servlet.http.HttpSession;

@WebServlet("/executeServlet")
public class ExecuteServlet extends HttpServlet
{
	public static int score=0;
	
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	   EntityManagerFactory emf = Persistence.createEntityManagerFactory("devx");
	    EntityManager em = emf.createEntityManager();
	    EntityTransaction et = em.getTransaction();
	    
	    System.out.println("hotay");
	    
	    HttpSession hs=req.getSession();
	    score=0;
	    hs.setAttribute("score", ""+score);
	    
	    System.out.println("do get method score "+(String)hs.getAttribute("score"));
	    
	    if(hs.getAttribute("index")==null)
	    {
	    	hs.setAttribute("index","0");
	    }
	    Query q= em.createQuery("select q from Questions q where q.Difficulty_Level=:level");
	    q.setParameter("level",(String)hs.getAttribute("level"));
	    
	    System.out.println("level he bhau "+hs.getAttribute("level"));
	    
	    List<Questions> li= q.getResultList();
	    Set<Questions> que= new HashSet<>(li);
	    li=new ArrayList<>(que);
	    
	    hs.setAttribute("list", li);
	   // System.out.println("hotay");
	    
//	    RequestDispatcher rd= req.getRequestDispatcher("quiz.jsp");
//	    rd.include(req, resp);
	    return;
	    
	
}
   
   @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   
	   EntityManagerFactory emf = Persistence.createEntityManagerFactory("devx");
	    EntityManager em = emf.createEntityManager();
	    EntityTransaction et = em.getTransaction();
	    
	   HttpSession hs=req.getSession(false);
	   String action=req.getParameter("action");
	   
	   String s=(String)hs.getAttribute("index");
	   int ind = Integer.parseInt(s);
	   
	   List<Questions> li=(List<Questions>)hs.getAttribute("list");
	   
	   
	   String ans=req.getParameter("selectedOption");
	   
	   String name=(String)hs.getAttribute("name");
	   System.out.println("Name is "+name);
	    
	    
//	    if("previous".equals(action) && ind==0)
//	    {
//	    	hs.setAttribute("index","0");
//	    	RequestDispatcher rd=req.getRequestDispatcher("quiz.jsp");
//	    	rd.include(req, resp);
//	    	
//	    }
	    if("previous".equals(action) && ind>0)
	   {
		    ind--;
		    if(score==0)
		    {
		    	score=0;
		    }
		    else {
		    	score--;
		    }
		    
		    hs.setAttribute("score",""+score);
		    System.out.println(" you entered Previous, Score is "+(String)hs.getAttribute("score"));
		    hs.setAttribute("index", ""+ind);
		    RequestDispatcher rd=req.getRequestDispatcher("quiz.jsp");
	    	rd.include(req, resp);
	   }
	    else if("next".equals(action) && ind<li.size()-1)
	   {
	    	
	   		   System.out.println(li.get(ind).getAns());
	   		   System.out.println(ans);
	   		   if(ans==null)
	   		   {
	   			 ind++;
	   			 hs.setAttribute("index", ""+ind);
	   			hs.setAttribute("score",""+score);
	   			RequestDispatcher rd=req.getRequestDispatcher("quiz.jsp");
		    	rd.include(req, resp);
	   		   }
		    	if(ans.equals(li.get(ind).getAns()))
		    	{
		    		score++;
		    		 ind++;
		    		// System.out.println(" you entered next, Score is "+score);
		  		   hs.setAttribute("index", ""+ind);
		  		 hs.setAttribute("score",""+score);
		  		System.out.println(" you entered next, Score is "+(String)hs.getAttribute("score"));
		    		RequestDispatcher rd=req.getRequestDispatcher("quiz.jsp");
			    	rd.include(req, resp);
		    	}
		    	else {
		    		 if(score==0)
		 		    {
		 		    	score=0;
		 		    }
		    		ind++;
		    		
		    		hs.setAttribute("index", ""+ind);
		    		hs.setAttribute("score",""+score);
		    		System.out.println("you entered next, Score is "+(String)hs.getAttribute("score"));
		    		RequestDispatcher rd=req.getRequestDispatcher("quiz.jsp");
			    	rd.include(req, resp);
		    	}
	    	
	   }

	    
	    if("save".equals(action))
	    {
	    	if(ans==null)
	   		   {
	   			 
	   			 hs.setAttribute("index", ""+ind);
	   			hs.setAttribute("score",""+score);
	   			RequestDispatcher rd=req.getRequestDispatcher("submitScore.jsp");
		    	rd.include(req, resp);
	   		   }
	    	if(ans.equals(li.get(ind).getAns()))
	    	{
	    		score++;
	    		//System.out.println(" you entered save and submit, Score is "+score);
	    		hs.setAttribute("score", ""+score);
	    		System.out.println(" you entered save and submit, Score is "+(String)hs.getAttribute("score"));
	    		RequestDispatcher rd=req.getRequestDispatcher("submitScore.jsp");
		    	rd.include(req, resp);
	    	}
	    	else {
	    		 if(score==0)
	 		    {
	 		    	score=0;
	 		    }
	    		 //System.out.println(" you entered save and submit, Score is "+score);
	    		hs.setAttribute("score", ""+score);
	    		System.out.println(" you entered save and submit, Score is "+(String)hs.getAttribute("score"));
	    		RequestDispatcher rd=req.getRequestDispatcher("submitScore.jsp");
		    	rd.include(req, resp);
	    	}	    
	    }
//	    if("saveSubmit".equals(action))
//	    {
//	    	//fetching score
//	    	
//
//
//	    	//System.out.println("Your final action score is "+sc);
//	    	System.out.println("Your final session score is "+(String)hs.getAttribute("score"));
//	    	System.out.println();
//
//	    	//fetching usename 
//	    	
//	    	users user=em.find(users.class,name);
//
//	    	if("easy".equals((String)hs.getAttribute("level")))
//	    	{
//	    		if( score > user.getHighest_Score())
//	    		{
//	    			et.begin();
//	    			user.setHighest_Score(score);
//	    			em.persist(user);
//	    			et.commit();
//	    		}
//	    	}
//	    	if("medium".equals((String)hs.getAttribute("level")))
//	    	{
//	    		if( score > user.getMedium_High_Score())
//	    		{
//	    			et.begin();
//	    			//user.setHighest_Score(ExecuteServlet.score);
//	    			user.setMedium_High_Score(score);
//	    			em.persist(user);
//	    			et.commit();
//	    		}
//	    	}
//	    	if("hard".equals((String)hs.getAttribute("level")))
//	    	{
//	    		if( score > user.getMedium_High_Score())
//	    		{
//	    			et.begin();
//	    			user.setMedium_High_Score(score);
//	    			em.persist(user);
//	    			et.commit();
//	    		}
//	    	}
//
//	    }
		
	}
}
