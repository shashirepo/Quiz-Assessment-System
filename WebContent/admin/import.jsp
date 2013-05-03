<%@ page language="java" import="java.io.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Db.jsp" %>

<%
     String query;
    String file=request.getParameter("file");
     String ftype=request.getParameter("import");
    // String qbank=request.getParameter("banktype");
   out.println(file);
 Statement st=conn.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	 if(ftype.equals("0"))
	 query="LOAD DATA INFILE '"+file+"' INTO TABLE tbl_question_banks(text,price);";
	 else
	  query = "LOAD DATA INFILE '"+file+"' INTO TABLE tbl_question_banks  FIELDS TERMINATED BY ',' (qtext,option1,option2,option3,option4,clue,answer,uploaded_by,qtype)";
	 
	 st.executeUpdate(query);

	
 
 
 %> 