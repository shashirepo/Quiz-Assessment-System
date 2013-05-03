<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Db.jsp" %>

<% 
Statement st=conn.createStatement();



int qno=Integer.parseInt(request.getParameter("qno"));
/*String ans=request.getParameter("ans");
*/
int id=1,quizid=1,credit=1;
String ans= request.getParameter("ans");

   
    String query="Insert into tbl_quiz_question_response_states(`id`, `quizid`, `qid`, `response`, `credit`) values("+id+","+quizid+","+qno+",'"+ans+"',"+credit+")";
   
    st.execute(query);
    
    
    
%>