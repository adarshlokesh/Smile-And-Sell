<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="login.html" %>
       <%@ page import="java.sql.*" %>
       <%ResultSet rs =null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">

function getBookDetails()
{
	 var str = document.forms["buy"]["book"].value;
	 alert("Hello"+str);
	 var xmlhttp;    
	 if (str=="")
	   {
	   document.getElementById("custdata").innerHTML="";
	   return;
	   }
	 if (window.XMLHttpRequest)
	   {// code for IE7+, Firefox, Chrome, Opera, Safari
	   xmlhttp=new XMLHttpRequest();
	   }
	 else
	   {// code for IE6, IE5
	   xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	   }
	 xmlhttp.onreadystatechange=function()
	   {
	   if (xmlhttp.readyState==4 && xmlhttp.status==200)
	     {
	     document.getElementById("custdata").innerHTML=xmlhttp.responseText;
	     }
	   }
	 xmlhttp.open("GET","bookdetails.jsp?book="+str,true);
	 xmlhttp.send();
}

</script>

<style>
body{
	background-image: url("books.jpg");
	height: 70%;
	background-position: left;
	}
gap{
	margin:10px;
	padding:20px;
	font-size: 40px;
	}
</style>
</head>
<body>
<div id="custdata">
<form name="buy">
<center>
<table>
<tr id="gap"><br><br>
CATEGORY <select name="category"> 
<option value="CS">CS</option>
<option value="EC">EC</option>
<option value="EE">EE</option>
<option value="ME">ME</option>
</select>
</tr>
<input type="submit" value="search" onclick="return validateSearch()"></input>
<%
	String qry = "select * from details where category=?";
	int count = 0;
try
{	
	String cat = request.getParameter("category");
	System.out.println(cat);

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seller","root","admin");
	PreparedStatement stat = con.prepareStatement(qry);
	stat.setString(1, cat);
	rs = stat.executeQuery();
	

%>
<br><br><br>
<tr id="gap">
 BOOK NAME  <select name="book">       
 		<%  
  			while(rs.next()){ count++;%>
        	<option value='<%=rs.getString("bk_name")%>'><%= rs.getString("bk_name")%></option>
        <% } %>
        </select>
</tr>
<%
 if(count == 0){ %>
<br><br>
<div id="note"><b style="color: red; font-size: 25px;">No Results Found</b></div>
<% } %>
<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
<% if(count != 0){ %>
<br><br><br><tr><input type="button" value="Get Details" onclick="getBookDetails()"></input></tr>
<% } %>
</table>
</center>
</form>
</div>
</body>
</html>