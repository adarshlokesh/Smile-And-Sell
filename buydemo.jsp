<%@page import="java.sql.*"%>
<%
String category=request.getParameter("count");  
System.out.println("Category:"+category);
 String buffer="<select style='font-size: 20px;'name='book' ><option value='-1'>Select</option>";  
 try{
	 String qry = "select * from details where category=?";
 Class.forName("com.mysql.jdbc.Driver");  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seller","root","admin");  
 PreparedStatement stat = con.prepareStatement(qry);
	stat.setString(1, category);
 ResultSet rs = stat.executeQuery();  
 	
   while(rs.next()){
	   if(!buffer.contains(rs.getString(3))){
   buffer=buffer+"<option value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>";  
   System.out.println(rs.getString(3));
   		}  
   }
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>