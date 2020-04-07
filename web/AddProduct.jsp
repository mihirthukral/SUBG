<%@page import="java.sql.PreparedStatement"%>
<%@page import="subg.dbutil.DBConnection"%>
<html>
<head>
     <!-- Basic -->
     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
 
     <!-- Mobile Metas -->
     <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
 
     <!-- Site Metas -->
     <title>ADD PRODUCTS</title>
     <meta name="keywords" content="">
     <meta name="description" content="">
     <meta name="author" content="">
     <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    
     <!-- Site Icons -->
     <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
     <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
 
     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="css/bootstrap.min.css">
     <!-- Site CSS -->
     <link rel="stylesheet" href="css/style.css">
     <!-- Responsive CSS -->
     <link rel="stylesheet" href="css/responsive.css">
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
     <!-- color -->
     <link id="changeable-colors" rel="stylesheet" href="css/colors/orange.css" />
     <style>
         .btn {
  border-radius: 5px;

             cursor: pointer;
  margin: 10px;
  text-decoration: none;
  padding: 10px;
  font-size: 22px;
  transition: .3s;
  -webkit-transition: .3s;
  -moz-transition: .3s;
  -o-transition: .3s;
  display: inline-block;
}
.purple {
  color: #9b59b6;
    border: 2px #9b59b6 solid;

}
.buttons {
  padding-top: 30px;
  text-align: center;
}
a{
    text-decoration: underline;
}
     </style>
     <!-- Modernizer -->
     <script type="text/javascript">
                  window.history.forward(1);
         </script>
     <script src="js/modernizer.js">
     </script>
 
     <!--[if lt IE 9]>
       <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
       <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
     <![endif]-->
     <script src="jquery-3.4.1.js"></script>
     <script>
         function add(){
if($("#name").val()==='' || $("#quant").val()==='' || $("#price").val()==='')
    alert('Please fill out all required fields');
else{
              $.ajax({
url     : 'Add',
method :'post',
data:{
    name:$("#name").val(),
               quantity:$("#quant").val(),
               price:$("#price").val()

            }
});
alert('Product Added SuccessFully!!!!'); 
}
         };
     </script>
  </head>
  <body>
     
        <div id="reservation" class="reservations-main pad-top-100 pad-bottom-100">
                <div class="container">
                    <div class="row">
                        <div class="form-reservations-box">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                                    <h2 class="block-title text-center">
                                ADD UR PRODUCTS		
                            </h2>
                                </div>
                                <p>PLEASE FILL OUT ALL REQUIRED* FIELDS. THANKS!</p>
        
                                <form id="add" method="post" class="reservations-box" >
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-box">
                                            <input type="text" name="name" id="name"  placeholder="Name of Product" required="required" data-error="name is required.">
                                        </div>
                                    </div>
                                    <!-- end col -->
                            
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-box">
                                            <input type="text" name="quant" id="quant" placeholder="Quantity in kg" required="required"  data-error="this field is required.">
                                        </div>
                                    </div>
                    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-box">
                                                <input type="text" name="price" id="price" placeholder="Price/kg" required="required"  data-error="this field is required.">
                                            </div>
                                        </div>
                                   
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="reserve-book-btn text-center">
                                            <button class="hvr-underline-from-center"  onclick="add()" id="addpr">ADD PRODUCT</button><br><span id="show"></span>
                      
                                        </div>
                                    </div>
                                    <!-- end col -->
                                </form>
                                <!-- end form -->
                            </div>
                            <!-- end col -->
                        </div>
                        <!-- end reservations-box -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- end container -->
            </div>
     <div class="buttons">
         <a class="btn purple" href="ShowProduct1.jsp?name=<%=session.getAttribute("username")%>">MY PRODUCTS</a>
  </div>
</body>
</html>