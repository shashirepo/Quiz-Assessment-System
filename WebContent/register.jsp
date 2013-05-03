<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Welcome to Our Quiz Assesment System</title>
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
<link rel="stylesheet" href="css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Engagement' rel='stylesheet' type='text/css'>
<!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="http://malsup.github.com/jquery.blockUI.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.uniform.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
      $(function(){
        $("input:checkbox, input:radio, input:file, select").uniform();
      });
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
	
	
	
	function doRegister() {		
		
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
						
						
            				 
				
					    $.unblockUI();
						
                                 
					    window.location.href ="index.jsp";	   
					    
					    $.growlUI('', 'Succesfully Registered!'); 
    
  			} else {
						alert("There was a problem while using XMLHTTP:\n" + req.statusText);
					}
				}				
			}			
			var name=$('#name').val(); 
			
		    var address=$('#message').val(); 
		    var sex=$('#sex').val(); 
		    var password=$('#pass').val(); 
		    var email=$('#email').val(); 
		    var phone=$('#mobile').val(); 
		    var country=$('#country').val(); 
			req.open("POST", "getRegister.jsp?name="+name+"&address="+address+"&sex="+sex+"&pass="+password+"&email="+email+"&phone="+phone+"&country="+country, true);
			req.send(null);
			
			
		}
		 			
	}
</script>



    
    
    
</head>
<body>
<article>
<h1>Quiz System</h1>
<div id=loading><img src=load.gif></div>
	<ul>
        <li>
        	<label for="name">Your Name:</label>
            <input type="text" size="40" id="name" name="name" />
        </li>
		<li>
        	<label for="password">Password</label>
            <input type="password" size="40" id="pass" name="pass" />
        </li>
		<li>
        	<label for="rpass">Repeat Password</label>
            <input type="password" size="40" id="rpass" name="rpass" />
        </li>
        <li>
        	<label for="email">Your Email:</label>
            <input type="email" size="40" id="email" name="email" />
        </li>
		<li>
        	<label for="mobile">Your Mobile:</label>
            <input type="text" size="40" id="mobile" name="mobile" />
        </li>
        <li>
            <label for="country">Country</label>
            <select id="country">
                <option>Volvo</option>
                <option>Saab</option>
                <option>Mercedes</option>
                <option>Audi</option>
                <option>Other&hellip;</option>
            </select>
        </li>
        <li>
           <input type="radio" name="sex" id="sex" /> <label>Male</label>
           <input type="radio" name="sex" id="sex" /> <label>Female</label>
        </li>
       
        <li>
            <label>Upload a file:(Your Avatar)</label>
            <input type="file"  name="pic" id="pic"/>
        </li>
        <li>
        	<label for="message">Address:</label>
            <textarea cols="50" rows="5" id="message"></textarea>
		</li>
		 <li>
			<label><input type="checkbox" id="term" />I agree to Term and Conditions</label>
        </li>
	</ul>
    <p>
        <button class="action" onClick="doRegister()">Register</button>
        <button type="reset" class="right">Reset</button>
    </p>

</article>
</body>
</html>