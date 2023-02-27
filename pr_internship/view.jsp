<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
<style>
*{font-size:34px;
    background-image: url(ab3.jpg);
    background-size: cover;
}
.cont{
border:2px solid black;
display:flex;
}
.title{
text-align:left;
}
.close{
justify-content:right;
}
</style>
</head>
<body>
<center>
<div class="cont"><h2 class="title">View Student<h2>
</div>

<%
try{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/internship";
String un="root";
String pw="abcd1234";
Connection con=DriverManager.getConnection(url,un,pw);
String sql="select * from student";
PreparedStatement pst=con.prepareStatement(sql);
ResultSet rst=pst.executeQuery();
%>
<th>
<td>rno&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
<td>name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
<td>s1&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
<td>s2&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
<td>s3&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
</th>
<%
while(rst.next()){
%>

<br><hr><br>
<tr>
<td><%=rst.getInt("rno") %>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
<td><%=rst.getString("name") %>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
<td><%=rst.getDouble("s1") %>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
<td><%=rst.getDouble("s2") %>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
<td><%=rst.getDouble("s3") %>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>

</tr>
<%
}
con.close();
}
catch(SQLException e){
out.println("issue"+e);
}

%>
<form><br>
<button type="button" class="back" onclick="window.location='index.jsp'">Back</button>
</form>
</center>
</body>
</html>