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
    
     </style>
     <!-- Modernizer -->
     <script src="js/modernizer.js"></script>
 
     <!--[if lt IE 9]>
       <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
       <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
     <![endif]-->
     <script src="jquery-3.4.1.js"></script>
     <script>
          var check;
          function passcheck(){
               if(($("#n_password").val()==='') && ($("#c_n_password").val()===''))
                 {
                      $("#pas").html("");
                 }
             else if($("#n_password").val()===$("#c_n_password").val()){
                  $("#pas").css('color','green');
                            $("#pas").html("Password and Confirm Password Matched");
              }
              else{
                   $("#pas").css('color','red');
                            $("#pas").html("Password and Confirm Password do not Match");
              }
          }
         function oldcheck(){
             //alert('blur');
            
                    var pass=$("#o_password").val();
                   // alert(pass);
                    $.post('OldPassCheck',{
                        pass:pass,
                        name:'<%=request.getParameter("name")%>'
                    },function(data){
                       // alert(data);
                        if(data==="true"){
                            $("#passcheck").css('color','green');
                            $("#passcheck").html("Password Matched");
                            check=1;
                        }
                        else{
                            $("#passcheck").css('color','red');
                            $("#passcheck").html("Incorrect Password");
                            check=0;
                        }
                    });
                };
         function change(){
        // alert('hello');
                    // alert($("#n_password").val());

if($("#o_password").val()==='' || $("#n_password").val()==='' || $("#c_n_password").val()==='')
    alert('Please fill out all required fields');
else if(check===0 || $("#n_password").val()!==$("#c_n_password").val())
alert('Error');
  else{
                 // alert($("#n_password").val());
              $.ajax({
url     : 'ChangePass',
method :'post',
data:{
   pass:$("#n_password").val(),
   name:'<%=request.getParameter("name")%>'
            },
                    success:function(data){ 
                        
                            alert(data+' Login Again');
                        window.location.href="index.html#login";


}});
}
         };
     </script>
<
</head>
  <body>
     
        <div id="reservation" class="reservations-main pad-top-100 pad-bottom-100">
                <div class="container">
                    <div class="row">
                        <div class="form-reservations-box">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                                    <h2 class="block-title text-center">
                                CHANGE PASSWORD		
                            </h2>
                                </div>
                                <p>PLEASE FILL OUT ALL REQUIRED* FIELDS. THANKS!</p>
        
                                <form id="add" method="post" class="reservations-box" >
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-box">
                                            <input type="password" name="o_password" id="o_password"  placeholder="Old Password" onblur="oldcheck();" required="required" data-error="this field is required."><span id="passcheck"></span>
                                        </div>
                                    </div>
                                    <!-- end col -->
                            
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-box">
                                            <input type="password" name="n_password" id="n_password" placeholder="New Password" required="required"  data-error="this field is required.">
                                        </div>
                                    </div>
                    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-box">
                                                <input type="password" name="c_n_password" id="c_n_password" placeholder="Confirm New Password" required="required" onkeyup="passcheck();" onblur="passcheck();" data-error="this field is required."><span id="pas"></span>
                                            </div>
                                        </div>
                                   
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="reserve-book-btn text-center">
                                            <button class="hvr-underline-from-center"  onclick="change();" id="addpr">CHANGE PASSWORD</button><br><span id="s"></span>
                      
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
</body>
</html>