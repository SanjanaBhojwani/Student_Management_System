<%@ page import="java.sql.*" %>

<html>
<head>
<title>
Update Student
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
<div class="heading">Update Student</div>
</div>
<form name="myform" onsubmit="return validateform()" >
enter rno:<br/><input type="number" name="roll_no" />
<br/>
enter name:<br/><input type="text" name="name" />
<br/>
enter sub marks 1:<br/><input type="number" name="marks1" />
<br/>
enter sub marks 2:<br/><input type="number" name="marks2" />
<br/>
enter sub marks 3:<br/><input type="number" name="marks3" />
<br/></br>
<input type="submit" value="Update" name="update-btn"/>
<button type="button" class="back-btn" onclick="window.location='index.jsp'">Back</button>
</form>
<%
if(request.getParameter("update-btn")!=null)
{
int roll_no=Integer.parseInt(request.getParameter("roll_no"));
String name=request.getParameter("name");
double marks1=Double.parseDouble(request.getParameter("marks1"));
double marks2=Double.parseDouble(request.getParameter("marks2"));
double marks3=Double.parseDouble(request.getParameter("marks3"));
boolean rowUpdated;
try{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/internship";
String un="root";
String pw="abcd1234";
Connection con=DriverManager.getConnection(url,un,pw);
String sql="update student set name=?,s1=?,s2=?,s3=? where rno=?";
PreparedStatement pst=con.prepareStatement(sql);
pst.setInt(5,roll_no);
pst.setString(1,name);
pst.setDouble(2,marks1);
pst.setDouble(3,marks2);
pst.setDouble(4,marks3);
rowUpdated=pst.executeUpdate()>0;
if(rowUpdated){%><script>alert("record updated");</script><%}
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
var name=document.myform.name.value;  
var rno=document.myform.roll_no.value; 
var s1=document.myform.marks1.value; 
var s2=document.myform.marks2.value;
var s3=document.myform.marks3.value;
  
if (name==null || name==""||name.length<2){  
  alert("Name can't be blank or less than 2 characters");  
  return false;  
}
if(rno<=0){  
  alert("invalid rollno!");  
  return false;  
  }  
if(s1==null||s1==""||s1<0||s1>100){
alert("enter valid marks 1!");
}
if(s2==null||s2==""||s2<0||s2>100){
alert("enter valid marks 2!");
}
if(s3==null||s3==""||s3<0||s3>100){
alert("enter valid marks 3!");
}

}  
</script> 
</body>
</html>