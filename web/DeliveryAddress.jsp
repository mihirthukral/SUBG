<html>
<head>
<style type="text/css">

body{
  height:100vh;
  overflow:hidden;
  background:linear-gradient(-40deg,white,lightgrey);
  box-sizing:border-box;
  font-family: "Montserrat", sans-serif;
}
#wrapper{
  height:1000px;
  width:700px;
  background:#fff;
  border:1px solid grey;
  border-radius:10px;
  margin:3em auto 0 auto;
  overflow:hidden;
  box-shadow:0px 2px 25px #000;
}
.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 39%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
  }



span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (and change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
.purple {
  color: #9b59b6;
  border: 2px #9b59b6 solid;
}

.purple:hover {
  color: #fff;
  background-color: #9b59b6;
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

</style>
<script src="jquery-3.4.1.js">
  </script>
<script type="text/javascript">
	$('input[type="checkbox"]').on('click',function(){
var selected = $(this).parent().parent().parent();    $(selected).toggleClass('highlight');
});

function check(){
    if(document.getElementById("fname").value==="" || document.getElementById("mob").value==="" || document.getElementById("adr").value===""  )
        alert('Please fill out all fields!!!!');
    else{
        document.getElementById("anc").href="payment.jsp?name=<%=request.getParameter("name")%>&total=<%=request.getParameter("total")%>";
    }
}
</script>

</head>
<body>
  <div id="wrapper">
  <div class="row">
  <div class="col-75">
    <div class="container">
      <form>

        <div class="row">
          <div class="col-50">
              <h1><em>Delivery Address</em></h1>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder="Name">
            <label for="text"><i class="fa fa-envelope"></i> Mobile No</label>
            <input type="text" id="mob" name="mob" placeholder="Mobile No">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="Address">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="Bhopal" readonly>

            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="Madhya Pradesh" readonly>
              </div>
            </div>
          </div>
     <br />
     <a class="btn purple" id="anc" onclick="check();" href="" >Continue To CheckOut</a>

        </div>
             </form>
    </div></div></div>
</div><!--wrapper end-->
<script type="text/javascript">
 
</script>
</body>
</html>