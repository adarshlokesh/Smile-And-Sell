<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="welcome.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	background-image: url("BOOK.jpg");
	height: 70%;
	background-position: left;
	
	}
#section{
	font-size: 30px;
	margin-left: 80px;
	float: left;
}
#gap{
	height:30px;
}
</style>
<script>
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";}

//  function preventBack(){window.history.forward();}
//  setTimeout("preventBack()", 0);
//  window.onunload=function(){null};
</script>

</head>
<body>
<form action="ValidateUser" method="post">
<input type="hidden" name="fromwhere" value="mobile">
<div id="section">
<table>
<br><br>
<tr id="gap">New Mobile No  <input type="text" name="mobile" style="font-size: 20px;"></input></tr><br><br>

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
<tr id="gap"><input type="submit" value="Submit" style="font-size:20px; width:150px; height:30px;"></input></tr><br><br>
</table>
</div>
</form>
</body>
</html>