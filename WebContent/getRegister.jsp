<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" import="java.sql.*"%>
<%@include file="Db.jsp" %>
<%!
private byte[] getImage(String filename) {
byte[] result = null;
String fileLocation = filename;
File f = new File(fileLocation);
result = new byte[(int)f.length()];
try {
FileInputStream in = new FileInputStream(fileLocation);
in.read(result);
in.close();
}
catch(Exception ex) {
System.out.println("GET IMAGE PROBLEM :: "+ex);
ex.printStackTrace();
}

return result;
}
%>
<%
String saveFile="";
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File(saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();

response.reset();
response.setHeader("Content-Disposition", "inline");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Expires", "0");
response.setContentType("image/jpg");
byte[] image = getImage(saveFile);
OutputStream outputStream = response.getOutputStream();
outputStream.write(image);
outputStream.close();

}
%>
<%
try
{
Statement st=conn.createStatement();


// Retrieve Data Via ajax
String name=request.getParameter("name");
String address=request.getParameter("address");
String sex=request.getParameter("sex");
String pass=request.getParameter("pass");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String country=request.getParameter("country");
String userid="";
int status=0;
String Act_id="";
String sql="Insert into tbl_register(`Name`,`Address`,`sex`,`password`,`email`,`userid`,`phone`,`country`,`status`,`Activation_id`) values('"+name+"','"+address+"','"+sex+"','"+pass+"','"+email+"','"+userid+"','"+phone+"','"+country+"',"+status+",'"+Act_id+"')";
st.executeUpdate(sql);  
}
catch(Exception e)
{
	out.println(e);
}

%>