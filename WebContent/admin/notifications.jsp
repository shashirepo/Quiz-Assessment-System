<%@ include file="header.jsp"  %>
    

        <div class="grid_10">
            <div class="box round first">
                <h2>Notifications</h2>
                
                <div class="block">
            <form action="import.jsp" method=POST>
                            <div class="message info">
                                <h5>Import Your Questions</h5>
                                <p>
                                  Import the CSV/Text File to Import Question to Database 
                                </p>
                            </div>
                             <table class="form">
                        
                            
                        <tr>
                            <td>
                                <label>
                                    Select the Import type</label>
                            </td>
                            <td>
                                <input type="radio" name="import" value=0 />
                                Text
                                <input type="radio" name="import" value=1 />
                               CSV                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Select the Type of Label(Course)</label>
                            </td>
                            <td>
                                <select id="select" name="banktype">
                                    <option value="1">Java</option>
                                    <option value="2">C++</option>
                                    <option value="3">C lanauage</option>
                                     <option value="3">Linux</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Attach File</label>
                            </td>
                            <td>
                                <input type="file" name="file" />
                            </td>
                        </tr>
                        <tr>
                        <td>	<input type=submit class="btn btn-large" value=Import></td>
                        </tr>
                        </table></form>
                            <div class="message success">
                                <h5>Success!</h5>
                                <p>
                                    This is a success message.
                                </p>
                            </div>
                            <div class="message warning">
                                <h5>Warning!</h5>
                                <p>
                                    This is a warning message.
                                </p>
                            </div>
                            <div class="message error">
                                <h5>Error!</h5>
                                <p>
                                    This is an error message.
                                </p>
                            </div>
                        </div>
                
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <div id="site_info">
        <p>
            Copyright <a href="#">BlueWhale Admin</a>. All Rights Reserved.
        </p>
    </div>
    
</body>
</html>
