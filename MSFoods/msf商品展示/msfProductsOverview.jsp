<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>msfoods</title>
<style>
/* media query */
@media ( min-width : 600px) {
	nav, main {
		width: 50%;
	}
}
@media ( min-width : 800px) {
	header {
		width: 100%;
	}
	nav {
		width: 20%;
	}
	main {
		width: 80%;
	}
	footer {
		width: 100%;
	}
}
* {
	box-sizing: border-box;
}
body {
	background: white;
	max-width: 100%;
	margin: 0 auto;
	display: flex;
	flex-flow: row wrap;
}
nav, main, footer {
	width: 100%;
}
header {
	width: 100%;
	border-bottom: 5px solid #99DE99;
}
.ham{
width: 3%;
margin-bottom: 3%;
margin-left: 2%;
}
.logo{
margin: 1.2%;
width: 10%;
margin-left: 39%;
}
.logomenu{
width: 2.5%;
margin-left: 39%;
margin-bottom: 3%;
}
nav{
/*  display:none;*/
 display:block;
  width: 20%;
}
h1{
text-align:center;
color: #7fb37f;
}
.menu{
display:none;
position: fixed;
top: 55%;
width: 20em;
margin-top: -15em;
}
a{
text-decoration:none;
color: #0c853c;
font-size: 20px;
font-weight: bold;
padding: 1%;
}
footer {
 background-color: #99DE99;
 height: 5%;
}
.logoEnd{
width: 15%;
margin-left: 10%;
padding-top: 3%;
}
.footItems{
float: right;
color: white;
font-size: 20px;
margin-right: 10%;
padding-top: 3%;
}
.footCopyright{
margin-left: 38%;
font-size: 15px;
color: white;
display: block;
padding-bottom: 3%;
}
</style>
</head>
<body>
	<sql:setDataSource var="msfi" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/msfoods" user="root" password="root" />
	<sql:query dataSource="${msfi}" var="result">
         SELECT * from msfoods_items Where sell=1  AND (id != 34 AND id != 35);
      </sql:query>
	<header>
		<img class="ham" src="img\ham0.png">
		<img class="logo" src="img\fontimg.png" onclick="jumpfront()">
		<img class="logomenu" src="img\cart.png">
	</header>
	<nav>
		<div class="menu">
		<table>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfProductsOverview.jsp">????????????</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=2">????????????????????????????????????</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=3">???GI??????</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=4">????????????</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=5">????????????</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=6">????????????</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=7">????????????</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=8">????????????</a></td></tr>
		</table>
		</div>
	</nav>
	<main>
		<h1>????????????</h1>
		<div class="item">		
			<table style="table-layout: fixed; WORD-BREAK: break-all; WORD-WRAP: break-word">
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) < 6}">
						<td style="text-align:center;"><img width="70%" src="<c:url value="${row.file}"/>"/></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) < 6}">
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) < 6}">
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) < 6}">
						<td style="font-weight:bold;text-align:center;">NT$ <c:out value="${row.price}" /></td>
					</c:if>
				</c:forEach>
			</tr>
            <tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">					
				   <c:if test="${(status.index) < 6}">
						 <td style="font-weight:bold;text-align:center;padding:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">??????</button></td>
				   </c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 6 && (status.index) < 12}">
						<td style="text-align:center;"><img width="70%" src="<c:url value="${row.file}"/>"/></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 6 && (status.index) < 12}">
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 6 && (status.index) < 12}">
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 6 && (status.index) < 12}">
						<td style="font-weight:bold;text-align:center;">NT$ <c:out value="${row.price}" /></td>
					</c:if>
				</c:forEach>
			</tr>
            <tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">					
				   <c:if test="${(status.index) >= 6 && (status.index) < 12}">
						 <td style="font-weight:bold;text-align:center;padding:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">??????</button></td>
				   </c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 12 && (status.index) < 18}">
						<td style="text-align:center;"><img width="70%" src="<c:url value="${row.file}"/>"/></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 12 && (status.index) < 18}">
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 12 && (status.index) < 18}">
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 12 && (status.index) < 18}">
						<td style="font-weight:bold;text-align:center;">NT$ <c:out value="${row.price}" /></td>
					</c:if>
				</c:forEach>
			</tr>
            <tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">					
				  <c:if test="${(status.index) >= 12 && (status.index) < 18}">
						 <td style="font-weight:bold;text-align:center;padding:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">??????</button></td>
				   </c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 18 && (status.index) < 24}">
						<td style="text-align:center;"><img width="70%" src="<c:url value="${row.file}"/>"/></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 18 && (status.index) < 24}">
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 18 && (status.index) < 24}">
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 18 && (status.index) < 24}">
						<td style="font-weight:bold;text-align:center;">NT$ <c:out value="${row.price}" /></td>
					</c:if>
				</c:forEach>
			</tr>
           <tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">					
				  <c:if test="${(status.index) >= 18 && (status.index) < 24}">
						 <td style="font-weight:bold;text-align:center;padding:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">??????</button></td>
				   </c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 24 && (status.index) < 30}">
						<td style="text-align:center;"><img width="70%" src="<c:url value="${row.file}"/>"/></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 24 && (status.index) < 30}">
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 24 && (status.index) < 30}">
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 24 && (status.index) < 30}">
						<td style="font-weight:bold;text-align:center;">NT$ <c:out value="${row.price}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">					
				  <c:if test="${(status.index) >= 24 && (status.index) < 30}">
						 <td style="font-weight:bold;text-align:center;padding:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">??????</button></td>
				   </c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 30 && (status.index) < 36}">
						<td style="text-align:center;"><img width="70%" src="<c:url value="${row.file}"/>"/></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 30 && (status.index) < 36}">
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 30 && (status.index) < 36}">
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 30 && (status.index) < 36}">
						<td style="font-weight:bold;text-align:center;">NT$ <c:out value="${row.price}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">					
				  <c:if test="${(status.index) >= 30 && (status.index) < 36}">
						 <td style="font-weight:bold;text-align:center;padding:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">??????</button></td>
				   </c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 36 && (status.index) < 42}">
						<td style="text-align:center;"><img width="70%" src="<c:url value="${row.file}"/>"/></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 36 && (status.index) < 42}">
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 36 && (status.index) < 42}">
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 36 && (status.index) < 42}">
						<td style="font-weight:bold;text-align:center;">NT$ <c:out value="${row.price}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">					
				  <c:if test="${(status.index) >= 36 && (status.index) < 42}">
						 <td style="font-weight:bold;text-align:center;padding:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">??????</button></td>
				   </c:if>
				</c:forEach>
			</tr>
						<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 42 && (status.index) < 48}">
						<td style="text-align:center;"><img width="70%" src="<c:url value="${row.file}"/>"/></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 42 && (status.index) < 48}">
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 42 && (status.index) < 48}">
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(status.index) >= 42 && (status.index) < 48}">
						<td style="font-weight:bold;text-align:center;">NT$ <c:out value="${row.price}" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="row" items="${result.rows}" varStatus="status">					
				  <c:if test="${(status.index) >= 42 && (status.index) < 48}">
						 <td style="font-weight:bold;text-align:center;padding:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">??????</button></td>
				   </c:if>
				</c:forEach>
			</tr>
		</table>
		</div>
	</main>
	<footer>
		<img class="logoEnd" src="img\footimg.png">
		<div class="footItems">
		<b>????????????????????????????????????</b><br>
		Min Sheng Foods Industry Inc.<br>
		?????????????????????????????????519???20???<br>
		Tel:04-8870991#17<br>
	    Fax:04-8887505<br>
		</div>
		<span class="footCopyright">Copyright??2021 All Rights Reserved.</span>
	</footer>

	<script>
      function jumpfront() {
        window.location.href = "msfFront.html";
      }
		$(function() {
			$('.ham').mouseenter(
					function() {
						$('.ham').attr('src',"http://localhost:8080/java/img/ham1.png");
					});
			$('.ham').mouseleave(
					function() {
						$('.ham').attr('src',"http://localhost:8080/java/img/ham0.png");
					});
			$('.ham').on('click', function() {
				$('nav').css('display',"block");
				$('.menu').css('display',"block");
				$('main').css('width',"80%");
			});
		});
	</script>
</body>
</html>