<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="javax.sql.*"%>


<%
  
  
   String id=request.getParameter("id");
   
   
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
   
    Class.forName("org.gjt.mm.mysql.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
    
    pst=con.prepareStatement("delete from  records where id=?");
    
    pst.setString(1,id);
    pst.executeUpdate();
    
    
    
  
 
%>

<script>
  alert("recorded deleted"); 

</script>
