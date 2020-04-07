<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="subg.dbutil.DBConnection"%>
<%@page import="subg.dao.DeliveryDAO"%>
<html>
<head>
<style type="text/css">
	*{
  margin:0;
  padding:0;
}
body{
  height:100vh;
  overflow:hidden;
  background:linear-gradient(-40deg,white,lightgrey);
  box-sizing:border-box;
  font-family: "Montserrat", sans-serif;
}
#wrapper{
  height:480px;
  width:700px;
  background:#fff;
  border:1px solid grey;
  border-radius:10px;
  margin:3em auto 0 auto;
  overflow:hidden;
  box-shadow:0px 2px 25px #000;
}
.row{
  display:flex;
  justify-content:center;
}
.row:nth-of-type(1) .col-xs-5{
  display:flex;
  flex-direction:column;
  align-items:center;
 
/*   border:solid 1px transparent; */
  border-radius:4px;
  margin:1em 5px;
}
.row:nth-of-type(1) .col-xs-5 #cards{
  display:flex;
  flex-direction:row;
  flex-wrap:nowrap;
  justify-content:center;
}
.row:nth-of-type(1) .col-xs-5 #cards img{
  width:100px;
  height:100px;
}

.row:nth-of-type(2) .col-xs-5{
  display:flex;
  flex-direction:column;
  justify-content:space-around;
  flex-basis:45%;
}
.row:nth-of-type(2) .col-xs-5 input{
  border:2px solid lightgrey;
  height:35px;
  border-radius:10px;
  padding-left:10px;
}
.row .col-xs-5 input:focus, .row:nth-of-type(3) .col-xs-2 input:focus{
  border-color:green;
  outline:0;
}
label{
  position:relative;
}
 .fa{
  position:absolute;
  right:25px;
  bottom:10px;
}
.row-three{
  display:flex;
  justify-content:space-around;
  align-items:baseline;
  align-content:space-between;
  margin:2em 1em 2.4em 1em;
}
.row:nth-of-type(3) .col-xs-2{
  flex-basis:50%;
}
.row:nth-of-type(3) .col-xs-5{
  flex-basis:40%;
  align-items:baseline;
}
.row:nth-of-type(3) .col-xs-2 input{
  height:35px;
  border:2px solid lightgrey;
  border-radius:10px;
  padding-left:10px;
}
.row:nth-of-type(3) .col-xs-5 .small{
  font-size:.70em;
}
footer{
  height:80px;
  flex-direction:row;
  justify-content:space-between;
  align-items:center;
  position: absolute;
    left: 46%;
}
footer .btn{
  margin:50px 15px 55px 15px;
  border-radius:20px;
  padding:.65em 1.6em;
  align-items: center;
}
footer :nth-child(1){
  background-color:#fff;
  color:#f62f5e;
  align-items: center;

}
footer :nth-child(2){
  background-color:#f62f5e;
  color:#fff;
  align-items: center;

}
.col-xs-5.highlight{
  border:solid 1px blue;
}
.button {
    position: absolute;
    top: 50%;
}
.wrap {
  
    text-align: center;
}
</style>
<script src="jquery-3.4.1.js">
  </script>
<script type="text/javascript">
	
