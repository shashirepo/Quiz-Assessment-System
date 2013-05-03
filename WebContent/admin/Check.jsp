<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="Db.jsp" %>
<%@ page  import="java.security.*" import="javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
public String Encrypte(String hex)
{
	try
	{
		 char[] HEX_CHARS = "0123456789ABCDEF".toCharArray();
		 String input = "your string";
		 MessageDigest digest = MessageDigest.getInstance("SHA-256");
		 digest.update(input.getBytes("UTF-8"));
		 byte[] hash = digest.digest();
		StringBuilder sb = new StringBuilder(hash.length * 2);
		for (byte b : hash) {
		    sb.append(HEX_CHARS[(b & 0xF0) >> 4]);
		    sb.append(HEX_CHARS[b & 0x0F]);
		}
		 hex = sb.toString();
	     
	}
	catch(Exception e)
	{
		
	}
	return hex;
}

%>
<%
boolean flag=false;
String email=request.getParameter("username");

String pass=request.getParameter("password");

Statement st=conn.createStatement();
String query="select * from tbl_admin_login where email='"+email+"'";
ResultSet rs=st.executeQuery(query);

while(rs.next())
{
if((rs.getString("email").equals(email)) & (rs.getString("password").equals(pass)))
{
	flag=true;
	break;
}
}
if(flag)
{
//	Cookie cookie = new Cookie ("userid",Encrypte(pass));             // create Cookie
	//cookie.setMaxAge(60 * 60);                               
	//response.addCookie(cookie);	 
	//session.setAttribute("userid",Encrypte(pass+email));      // Create The Session
	response.sendRedirect("admin.jsp");
}
else
{
	      response.sendError(500,"index.jsp?err=1");                   //error redirect
}

%>