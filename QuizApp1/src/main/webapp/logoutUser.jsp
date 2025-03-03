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
//HttpSession hs=request.getSession(false);
//hs.invalidate();

HttpSession ss = request.getSession(false); // Get existing session if available
if (ss != null) {
    ss.invalidate(); // Invalidate the session
    ss = request.getSession(false); // Try fetching it again
    if (ss == null) {
        System.out.println("Session invalidated successfully.");
    } else {
        System.out.println("Session still exists.");
    }
} else {
    System.out.println("No session to invalidate.");
}

RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
rd.forward(request, response);
%>
</body>
</html>