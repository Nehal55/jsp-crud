
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="javax.sql.*" %>


<%
  if(request.getParameter("submit")!=null){
  
  String name=request.getParameter("sname");
   String course=request.getParameter("course");
   String fee=request.getParameter("fee");
   
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
   
    Class.forName("org.gjt.mm.mysql.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
    
    pst=con.prepareStatement("insert into records(name,mobile,course)values(?,?,?)");
    pst.setString(1,name);
    pst.setString(2,course);
    pst.setString(3,fee);
    pst.executeUpdate();
    
    
    
  
 
%>

<script>
  alert("recorded sucessfully"); 

</script>

<%
} 
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <h1>Student Registration System Crud using- JSP</h1>
        </br> </br>

  <div class="row"> 
            
            
            
  
             <div class="col-sm-4"> 
        
                 <form  method="POST" action ="#">
                     
                     <div alight="left">
                         
                         <label class="form-label">Student Name </label>
                         <input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname">
                         
                     </div>
                     
                     
                      <div alight="left">
                         
                         <label class="form-label">Course</label>
                         <input type="text" class="form-control" placeholder="Course" name="course" id="course">
                         
                     </div>
                   
                     
                     <div alight="left">
                         
                         <label class="form-label">Fee</label>
                         <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee">
                         
                     </div>
                     
               
                     <br/>
                     
                     <div alight="right">
                         
                         <input type="submit" id="submit" name="submit" class="btn btn-info"> <br/> <br/>

                          <input type="reset" id="reset" name="reset" class="btn btn-danger">
                         
                     </div>
                     
                 </form>
                 
                 
              </div>
        
        
        
        
        
        
  
              <div class="col-sm-8"> 
                  <div class="panel-body">
                      
                      <table id="tb1-student" class="table table-responsive table-border" cellpadding="0" width="100%" >
                          
                          <thread>
                              <tr>
                                  <th>Student Name </th>
                                  <th>Course </th>
                                  <th>Fee</th>
                                  <th>Edit </th>
                                  <th>Delete </th>
                                  
                                  
                              </tr>
                              <%
                               Connection con;
                               PreparedStatement pst;
                               ResultSet rs;
   
                              Class.forName("org.gjt.mm.mysql.Driver");
                              con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
                               String query =" select * from records";
                               Statement st= con.createStatement();
                               rs=st.executeQuery(query);
                              
                              while(rs.next()){
                              
                              String id=rs.getString("id");
                              
                              
                              
                              
                              %>
                              
                
                              <tr>
                                  
                                  <td><%=rs.getString("name")%></td>
                                   <td><%=rs.getString("course")%></td>
                                   <td><%=rs.getString("fee")%></td>
                                   <td><a href="update.jsp?id=<%=id%>" >  Edit</a></td>
                                    <td><a href="delete.jsp?id=<%=id%>"> Delete</a></td>
                                       
                              </tr>  
                              
                              
                              <%
                              }
                              %>
                          </thread>
                             
                          
                      </table>
                      
                      
                  </div>
        
        
              </div>
        
            
   </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    </body>
</html>