function hidePaytm(){
  document.getElementById('chcn').style.display='flex';
document.getElementById('vd_card').style.display='none';
document.getElementById('ch').innerHTML="Username";
document.getElementById('cn').style.display='none';
document.getElementById('pwd').style.display='flex';
document.getElementById('log').style.display='block';
  document.getElementById('button').innerHTML="Pay Rs.<%=request.getParameter("total")%>";

};
function hideCard(){
  document.getElementById('chcn').style.display='flex';
  document.getElementById('vd_card').style.display='flex';
  document.getElementById('ch').innerHTML="Cardholder's Name";
  document.getElementById('cn').style.display='flex';
  document.getElementById('pwd').style.display='none';
document.getElementById('log').style.display='none';
  document.getElementById('button').innerHTML="Pay Rs.<%=request.getParameter("total")%>";


};
function hideCOD(){
  document.getElementById('chcn').style.display='none';
  document.getElementById('vd_card').style.display='none';
  document.getElementById('button').innerHTML="Confirm order";
};
function check(){
    <%
        DeliveryDAO d=new DeliveryDAO();
        String value=d.User();
        String n=request.getParameter("name"); 
        PreparedStatement ps1=DBConnection.getConnection().prepareStatement("select * from "+n);
        ResultSet rs=ps1.executeQuery();
        PreparedStatement ps2;
        while(rs.next()){
            ps2=DBConnection.getConnection().prepareStatement("insert into history(Product_name,Quantity,Price_per_kg,name) values(?,?,?,?)");
            ps2.setString(1, rs.getString(1));
            ps2.setFloat(2,rs.getFloat(2));
            ps2.setFloat(3, rs.getFloat(3));
            ps2.setString(4,n);
            ps2.execute();
        }
        PreparedStatement ps=DBConnection.getConnection().prepareStatement("delete "+n);
        ps.execute();
        
    %>
            var a="<%=request.getParameter("name")%>"+"@gmail.com";

    alert('Order Placed Successfully!!!! \n\
    Our Deliver Man:<%= value%> has accepted your order\n\
    Your Product will be delivered soon\n\
    Thankyou for Shopping    ');
    
    window.location.href="Show_Prod_Cust.jsp?name="+a;
}
</script>
 <script>
            if(window.history.forward(1)!==null)
                window.history.forward(1);
            </script>
</head>
<body>
  <div id="wrapper">
    <div class="row">
      <div class="col-xs-5">
        <div id="cards">
    ???
    <a id="card" title="Visa/Debit Card" onclick="hideCard();" ?>
          <img src="icons8-mastercard-100.png">
          <img src="icons8-visa-100.png">
          </a>
        </div><!--#cards end-->

      </div><!--col-xs-5 end-->
      <div class="col-xs-5">
        <div id="cards">
          <a id="COD" title="Cash on Delivery" onclick="hideCOD();" >
            <img src="icons8-cash-on-delivery-100.png">
            </a>
        </div><!--#cards end-->
      </div><!--col-xs-5 end-->
      <div class="col-xs-5">
          <div id="cards">
            <a id="paytm" title="paytm" onclick=" hidePaytm();">
              <img src="icons8-paytm-96.png" >
            </a>
          </div><!--#cards end-->
        </div><!--col-xs-5 end-->
    </div><!--row end-->
  <div class="row" id="chcn">
    <div class="col-xs-5">
      <i class="fa fa fa-user"></i>
      <label for="cardholder" id="ch">Cardholder's Name</label>
      <input type="text"  id="cardholder">
    </div><!--col-xs-5-->
    <div class="col-xs-5" id="cn">
      <i class="fa fa-credit-card-alt"></i>
      <label for="cardnumber" >Card Number</label>
      <input type="text" id="cardnumber">
    </div><!--col-xs-5-->
    <div class="col-xs-5" id="pwd" style="display: none">
        <i class="fa fa-credit-card-alt"></i>
        <label for="cardnumber"  >Password</label>
        <input type="password" id="password">
      </div><!--col-xs-5-->
      <footer style="display: none" id="log">
        <br />
          <button class="btn" style="align-content: center">Login</button>
        </footer>
  </div><!--row end-->
  <div class="row row-three" id="vd_card">
    <div class="col-xs-2">
      <i class="fa fa-calendar"></i>
      <label for="date">Valid thru</label>
      <input type="text" placeholder="MM/YY" id="date">
    </div><!--col-xs-3-->
    <div class="col-xs-2">
      <i class="fa fa-lock"></i>
      <label for="date">CVV / CVC *</label>
      <input type="text" id="cvv">
    </div><!--col-xs-3-->
    <div class="col-xs-5">
      <span class="small">* CVV or CVC is the card security code, unique three digits number on the back of your card seperate from its number.</span>
    </div><!--col-xs-6 end-->
  </div><!--row end-->
 
  <footer class="wrap">
      <button onclick="check();" class="btn button" style="align-content: center" id="button">Pay Rs.<%=request.getParameter("total")%></button>
  </footer>
</div><!--wrapper end-->
<script type="text/javascript">
 
</script>
</body>
</html>