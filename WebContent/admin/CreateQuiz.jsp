<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <!--Jquery UI CSS-->
    <link href="css/fancy-button/fancy-button.css" rel="stylesheet" type="text/css" />
    <!--Jquery UI CSS-->
    <link href="css/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <!--jQuery Date Picker-->
    <script src="js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.datepicker.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.progressbar.min.js" type="text/javascript"></script>
    <!-- jQuery dialog related-->
    <script src="js/jquery-ui/external/jquery.bgiframe-2.1.2.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.draggable.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.position.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.resizable.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.dialog.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.blind.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.explode.min.js" type="text/javascript"></script>
    <!-- jQuery dialog end here-->
    <script src="js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <!--Fancy Button-->
    <script src="js/fancy-button/fancy-button.js" type="text/javascript"></script>
 
    <!-- Load TinyMCE -->
    <script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
        	 setupLeftMenu();
 			setSidebarHeight();
            setupTinyMCE();
            setupProgressbar('progress-bar');
            setDatePicker('date-picker');
            setupDialogBox('dialog', 'opener');
            $('input[type="checkbox"]').fancybutton();
            $('input[type="radio"]').fancybutton();
        });
    </script>
    <!-- /TinyMCE -->
    
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create A Quiz</title>
</head>
<body>
 <div class="grid_10">
            <div class="box round first">
                <h2>Create A Quiz</h2>
                
                <div class="block">
             <div class="block ">
                    <form>
                    <table class="form">
                       
                        <tr>
                            <td>
                                <label>
                                Quiz Name</label>
                            </td>
                            <td>
                                <input type="text" class="quiz_name" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Select Course Type</label>
                            </td>
                            <td>
                                <select id="select" name="course_type">
                                    <option value="0"><--Select Course Type--></option>
                                    <option value="1">java</option>
                                    <option value="2">Lniux</option>
                                    <option value="3">C++</option>
                                </select>
                            </td>
                        </tr>
                         <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>
                                    IntroDuction About Quiz</label>
                            </td>
                            <td>
                                <textarea class="tinymce"></textarea>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <label>
                                    Grade Method</label>
                            </td>
                            <td>
                                <input type="radio" name="marks" />
                                Marks
                                <input type="radio" name="grade" />
                                Grade
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                                <label>
                                    Dialog Box</label>
                            </td>
                            <td>
                                <div id="dialog" title="Basic dialog">
                                    <p>
                                        This is an animated dialog which is useful for displaying information. The dialog
                                        window can be moved, resized and closed with the 'x' icon.</p>
                                </div>
                                <button id="opener">
                                    Open Dialog</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Start Date</label>
                            </td>
                            <td>
                                <input type="text" id="date-picker" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    End Date</label>
                            </td>
                            <td>
                                <input type="text" id="date-picker" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Attempts Allowed</label>
                            </td>
                            <td>
                                <select id="select" name="course_type">
                                    <option value="0"><--Select Attempts--></option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="many">Unlimited</option>
                                </select>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <label>
                                    Shuffle Questions</label>
                            </td>
                            <td>
                                <input type="checkbox"  name="isShuffle" value=1/>Yes
                               
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Import CSV/text</label>
                            </td>
                            <td>
                                <input type="file" />
                            </td>
                        </tr>
                      
                        <tr>
                        <td>	<button class="btn btn-large">Add Quiz</button>
                        </td></tr>
                    </table>
                    
                    </form>
                </div>
</body>
</html>