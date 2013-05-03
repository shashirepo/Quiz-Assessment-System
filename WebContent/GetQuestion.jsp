<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<%@include file="Db.jsp" %>

<% 
Statement st=conn.createStatement();



int qno=Integer.parseInt(request.getParameter("qno"));


   
    String query="select question from tbl_question where qid="+qno;
    ResultSet rs=st.executeQuery(query);
    if(rs.first())
    {
           out.print( rs.getString("question"));
    }
%>