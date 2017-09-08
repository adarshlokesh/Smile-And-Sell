<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body{
	background-image: url("BOOK.jpg");
	}
</style>
<script type="text/javascript">
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";}

</script>
</head>
<body>
<center>
<br><br>
<table border="1">
<tr>
<th>Name</th>
<th>Book Name</th>
<th>Cost</th>
<th>Edition</th>
<th>Mobile No</th>
</tr>
<%
String qry = "select * from details where bk_name=?";
String eqry = "select * from user where usn=?";
try
{   
	String c_id =request.getParameter("book");
	System.out.println("Book:"+c_id);
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seller","root","admin");
	PreparedStatement stat = con.prepareStatement(qry);
	PreparedStatement stat1 = con.prepareStatement(eqry);
	stat.setString(1, c_id);
	ResultSet rs = stat.executeQuery();
	
	while(rs.next()){
		int usn=rs.getInt("usn");
		stat1.setInt(1,usn);
		ResultSet rs1 = stat1.executeQuery();
		rs1.next();
%>
<tr>

<td><%=rs1.getString("name") %></td>
<td><%=rs.getString("bk_name") %></td>
<td><%=rs.getInt("cost") %></td>
<td><%=rs.getInt("edition") %></td>
<td><%=rs1.getLong("phone") %></td>
</tr>
<%
	}
}
catch(NumberFormatException e){
	System.out.println("Exception is "+e);
}
%>
</table>


</center>
</body>
</html>