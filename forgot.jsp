<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="login.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	background-image: url("BOOK.jpg");
	height: 70%;
	
	}
#section{
	font-size: 30px;
	padding:40px;
	margin-left: 30px;
}
</style>
<script type="text/javascript">
function validateLogin(){
	document.getElementById("usererror").innerHTML="";
	document.getElementById("passworderror").innerHTML="";
	document.getElementById("mobileerror").innerHTML="";
	var username = document.forms["forgot"]["USN"].value;
	var password = document.forms["forgot"]["password"].value;
	var mobile = document.forms["forgot"]["mobile"].value;
	if(username==null || username==""){		
		document.getElementById("usererror").innerHTML="Username Required";
		
		return false;
	}
	if(mobile==null || mobile==""){		
		document.getElementById("mobileerror").innerHTML="Mobile No Required";
		
		return false;
	}
	
	if(password==null || password==""){
		document.getElementById("passworderror").innerHTML="Password Required";
		return false;
	}
	
}
</script>
</head>
<body>
<form name="forgot" action="ValidateUser" method="post">
<input type="hidden" name="fromwhere" value="forgot">
<div id="section">
<table>
<tr>SRN  <input type="text" name="USN" style="font-size: 20px;"></input></tr>
<div id="usererror" style="color: red"></div><br>
<tr>Mobile No  <input type="text" name="mobile" style="font-size: 20px;"></input></tr>
<div id="mobileerror" style="color: red"></div><br>
<tr>New Password  <input type="password" name="password" style="font-size: 20px;"></input></tr>
<div id="passworderror" style="color: red"></div><br>
<div id = "errordiv" align="left">
<%
if(request.getAttribute("message") != null){ 
%>

<font color="red">
<%=request.getAttribute("message") %>
</font>	
<%	
}
%>
</div>
<tr><input type="submit" value="Submit"style="font-size:20px; width:150px; height:30px;" onclick="return validateLogin()"></input></tr><br><br>
</table>
</div>
</form>
</body>
</html>