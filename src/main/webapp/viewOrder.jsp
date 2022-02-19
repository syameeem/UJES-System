<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- SERVLET FOR RETRIEVE PRODUCT -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String pID = request.getParameter("pID");
String cID = request.getParameter("cID");
String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String userid = "db_gryffindor";
String password = "system";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>    
<!-- END SERVLET FOR RETRIEVE PRODUCT -->
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<div class="frame">
<img src="" alt="" style="height:50px;">
    <center><img src="images/MASMED.png" alt="" style="height:60px;"></center>
</div>
<body>
	<div class="topnav">
  	<div class="topnav-left">
    <a id="left" href="homeB.jsp">Home</a>
    <a id="left"  class="active" href="listProductB.jsp">Product</a>
  	</div>
  	
  	<div class="dropdown">
		<button class="dropbtn">BUYER <img src="images/avatar.png" alt="Avatar" class="avatar"> 
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="#">Order History</a>
		  <a href="loginBuyer.jsp">Logout</a>
		</div>
	 </div>
	</div><br><br><br><br>

<form>
<center>
	<table style="width:60%; border: 1px solid black; border-collapse: collapse;">
	
	<%
		try{
		connection = DriverManager.getConnection(connectionUrl, userid, password);
		statement=connection.createStatement();
		String sql ="select * from product where pID="+pID ;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next())
		{
			
	%>
		
		
		<div style="margin: auto; width: 60%; border: 3px solid #000000; padding: 10px;">
			<center><img src="images/<%=resultSet.getString("pPics")%>" style="width:50%;background-size: collapsed;"><br><br>
			<b><%=resultSet.getString("pName") %></b><br><br>
			Price: RM <%=resultSet.getString("pPrice") %><br><br>
			Quantity:<%=resultSet.getString("pQty") %><br><br>
			
			<a href="checkout.jsp?pID=<%=resultSet.getString("pID")%>">buy now</a>
		</div>
		
		
		
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
</center>
</form>
<br><br><br><br>
	
	
	
	
</body>
</html>