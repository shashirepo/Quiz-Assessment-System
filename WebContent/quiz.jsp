<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" %>
<title>Welcome to Our Quiz Assesment System</title>
<link rel="stylesheet" href="css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Engagement' rel='stylesheet' type='text/css'>
<!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
     <script src="js/jquery.cookie.js"></script>  
	<script src="http://malsup.github.com/jquery.blockUI.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.uniform.min.js" type="text/javascript" charset="utf-8"></script>
     
    <script type=text/javascript>
    function getRadioValue() {
    var group = document.getElementsByName("option");

    for (var i=0;i<group.length;i++) {
        if (group[i].checked) {
            return group[i].value;
        }
    }

    return '';
    }
    </script>
    
	<style>
#loading
{
    
    z-index: 999;
    position: absolute;
    left: 500px;
    top: 300px;
    
    display:none;

}

</style>
<script type=text/javascript>
  
	
window.onload = function(){
	  timer_is_on=0;
    // 200 seconds countdown
    var countdown =3600; 
    //current timestamp
    
    
    var now   = Date.parse(new Date());

    //ready should be stored in your cookie
    if (!document.cookie)
    {
        document.cookie = Date.parse(new Date (now + countdown  * 1000)); // * 1000 to get ms  
    }

    //every 1000 ms
    setInterval(function()
    {
        var diff = ( document.cookie - Date.parse(new Date()) );

        if ( diff > 0 )
        { 
		
		          var hours=Math.floor(diff/(1000*60*60))%60;
				  var minutes=Math.floor(diff/(1000*60))%60;
				  var seconds=Math.floor(diff/(1000))%60;
		
		
            var message = check(hours)+":"+check(minutes)+":"+check(seconds);
        }
        else
        {
            var message = "finished";
			//window.location.href="index.html";
        }

        document.getElementById('txt').innerHTML = message;

    },1000);
}

function check(i)
{
if(i<10)
return "0"+i;
else
return i;
}
function stopCount()
{
clearTimeout(t);
timer_is_on=0;
}
  </script>


