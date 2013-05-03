<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.servlet.http.Cookie"%>
<%
Cookie[] cookies=request.getCookies();
if(cookies!=null)
{
	  for(int i=0;i<cookies.length;i++)
	  {
		  
		  cookies[i].setMaxAge(0);
		  response.addCookie(cookies[i]);
	  }
}
if(session.getAttribute("user")!=null)
{
	session.invalidate();
}
     response.sendRedirect("index.jsp");
%>
