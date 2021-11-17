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
position: relative;
height: 900px;
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
.itemdetimg{
margin-top: 10px;
}
.item table{
position: absolute;
width:600px;
table-layout: fixed;
WORD-BREAK: break-all;
WORD-WRAP: break-word;
margin-left: 450px;
top: 30px;
left: 10px;
}
.showbox {
width: 430px;
height: 430px;
vertical-align: middle;
margin-top: 30px;
}
.showimg{
width: 100%;
height: 100%;
object-fit: scale-down;
transform:scale(1,1);
transition: all 1s ease-out;
}
.showimg:active{
transform:scale(1.6,1.6);
}
.changeimg{
margin-top: 10px;
width: 50%;
}
.changeimg a {
margin-right: 10px;
}
.changeimg a img {
width: 10%;
vertical-align: middle;
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
String id=request.getParameter("id");
%>
			<c:set var="c1" value="<%=c1%>" />
			<c:set var="id" value="<%=id%>" />
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
	   <div class="itemdetimg">
		<c:forEach var="row" items="${result.rows}" varStatus="status">
		<c:if test="${(row.id) == id}">		
	     <div class="showbox"><img class="showimg" src="<c:url value="${row.file}"/>"/></div>
	     <div class="changeimg">
	       <c:if test="${not empty row.file}">
		   <a href="<c:url value="${row.file}"/>"><img width="30%" src="<c:url value="${row.file}"/>"/></a>
		  </c:if>
	      <c:if test="${not empty row.img1}">
		   <a href="<c:url value="${row.img1}"/>"><img width="30%" src="<c:url value="${row.img1}"/>"/></a>
		  </c:if>
	      <c:if test="${not empty row.img2}">
		   <a href="<c:url value="${row.img2}"/>"><img width="30%" src="<c:url value="${row.img2}"/>"/></a>
		  </c:if>
	 	  <c:if test="${not empty row.img3}">
		   <a href="<c:url value="${row.img3}"/>"><img width="30%" src="<c:url value="${row.img3}"/>"/></a>
		  </c:if>
		  <c:if test="${not empty row.img4}">
		   <a href="<c:url value="${row.img4}"/>"><img width="30%" src="<c:url value="${row.img4}"/>"/></a>
		  </c:if>
		  <c:if test="${not empty row.img5}">
		   <a href="<c:url value="${row.img5}"/>"><img width="30%" src="<c:url value="${row.img5}"/>"/></a>		
		  </c:if>
		  <c:if test="${not empty row.img6}">
		   <a href="<c:url value="${row.img6}"/>"><img width="30%" src="<c:url value="${row.img6}"/>"/></a>
		  </c:if>
	     </div>
	    </c:if>							
		</c:forEach>
	   </div>	
	
             <table>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					  <c:if test="${(row.id) == id}">
						<td style="font-size:35px;font-weight:bold;"><c:out value="${row.name}" /></td>
					  </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					 <c:if test="${(row.id) == id}">		
						<td style="font-size:25px;font-weight:bold;color:red;padding-top:3%;">NT$ <c:out value="${row.price}" /></td>
					 </c:if>
					</c:forEach>		
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					 <c:if test="${(row.id) == id}">
					 <% pageContext.setAttribute("newLine", "\n"); %> 
                      <td style="padding-top:3%;padding-bottom:7%;color: gray;">${fn:replace(row.text, newLine, '<br><br>')}</td>
					 </c:if>
					</c:forEach>
				</tr>
				<tr style="padding-bottom:7%;">
				 <td>數量<input style="height:30px;width:100px;" type="number" min="1" step="1" /></td>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">
					 <c:if test="${(row.id) == id}">
					 <c:if test="${(row.qt) > 0}">		
						<td style="font-weight:bold;padding-top:7%;color: blue;"><c:out value="現正販賣中"/></td>
					 </c:if>
					 <c:if test="${(row.qt) < 0}">		
						<td style="font-weight:bold;color: red;padding-top:7%;"><c:out value="缺貨"/></td>
					 </c:if>
					 </c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="row" items="${result.rows}" varStatus="status">					
					   <c:if test="${(row.id) == id}">
						 <td style="font-weight:bold;padding-bottom:1%;">
						 <button style="height:50px;width:50%;font-size: 15px;border-color: #99DE56;background-color: #99DE99;">添加到購物車</button></td>
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
		$(function() {
				var $showImg = $('.showimg');
				$('.changeimg a').mouseover(function(){
					$showImg.attr('src', $(this).attr('href'));
				}).click(function(){
					return false;
				});				
		});
		
		
		
	</script>
</body>
</html>