<script>
function getXMLHTTP() { //fuction to return the xml http object
		var xmlhttp=false;	
		try{
			xmlhttp=new XMLHttpRequest();
		}
		catch(e)	{		
			try{			
				xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch(e){
				try{
				xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
				}
				catch(e1){
					xmlhttp=false;
				}
			}
		}
		 	
		return xmlhttp;
	}
	
	
	
	function nextQuestion(strURL) {		
		
		var req = getXMLHTTP();
		
	
	 
	  $.blockUI({ 
            message: $('#loading'), 
            css: { 
                top:  ($(window).height() - 700) /2 + 'px', 
                left: ($(window).width() - 1200) /2 + 'px', 
               
            } 
        }); 
		if (req) {
			
			req.onreadystatechange = function() {
				if (req.readyState == 4) {
					// only if "OK"   
					if (req.status == 200) {		
            				 
						var flag=$.cookie(strURL);
						if(flag)
							{
							alert("previous result"+flag);
							$(":radio[value="+flag+"]").attr('checked',true); 
							}
						else
							{
							$('input[name=option]').attr('checked',false);
							 document.getElementById(strURL).style.backgroundColor="red";
							   document.getElementById(strURL).style.border="solid #0000FF 1px;";
							
							}
						
						document.getElementById('question').innerHTML=req.responseText;
					
						
						   $.cookie('qno',strURL);
                                  $.unblockUI();
                          
       $.growlUI('', 'Navigation Succesfull!'); 
  			} else {
						alert("There was a problem while using XMLHTTP:\n" + req.statusText);
					}
				}				
			}			
			req.open("GET", "GetQuestion.jsp?qno="+strURL, true);
			req.send(null);

			
		}
				
	}
	
	

	function save() {		
		
		var req = getXMLHTTP();
		
	   var qno=$.cookie('qno');
	 
	  $.blockUI({ 
            message: $('#loading'), 
            css: { 
                top:  ($(window).height() - 700) /2 + 'px', 
                left: ($(window).width() - 1200) /2 + 'px', 
               
            } 
        }); 
		if (req) {
			
			req.onreadystatechange = function() {
				if (req.readyState == 4) {
					// only if "OK"   
					if (req.status == 200) {		
            				 
						
						 document.getElementById(qno).style.backgroundColor="green";
					   document.getElementById(qno).style.border="solid #0000FF 1px";
					         $.cookie(qno,getRadioValue());
                                  $.unblockUI();
                          
                             $.growUI('', 'Saved Succesfully!'); 
  			} else {
  				         
						alert("There was a problem while using XMLHTTP:\n" + req.status+" "+req.statustext);
					}
				}				
			}
			
			req.open("GET", "answers.jsp?qno="+qno+"&ans="+getRadioValue(), true);
			req.send(null);

			
		}
	}				
	
</script>





    
        <title>getTutorials.in lots of Quizes</title>
       
        <link href="styles.css" rel="stylesheet" type="text/css" />
    </head>
    <body>	
        <!-- header begins -->
        
        <div id="header_bg">
            <div id="header">
                <div id="logo"><a href="#">Quiz Assement System</a>
                  <h2><a href="http://www.gettutorials.in" id="getTutorials.in"></a></h2>
              </div>

                <div id="buttons">
                    <ul>
                        <li><a href="#" title="" class="active">GET Back</a></li>
                        <li><a href="#" title="">Linux Quiz</a></li>
                        <li><a href="#" title="">Java Quiz</a></li>
                        <li><a href="#" title="">Php Quiz</a></li>
                        <li><a href="#" title="">C++ Quiz</a></li>
                    </ul>
                </div>
            </div>
     
        <!-- header ends -->
        <!-- content begins -->
		 <div style='-moz-user-select: none;-webkit-user-select: none;' onselectstart='return false;'>   
		<div id="loading"><img src='load.gif'></div><div class=logout><a href="logout.jsp">LOgout</a></div>
        <div class="main">
       <table style=float:right>
<tr> 
<% 
Integer[] arr = new Integer[30];
for(int i=0;i<30;i++)
arr[i]=i;
Collections.shuffle(Arrays.asList(arr));
for(int i=0;i<30;i++)
{
	if(i%3==0)
out.print("</tr><br><tr>");
%>
<td align="center"><div id=<%=arr[i] %> style="width:50px;height:40px;background-color:white; border:solid #FF0000 1px;" onClick="nextQuestion(this.id)" title="Click to go on this Question"><b><%= i+1 %> </b></div></td>





<%
}
%>
</tr> </table> 
        
        
       
       
       </div>
         
				
				<div id="txt"></div>
             
                    <h1>Java Quiz</h1>
                
					
                        <table width="950" height="243" border="1" style="border:dashed">
 <tr>
    <td colspan="4"><h3><b id=qno>
1. </b>&nbsp; &nbsp;  <b id="question">
What is the name of the method used to start a thread execution?</b><span></span></h3></td>
  </tr>
  <tr>
    <td width="7%" height="51"><input type="radio" name="option" id="myCanvas1" value="A" /></td><td width="46%" align="left"><h4>A.	init();</h4></td>
    <td width="3%"><input type="radio" name="option" value="B" /></td><td width="44%" align="left"><h4>B.	start();</h4></td>
  </tr>
  <tr>
    <td height="70"><input type="radio" name="option" value="C" /></td><td align="left"><h4>C.	run();</h4></td>
    <td><input type="radio" name="option" value="D" /></td><td align="left"><h4>	D.	resume();</h4></td>
  </tr>
  <tr><td colspan="2">
        <button type="submit" class="action" onClick="save()">Save</button></td>
        <td colspan="2"><button type="reset" class="right">Reset</button></td>
    </tr>
</table>
               </div>    
					
					
            <!-- content ends -->
            <!-- footer begins -->
            <div id="footer">
                 <p>Copyright  2010. <a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a> | <a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional"><abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a> | <a href="http://jigsaw.w3.org/css-validator/check/referer" title="This page validates as CSS"><abbr title="Cascading Style Sheets">CSS</abbr></a></p> 
	<p>Design by <a href="http://www.metamorphozis.com/" title="Flash Templates">Shashikant Vasihnav</a> for <a href="" title="Quiz Assement System">Quiz Assesment System</a></p>
	</div>
            <!-- footer ends -->
     
    </body>
</html>
