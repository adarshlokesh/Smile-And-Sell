<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="welcome.jsp" %>
       <%@ page import="java.sql.*" %>
       <%ResultSet rs =null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
var xmlhttp;
function getBookDetails()
{	var str1 = document.forms["buy"]["category"].value;
	alert(str1);
	 var str = document.forms["buy"]["book"].value;
	 alert(str);
	 if(str1==-1 || str==-1){
		 alert("Choose an option!!!");
		 return false;
	 }    
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
function findBlock(str){
	
	if (typeof XMLHttpRequest != "undefined"){
	xmlHttp= new XMLHttpRequest();
	}
	else if (window.ActiveXObject){
	xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp==null){
	alert("Browser does not support XMLHTTP Request");
	return;
	} 
	
	var url="buydemo.jsp";
	url +="?count=" +str;
	xmlHttp.onreadystatechange = stateChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
	
	}



	function stateChange(){   
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
	document.getElementById("block_id").innerHTML=xmlHttp.responseText; 
	}   
	}
	window.location.hash="no-back-button";
	window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
	window.onhashchange=function(){window.location.hash="no-back-button";}

	//function preventBack(){window.history.forward();}
    //setTimeout("preventBack()", 0);
	//window.onunload=function(){null};
</script>

<style>
body{
	background-image: url("BOOK.jpg");
	height: 70%;
	background-position: left;
	}
gap{
	margin:10px;
	padding:20px;
	font-size: 40px;
	}
#custdata{
	font-size: 25px;
}
</style>
</head>
<body>
<div id="custdata">
<form name="buy">
<center>
<table>
<tr id="gap"><br><br>
CATEGORY <select style="font-size: 20px;" name="category"  onchange="findBlock(this.value)"> 
<option value="-1">Select</option> 
<option value="CS">CS</option>
<option value="EC">EC</option>
<option value="EE">EE</option>
<option value="ME">ME</option>
</select>
</tr>

<br><br><br>
<tr id="gap">
 <td>BOOK NAME </td><td><div id="block_id"> 
<select name="book" style="font-size: 20px;" >  
      <option value="-1">Select</option>  
      </select>
</div></td>
<td><input type="button" style="font-size: 20px;" value="Get Details" onclick="return getBookDetails()"></input></td>
</tr>
<div id="error" style="color: red"></div>
</table>
</center>
</form>
</div>
</body>
</html>