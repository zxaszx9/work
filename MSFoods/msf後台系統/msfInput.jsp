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
<meta http-equiv="Content-Type"content="text/html;charset=UTF-8">
<title>msfoodsManage</title>
<style>
* {
  box-sizing: border-box;
}
body{
background-color: #99DE99;
}
main{
position:relative;
background-color: black;
}
form{
position:absolute; 
left: 450px;
font-size: 20px;
}
input{
border-radius:10px;
font-size: 15px;
}
textarea{
border-radius:10px;
font-size:15px; 
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
	<h1>新增資料</h1>
	</header>
	<main>
	   <form action="insert.jsp" method="post">
         產品名稱：<input style="height:30px;" type="text" name="name" id="name"><br><br>
         份量(內容物)：<input style="height:30px;" type="text" name="Intro" id="Intro"><br><br>
         價錢：<input style="height:30px;width:100px;" type="text" name="price" id="price">元<br><br>
         圖片(URL)：<input style="height:30px;" type="text" name="file" id="file"><br><br>
         類別<a onclick="alert(' 1.商品總覽(非選項)\n 2.【懶人箱】蔬菜包＋調理包\n 3. 低GI料理\n 4. 西式美味\n 5. 饕客美味\n 6. 零嘴小點\n 7. 果昔飲品\n 8. 素食料理')" style="text-decoration: underline; color: blue;">(註記)</a>：<input style="height:30px;width:100px;" type="text" name="c1" list="c1">
              <datalist id="c1">
               <option value="2">
               <option value="3">
               <option value="4">
               <option value="5">
               <option value="6">
               <option value="7">
               <option value="8">
              </datalist>
         類別內排序：<input style="height:30px;width:100px;" type="text" name="c2" id="c2"><br><br>
         庫存量：<input style="height:30px;width:100px;" type="text" name="qt" id="qt"><br><br>
         簡介：<br><textarea name="text" id="text" rows="8" cols="44"></textarea><br><br>
         小圖1(URL)：<input style="height:30px;" type="text" name="img1" id="img1"><br><br>
         小圖2(URL)：<input style="height:30px;" type="text" name="img2" id="img2"><br><br>
         小圖3(URL)：<input style="height:30px;" type="text" name="img3" id="img3"><br><br>
         小圖4(URL)：<input style="height:30px;" type="text" name="img4" id="img4"><br><br>
         小圖5(URL)：<input style="height:30px;" type="text" name="img5" id="img5"><br><br>
         小圖6(URL)：<input style="height:30px;" type="text" name="img6" id="img6"><br><br>
         上架<a onclick="alert(' 0:不上架\n 1:上架')" style="text-decoration: underline; color: blue;">(註記)</a>：<input style="height:30px;width:100px;"type="text" name="sell" list="sell"><br>
              <datalist id="sell">
               <option value="0">
               <option value="1">
              </datalist><br>
         <input style="color:white;background-color: #125929;font-size:25px; font-weight:bold; height:50px;width: 300px;" type="button" name="button" value="新增" onclick="if(confirm('確認是否新增？')) this.form.submit();">
       <br><br>
       </form>
	</main>
	<script>
		$(function() {

		});
	</script>
</body>
</html>