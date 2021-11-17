<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
String id = request.getParameter("id");

String url="jdbc:mysql://localhost:3306/msfoods";
String user="root";
String password="root";
Connection conn=null;
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    out.println("載入驅動類成功");
    conn=DriverManager.getConnection(url,user,password);
    out.println("連線MySQL成功");
} catch (ClassNotFoundException e) {
    out.println("找不到驅動類"); 
}catch(SQLException e){
    out.println("連線MySQL失敗");
}

try{
    Statement stmt=conn.createStatement();
    String deletUser="delete from msfoods_items where msfoods_items.id='"+id+"'";
    stmt.executeUpdate(deletUser);
    out.println("刪除使用者資訊成功");
    response.sendRedirect("msfManage.jsp");
    return;
}catch(SQLException e){
    out.println("刪除使用者資訊失敗");
}
%>
