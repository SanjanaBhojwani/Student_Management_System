<%@ page import="java.sql.*" %>

<html>
<head>
<title>
Delete Student
</title>
<style>
*{font-size:40px;
  background-image: url(ab3.jpg);
  background-size: cover;
}
.container{
display:flex;
border: 2px solid black;

}
</style>
</head>
<body>
<center>
<div class="container">
<div class="heading">Delete Student</div>
</div>
<form name="myform" onsubmit="return validateform()" >
enter rno:<br/><input type="number" name="roll_no" />
<br/><br/>
<input type="submit" value="Delete" name="delete-btn"/>
<button type="button" class="back-btn" onclick="window.location='index.jsp'">Back</button>
</form>
<%
if(request.getParameter("delete-btn")!=null)
{
int roll_no=Integer.parseInt(request.getParameter("roll_no"));
boolean rowDeleted;
try{
out.println("");
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/internship";
String un="root";
String pw="abcd1234";
Connection con=DriverManager.getConnection(url,un,pw);
String sql="delete from student where rno=?";
PreparedStatement pst=con.prepareStatement(sql);
pst.setInt(1,roll_no);
rowDeleted=pst.executeUpdate()>0;
if(rowDeleted){%><script>alert("Record Deleted");</script><%}
else{%><script>alert("error:record not found");</script><%}
con.close();
}
catch(SQLException e){
out.println("issue"+e);
}
}
%>
</center>
<script>  
function validateform(){   
var rno=document.myform.roll_no.value; 



if(rno<=0){  
  alert("invalid rollno!");  
  return false;  
}
}  
</script>  
</body>
</html>