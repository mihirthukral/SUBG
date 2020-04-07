
<%@page import="java.sql.ResultSet"%>
<%@page import="subg.dto.MembersDTO"%>
<%@page import="subg.dbutil.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Our Sellers</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
       
        <style type="text/css">
            /*	
	Side Navigation Menu V2, RWD
	===================
	License:
	https://goo.gl/EaUPrt
	===================
	Author: @PableraShow

 */

@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

body {
  font-family: 'Open Sans', sans-serif;
  font-weight: 300;
  line-height: 1.42em;
  color:#A7A1AE;
  background-color:#1F2739;
}

h1 {
  font-size:3em; 
  font-weight: 300;
  line-height:1em;
  text-align: center;
  color: #4DC3FA;
}

h2 {
  font-size:2em; 
  font-weight: 300;
  text-align: center;
  display: block;
  line-height:1em;
  padding-bottom: 2em;
  color: #FB667A;
}

h2 a {
  font-weight: 700;
  text-transform: uppercase;
  color: #FB667A;
  text-decoration: none;
}

.blue { color: #185875; }
.yellow { color: #FFF842; }

.container th h1 {
	  font-weight: bold;
	  font-size: 1em;
  text-align: left;
  color: #185875;
}

.container td {
	  font-weight: normal;
	  font-size: 1em;
  -webkit-box-shadow: 0 2px 2px -2px #0E1119;
	   -moz-box-shadow: 0 2px 2px -2px #0E1119;
	        box-shadow: 0 2px 2px -2px #0E1119;
}

.container {
	  text-align: left;
	  overflow: hidden;
	  width: 80%;
	  margin: 0 auto;
  display: table;
  padding: 0 0 8em 0;
}

.container td, .container th {
	  padding-bottom: 2%;
	  padding-top: 2%;
  padding-left:2%;  
}

/* Background-color of the odd rows */
.container tr:nth-child(odd) {
	  background-color: #323C50;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
	  background-color: #2C3446;
}

.container th {
	  background-color: #1F2739;
}

.container td:first-child { color: #FB667A; }

.container tr:hover {
   background-color: #464A52;
-webkit-box-shadow: 0 6px 6px -6px #0E1119;
	   -moz-box-shadow: 0 6px 6px -6px #0E1119;
	        box-shadow: 0 6px 6px -6px #0E1119;
}

.container td:hover {
  background-color: #FFF842;
  color: #403E10;
  font-weight: bold;
  
  box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
  transform: translate3d(6px, -6px, 0);
  
  transition-delay: 0s;
	  transition-duration: 0.4s;
	  transition-property: all;
  transition-timing-function: line;
}

@media (max-width: 800px) {
.container td:nth-child(4),
.container th:nth-child(4) { display: none; }
}
.purple {
  color: #9b59b6;
  border: 2px #9b59b6 solid;
}

.purple:hover {
  color: #fff;
  background-color: #9b59b6;
}
.buttons {
  padding-top: 30px;
  text-align: center;
}
.btn {
  cursor: pointer;
  margin: 10px;
  border-radius: 5px;
  text-decoration: none;
  padding: 10px;
  font-size: 22px;
  transition: .3s;
  -webkit-transition: .3s;
  -moz-transition: .3s;
  -o-transition: .3s;
  display: inline-block;
}

a{
    text-decoration: none;
    color:#FB667A;
}
img.ab{
	  position: absolute;
	right:150px;
}
img.ac{
  position: absolute;
	right:200px;
}
img.ad{
    position: absolute;
    left: 150px;
}
img.ae{
    position: absolute;
    left:220px;
}
        </style>
        <script src="jquery-3.4.1.js" type="text/javascript">
            
        </script>
        <script type="text/javascript">
            function prod(name){
               $.post("SellerProductsjsp.jsp",{
                     n:name
                },function(responsetext){
                 $('#sp').text(responsetext);
                  alert('hello ' + responsetext);
                });
       // var n=name;
      // var n='mihir';
      
            }
             
           
        </script>
       
        <script>
            function red(){
               alert('Logged Out Successfully!!!!');
                window.location.href="index.html";
            }
            
        </script>
        
</head>
<body>
   
    <%
        String s[]=request.getParameter("name").split("@");
        s[0]=s[0].toUpperCase();
        %>
        <script>
            function goto(){
               var x="<%=s[0]%>";
                window.location.href="CartShow.jsp?name="+x;
            }
            function goto1(){
                var x="<%=s[0]%>";
                window.location.href="Previous.jsp?name="+x;
            }
        </script>
        
     <div>
      <img class="ab" title="Logout" src="exit (1).png" onclick="red()" >
      <a href="ChangePasswordCustomer.jsp?name=<%=s[0]%>"> <img src="c.png" title="Change Password" class="ac"  ></a>
      <img src='icons8-shopping-cart-48.png' class="ad" title="Your Cart" onclick="goto();">
      <a href=""><img src=""></a>
      <img src="icons8-order-history-48.png" class="ae" title="Previously Ordered Items" onclick="goto1();">
    </div>
        <h1><span class="blue"></span>Hello<span class="blue"></span> <span class="yellow">User</span></h1>
<h2>Our Best Sellers</h2>

<table class="container">
	<thead>
		<tr>
			<th><h1>CLICK ON SELLER NAME TO SEE PRODUCTS.</h1></th>
		</tr>
	</thead>
        <tbody>
        <%
            //String ab=request.getParameter("name");
            PreparedStatement ps=DBConnection.getConnection().prepareStatement("select name,username from members_info where usertype='SELLER'");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                String name=rs.getString(1);
                String uname=rs.getString(2);
               // String n=name;
                                             out.println("<tr>");
							out.println("<td><a href=\"SellerProductsjsp.jsp?username="+uname+"&n="+s[0]+"\">");
								out.println(name);
							out.println("</a></td>");
                                                out.println("</tr>");
            }
            %>
        </tbody>
</table>
<!--<div class="buttons">
    <a class="btn purple" href="AddProduct.jsp " >ADD PRODUCT</a>
  </div>
   -->       
   <span id="sp"></span>
</body>
</html>