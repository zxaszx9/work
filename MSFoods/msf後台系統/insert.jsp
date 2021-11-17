<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% request.setCharacterEncoding("UTF-8");%>

<%
String name = request.getParameter("name");
String Intro = request.getParameter("Intro");
String price = request.getParameter("price");
String file = request.getParameter("file");
String c1 = request.getParameter("c1");
String c2 = request.getParameter("c2");
String qt = request.getParameter("qt");
String text = request.getParameter("text");
String img1 = request.getParameter("img1");
String img2 = request.getParameter("img2");
String img3 = request.getParameter("img3");
String img4 = request.getParameter("img4");
String img5 = request.getParameter("img5");
String img6 = request.getParameter("img6");
String sell = request.getParameter("sell");

try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/msfoods","root","root");
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("SELECT * FROM msfoods_items");

PreparedStatement ps = conn.prepareStatement
("insert into msfoods_items (name,Intro,price,file,c1,c2,qt,text,img1,img2,img3,img4,img5,img6,sell) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
ps.setString(1,name);
ps.setString(2,Intro);
ps.setString(3,price);
ps.setString(4,file);
ps.setString(5,c1);
ps.setString(6,c2);
ps.setString(7,qt);
ps.setString(8,text);
ps.setString(9,img1);
ps.setString(10,img2);
ps.setString(11,img3);
ps.setString(12,img4);
ps.setString(13,img5);
ps.setString(14,img6);
ps.setString(15,sell);
int x = ps.executeUpdate();
response.sendRedirect("msfManage.jsp");
return;
}
catch(Exception error){
    out.println(error);
}
%>
