<%@ page language="java" import="java.sql.*,java.io.*"
   %>


<% 
Connection conn = null;
  String url = "jdbc:mysql://localhost:3306/";
  String dbName = "technox";
  String driver = "com.mysql.jdbc.Driver";
  String userName = "root"; 
  String password = "";
try {
  Class.forName(driver).newInstance();
  conn = DriverManager.getConnection(url+dbName,userName,password);
  
  } catch (Exception e) {
  e.printStackTrace();
  }
%>
   
