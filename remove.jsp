<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@  include file="welcome.jsp"  %>   
       <%@ page import="java.sql.*" %>
        <%ResultSet rs =null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body{
	background-image: url("BOOK.jpg");
	height: 70%;
	}
	#section{
	margin-top: 30px;
	font-size:25px;
	}
</style>
<script>
function validate(){
	 var checkboxs=document.getElementsByName("book");
	    var okay=false;
	    for(var i=0,l=checkboxs.length;i<l;i++)
	    {
	        if(checkboxs[i].checked)
	        {
	            okay=true;
	            break;
	        }
	    }
	    if(okay){
	    	alert("Your request will be updated");
	    	return true;
	    }
	    else{
	    	alert("Please check a checkbox");
	    	return false;
	    }
	
	}
	window.location.hash="no-back-button";
	window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
	window.onhashchange=function(){window.location.hash="no-back-button";}

  //function preventBack(){window.history.forward();}
  //setTimeout("preventBack()",0);
  //window.onunload=function(){null};
</script>
</head>
<body>
<form name="remove" id="check" action="ValidateUser" method="post">
<input type="hidden" name="fromwhere" value="remove">
<center>
<table id="section" border="1">
<tr>
			<th>Category</th>
			<th>Book Name</th>
			<th>Cost</th>
			<th>Edition</th>
			<th>Select</th>
		
</tr>
		
<%
Integer usn=(Integer)session.getAttribute("user");

String qry = "select * from details where usn="+usn;
int count = 0;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seller","root","admin");
	PreparedStatement stat = con.prepareStatement(qry);
	//stat.setInt(1, usn);
	rs = stat.executeQuery();
	
	while(rs.next()){
			count++;
%>



<tr>
			<td><%= rs.getString("category")%></td>
			<td><%= rs.getString("bk_name")%></td>
			<td><%= rs.getInt("cost")%></td>
			<td><%= rs.getInt("edition")%></td>
			<td><input type="checkbox" id="remember" name="book" value="<%= rs.getString("bk_name")%>"></td>
		
</tr>
        <% } %>

<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
</table>
<% if(count == 0){ %>
<br>
<b style="color: red; font-size: 30px;">No books to remove</b>
<% } %>

<br><br>
<% if(count != 0){ %>
<input type="submit" value="Remove" style="font-size:20px; width:150px; height:30px;" onclick="return validate()"></input>
<% } %>
</center>
</form>
</body>
</html>