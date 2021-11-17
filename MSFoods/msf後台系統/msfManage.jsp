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
<title>msfoodsManage</title>
<style>
* {
  box-sizing: border-box;
}
header{
color: #0c8519;
border-bottom: 5px solid #99DE99;
}
nav{
width: 13%;
float: left;
color: #22af80;
text-align: center;
}
nav button{
width: 135px;
height: 45px;
background-color: #125929;
color: white;
border-radius: 30px;
margin-top: 10%;
}
main{
width: 87%;
float: left;
border-left: 5px solid #99DE99;
border-top: 2px solid #99DE99;
}
th, td{
border-bottom:1.8px #99DE99 groove;
border-right:1.8px #99DE99 groove;
cellpadding:10;
width:50px;
align:center;
}
td a{
text-decoration:none;
color: #0c853c;
font-size: 20px;
font-weight: bold;
padding: 1%;
}
.del{
 color: red;
}
</style>
</head>
<body>
	<sql:setDataSource var="msfi" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/msfoods" user="root" password="root" />
	<sql:query dataSource="${msfi}" var="result">
         SELECT * from msfoods_items;
      </sql:query>
	<header>
	<h1>樂乃農場後台管理</h1>
	</header>
	<nav>
	 <h2>資料表單</h2>
	 <button onclick="window.location.href='msfInput.jsp'">新增資料</button>
	</nav>
	<main>
		  <table style="table-layout: fixed; WORD-BREAK: break-all; WORD-WRAP: break-word;">
			<tr>
             <th>產品名稱</th>
             <th>份量</th>
             <th>價錢</th>
             <th>圖片</th>
             <th>大類別</th>
             <th>類別排序</th>
             <th>庫存量</th>
             <th>簡介</th> 
             <th>上架</th> 
             <th>修改資料</th> 
             <th>刪除資料</th> 	
         </tr>
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td style="width:130px;"><c:out value = "${row.name}"/></td>
               <td style="width:110px;"><c:out value = "${row.Intro}"/></td>
               <td><c:out value = "${row.price}"/></td>
               <td><img height="50px" width="50px" src="<c:url value="${row.file}"/>"/></td>
               <td style="width:55px"><c:out value = "${row.c1}"/></td>
               <td><c:out value = "${row.c2}"/></td>
               <td style="width:60px"><c:out value = "${row.qt}"/></td>
               <td style="width:450px;"><c:out value = "${row.text}"/></td>
                <c:if test="${row.sell == 0}">
                 <td style="width:60px;color: red;"><c:out value = "已下架"></c:out></td>
                </c:if>
                <c:if test="${row.sell == 1}">
                 <td style="width:60px;"><c:out value = "上架中"></c:out></td>
                </c:if>
              
               <td style="width:80px;"><a href="msfRevise.jsp?id=${row.id}">修改</a></td>
               <td style="width:80px;"><a class="del" href="javascript:if(window.confirm('是否確認刪除?')){window.location.href=' delete.jsp?id=${row.id}'}">刪除</a></td>
            </tr>
         </c:forEach>
			</table>
	</main>
	<script>
		$(function() {

		});
	</script>
</body>
</html>