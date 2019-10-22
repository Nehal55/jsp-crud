<%-- 
    Document   : update
    Created on : Oct 19, 2019, 10:12:44 AM
    Author     : youtechBD
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
  if(request.getParameter("submit")!=null){
  
   String id=request.getParameter("id");   
  String name=request.getParameter("sname");
   String course=request.getParameter("course");
   String fee=request.getParameter("fee");
   
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
   
    Class.forName("org.gjt.mm.mysql.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
    
    pst=con.prepareStatement("update records set name=?,course=?,fee=? where id=?");
    pst.setString(1,name);
    pst.setString(2,course);
    pst.setString(3,fee);
     pst.setString(4,id);
    pst.executeUpdate();
    
    
    
  
  
 
%>

<script>
  alert("recorded updated"); 

</script>

<%} %>




















<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
              
    </head>
    <body>
        <h1>Update</h1>
        
      <div class="row"> 
            
            
            
   
             <div class="col-sm-4"> 
        
                 <form  method="POST" action ="#">
                     
                     
                     <% 
                  Connection con;
                 PreparedStatement pst;
                 ResultSet rs;
   
               Class.forName("org.gjt.mm.mysql.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
                     
                   String id=request.getParameter("id"); 
                     pst=con.prepareStatement("select *from records where id=?");
                     pst.setString(1,id);
                     rs=pst.executeQuery();
                      while(rs.next()){
                     
                     %>
              
                     
                     <div alight="left">
                         
                         <label class="form-label">Student Name </label>
                         <input type="text" class="form-control" value="<%=rs.getString("name")%>" name="sname" id="sname">
                         
                     </div>
                     
                     
               
                     <div alight="left">
                         
                         <label class="form-label">Course</label>
                         <input type="text" class="form-control" value="<%=rs.getString("course")%>"   name="course" id="course">
                         
                     </div>
                     
                         
                     <div alight="left">
                         
                         <label class="form-label">Fee</label>
                         <input type="text" class="form-control" value="<%=rs.getString("fee")%>"  name="fee" id="fee">
                         
                     </div>    
                     
                     <% 
                     
                      }
         
                     %>
                     
                     
                     
                     
                     
               
                     <br/>
                     
                     <div alight="right">
                         
                         <input type="submit" id="submit" name="submit" class="btn btn-info"> <br/> <br/>

                          <input type="reset" id="reset" name="reset" class="btn btn-danger">
                         
                     </div>
                     
                     
                     <div align="right"  >      
                     
                         <p><a href="index.jsp">Click Back </p>
                     </div>
                 </form>
                 
                 
              </div>
           
        
         </div>
          
        
        
        
        
        
    </body>
</html>
