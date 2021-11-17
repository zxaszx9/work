<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
header {
	width: 100%;
	border-bottom: 5px solid #99DE99;
}
.logo{
margin: 1.2%;
width: 10%;
margin-left: 44.5%;
}
.logomenu{
width: 2.5%;
margin-left: 39%;
margin-bottom: 3%;
}
nav{
width: 20%;
}
main{
width: 80%;
}
h1{
text-align:center;
color: #7fb37f;
}
.menu{
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
         SELECT * from msfoods_items Where sell=1;
      </sql:query>
	<header>
		<img class="logo" src="img\fontimg.png" onclick="jumpfront()">
		<img class="logomenu" src="img\cart.png">
	</header>
	<nav>
		<div class="menu">
		<table>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfProductsOverview.jsp">商品總覽</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=2">【懶人箱】蔬菜包＋調理包</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=3">低GI料理</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=4">西式美味</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=5">饕客美味</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=6">零嘴小點</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=7">果昔飲品</a></td></tr>
        <tr><td style="width:1%;padding: 1.5%;"><a href="msfCategory.jsp?c1=8">素食料理</a></td></tr>
		</table>
		</div>
	</nav>
	<main>
<%
String c1=request.getParameter("c1");
%>
			<c:set var="c1" value="<%=c1%>" />

<c:choose>
    <c:when test="${c1 == 2}"><h1>【懶人箱】蔬菜包＋調理包</h1></c:when>
    <c:when test="${c1 == 3}"><h1>低GI料理</h1></c:when>
    <c:when test="${c1 == 4}"><h1>西式美味</h1></c:when>
    <c:when test="${c1 == 5}"><h1>饕客美味</h1></c:when>
    <c:when test="${c1 == 6}"><h1>零嘴小點</h1></c:when>
    <c:when test="${c1 == 7}"><h1>果昔飲品</h1></c:when>
    <c:when test="${c1 == 8}"><h1>素食料理</h1></c:when>
</c:choose>

		<div class="item">
			<%--<%!int i = 6;%>--%>
			
			<table style="table-layout: fixed; WORD-BREAK: break-all; WORD-WRAP: break-word;">
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(row.c1) == c1}">
					<c:if test="${(row.c2) <= 3}">	
						<td style="text-align:center;"><img width="80%" src="<c:url value="${row.file}"/>"/></td>
                    </c:if>					
                    </c:if>				
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) <= 3}">	
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) <= 3}">	
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) <= 3}">		
						<td style="font-weight:bold;text-align:center;padding:1%;">NT$ <c:out value="${row.price}" /></td>
					 </c:if>
					 </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">					
					   <c:if test="${(row.c1) == c1}">
					   <c:if test="${(row.c2) <= 3}">
						 <td style="font-weight:bold;text-align:center;padding-bottom:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">購買</button></td>
					   </c:if>
					   </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(row.c1) == c1}">
					<c:if test="${(row.c2) > 3 && (row.c2) <= 6}">	
						<td style="text-align:center;"><img width="80%" src="<c:url value="${row.file}"/>"/></td>
                    </c:if>					
                    </c:if>				
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 3 && (row.c2) <= 6}">	
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 3 && (row.c2) <= 6}">	
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 3 && (row.c2) <= 6}">		
						<td style="font-weight:bold;text-align:center;padding:1%;">NT$ <c:out value="${row.price}" /></td>
					 </c:if>
					 </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">					
					   <c:if test="${(row.c1) == c1}">
					   <c:if test="${(row.c2) > 3 && (row.c2) <= 6}">
						 <td style="font-weight:bold;text-align:center;padding-bottom:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">購買</button></td>
					   </c:if>
					   </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(row.c1) == c1}">
					<c:if test="${(row.c2) > 6 && (row.c2) <= 9}">	
						<td style="text-align:center;"><img width="80%" src="<c:url value="${row.file}"/>"/></td>
                    </c:if>					
                    </c:if>				
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 6 && (row.c2) <= 9}">		
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 6 && (row.c2) <= 9}">	
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 6 && (row.c2) <= 9}">		
						<td style="font-weight:bold;text-align:center;padding:1%;">NT$ <c:out value="${row.price}" /></td>
					 </c:if>
					 </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">					
					   <c:if test="${(row.c1) == c1}">
					   <c:if test="${(row.c2) > 6 && (row.c2) <= 9}">
						 <td style="font-weight:bold;text-align:center;padding-bottom:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">購買</button></td>
					   </c:if>
					   </c:if>
					</c:forEach>
				</tr>
				
				
				
								<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(row.c1) == c1}">
					<c:if test="${(row.c2) > 9 && (row.c2) <= 12}">	
						<td style="text-align:center;"><img width="80%" src="<c:url value="${row.file}"/>"/></td>
                    </c:if>					
                    </c:if>				
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 9 && (row.c2) <= 12}">		
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 9 && (row.c2) <= 12}">	
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 9 && (row.c2) <= 12}">		
						<td style="font-weight:bold;text-align:center;padding:1%;">NT$ <c:out value="${row.price}" /></td>
					 </c:if>
					 </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">					
					   <c:if test="${(row.c1) == c1}">
					   <c:if test="${(row.c2) > 9 && (row.c2) <= 12}">	
						 <td style="font-weight:bold;text-align:center;padding-bottom:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">購買</button></td>
					   </c:if>
					   </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(row.c1) == c1}">
					<c:if test="${(row.c2) > 12 && (row.c2) <= 15}">	
						<td style="text-align:center;"><img width="80%" src="<c:url value="${row.file}"/>"/></td>
                    </c:if>					
                    </c:if>				
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 12 && (row.c2) <= 15}">			
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 12 && (row.c2) <= 15}">		
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 12 && (row.c2) <= 15}">			
						<td style="font-weight:bold;text-align:center;padding:1%;">NT$ <c:out value="${row.price}" /></td>
					 </c:if>
					 </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">					
					   <c:if test="${(row.c1) == c1}">
					   <c:if test="${(row.c2) > 12 && (row.c2) <= 15}">	
						 <td style="font-weight:bold;text-align:center;padding-bottom:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">購買</button></td>
					   </c:if>
					   </c:if>
					</c:forEach>
				</tr>
								<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					<c:if test="${(row.c1) == c1}">
					<c:if test="${(row.c2) > 15 && (row.c2) <= 18}">	
						<td style="text-align:center;"><img width="80%" src="<c:url value="${row.file}"/>"/></td>
                    </c:if>					
                    </c:if>				
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 15 && (row.c2) <= 18}">		
						<td style="width:1%;font-weight:bold;text-align:center;"><a href="msfDetails.jsp?id=${row.id}"><c:out value="${row.name}" /></a></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
					  <c:if test="${(row.c2) > 15 && (row.c2) <= 18}">
						<td style="text-align:center;"><c:out value="${row.intro}" /></td>
					  </c:if>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.c1) == c1}">	
				 	  <c:if test="${(row.c2) > 15 && (row.c2) <= 18}">	
						<td style="font-weight:bold;text-align:center;padding:1%;">NT$ <c:out value="${row.price}" /></td>
					 </c:if>
					 </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">					
					   <c:if test="${(row.c1) == c1}">
					   <c:if test="${(row.c2) > 15 && (row.c2) <= 18}">
						 <td style="font-weight:bold;text-align:center;padding-bottom:1%;"><button style="height:30px;width:30%;font-size: 15px;border-color: #99DE99;background-color: #99DE56; border-radius: 30px;">購買</button></td>
					   </c:if>
					   </c:if>
					</c:forEach>
				</tr>
				
			</table>
		</div>
	</main>
	<footer>
		<img class="logoEnd" src="img\footimg.png">
		<div class="footItems">
		<b>民生食品工業股份有限公司</b><br>
		Min Sheng Foods Industry Inc.<br>
		彰化縣北斗鎮中山路二段519巷20號<br>
		Tel:04-8870991#17<br>
	    Fax:04-8887505<br>
		</div>
		<span class="footCopyright">Copyright©2021 All Rights Reserved.</span>
	</footer>

	<script>
    function jumpfront() {
        window.location.href = "msfFront.html";
      }
	</script>
</body>
</html>