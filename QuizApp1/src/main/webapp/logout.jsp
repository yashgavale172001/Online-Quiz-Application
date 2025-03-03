<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% HttpSession s=request.getSession(false);
 s.invalidate();
 
 
 //String action=request.getParameter("sbt");
// if(action.equals("submitScore"))
//{
	// RequestDispatcher rd=request.getRequestDispatcher(".jsp");
	// rd.include(request, response);
//}
// else{
	 RequestDispatcher rd=request.getRequestDispatcher("admin-login.html");
	 rd.include(request, response);
// }
 
%>
</body>
</html>