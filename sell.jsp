<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@  include file="welcome.jsp"  %>    
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
	font-size: 30px;
	padding-top: 40px;
	margin-left: 80px;
	float: left;
}
</style>
<script type="text/javascript">
function validateDetails(){
	document.getElementById("bookerror").innerHTML="";
	document.getElementById("costerror").innerHTML="";
	document.getElementById("editionerror").innerHTML="";
	var bookname = document.forms["sell"]["book"].value;
	var cost = document.forms["sell"]["cost"].value;
	var edition = document.forms["sell"]["edition"].value;
	if(bookname==null || bookname==""){		
		document.getElementById("bookerror").innerHTML="Book Name Required";
		
		return false;
	}
	if(cost==null || cost=="" || cost<0){
		document.getElementById("costerror").innerHTML="Cost Required";
		return false;
	}
	if(edition==null || edition==""){
		document.getElementById("editionerror").innerHTML="Edition Required";
		return false;
	}
}
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";}

//function preventBack(){window.history.forward();}
//setTimeout("preventBack()", 0);
//window.onunload=function(){null};
</script>
</head>
<body>
<form name="sell" action="ValidateUser" method="post">
<input type="hidden" name="fromwhere" value="sell"><br><br>
<div id="section">Book Name  <input type="text" name="book" style="font-size: 20px;"></input>
<div id="bookerror" style="color: red"></div>
<br>
Category  <select name="category" style="font-size: 20px;"> 
<option value="CS">CS</option>
<option value="EC">EC</option>
<option value="EE">EE</option>
<option value="ME">ME</option>
</select>
<br><br>
Cost  <input type="text" name="cost" style="font-size: 20px;"></input>
<div id="costerror" style="color: red"></div>
<br>
Edition  <input type="text" name="edition" style="font-size: 20px;"></input>
<div id="editionerror" style="color: red"></div>
<br>
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
<br>
<input type="submit" value="Submit" style="font-size:20px; width:150px; height:30px;" onclick="return validateDetails()"></input><br><br>
</div>
</form>
</body>
</html>