<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="../css/header_reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="../css/header_style.css"> <!-- Resource style -->
    <link rel="stylesheet" href="../css/reset1.css"> <!--Slider CSS reset -->
	<link rel="stylesheet" href="../css/style1.css"> <!--Slider Resource style -->
    <link rel="stylesheet" href="../css/form.css">
    <!--for styling footer and adding icons-->
    <link rel="stylesheet" type="text/css" href="../css/footer.css" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

		<!-- <script type="text/javascript" src="resources/jsFiles/jquery-1.10.1.min.js"></script>
		<script type="text/javascript" src="resources/jsFiles/jquery-ui.js"></script>
		<script type="text/javascript" src="resources/jsFiles/jquery-ui-i18n.js"></script>
		<script type="text/javascript" src="./resources/jsFiles/selecter.js"></script>
		<script type="text/javascript"></script> -->


    <!--Other js-->
    
	<script src="../js/modernizr_header.js"> </script>  <!-- Modernizr -->
  	<script src="../js/modernizr1.js"></script> <!-- Modernizr -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="../js/main_header.js"></script> <!-- Resource jQuery -->
	<script src="../js/main1.js"></script> <!--Slider Resource jQuery -->
	
	
<title>Mobile Wallet</title>
</head>



<!-- body>
HI ${w.name}
	<div>
		
		</p>
		
		<a href="../pages/PreviousTransactions.jsp">Previous Transactions</a>
		<a href="../pages/SendMoney.jsp">Send Money</a>
		<a href="">Receive Money</a>
		<a href="">Documents</a>
		<a href="">Add Money to  </a>
	</div-->

<%

com.psl.model.Wallet w = (com.psl.model.Wallet)session.getAttribute("w");
int count = 0;

try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/mobilewallet";
String username="root";
String password="12345";
String query="select * from req_money where rmobileno ="+ w.getMobileno();
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
	count++;
}

rs.close();
stmt.close();
conn.close();
}
catch(Exception e)
{
e.printStackTrace();
}
%>

<body>
	<header>
		<div class="cd-logo"><a href="#0"><img src="../img/Wallet-icon.png" alt="Logo"></a></div>

		<nav class="cd-main-nav-wrapper">
			<ul class="cd-main-nav">
				<li><a href="#0">Transactions</a></li>
				<li><a href="#0">Documents</a></li>
				<li><a href="#0">Requests:<% out.println(count); %></a></li>
				<!--li><a href="#0">Blog</a></li>
				<li><a href="#0">Contact</a></li-->
				<li>
					<a href="#0" class="cd-subnav-trigger"><span>
					<%
					
					if(w!=null){
					out.println(w.getName());
					}
					
					%></span></a>
					<ul>
						<li class="go-back"><a href="#0">Menu</a></li>
						<li><a href="../pages/AddMoney.jsp">Wallet Money INR <%if(w!=null)
					out.println(w.getBalance());%></a></li>
						<li><a href="#0">Offers</a></li>
						<li><a href="#0">Settings</a></li>
						<li><a href="../Webapp/logout">Logout</a></li>
						<!--li><a href="#0">Category 5</a></li-->
						
						<li><a href="#0" class="placeholder"><span>
					<% if(w!=null)
					out.println(w.getName());
					
					%></span></a></li>
					</ul>
				</li>
			</ul> <!-- .cd-main-nav -->
		</nav> <!-- .cd-main-nav-wrapper -->
		
		<a href="#0" class="cd-nav-trigger">Menu<span></span></a>
	</header>

	<section class="cd-hero">
		<ul class="cd-hero-slider autoplay">

						<li class="selected">
				<div class="cd-half-width cd-img-container">
					<img src="../assets/receive.png" alt="tech 2">
				</div> <!-- .cd-half-width.cd-img-container -->

				<div class="cd-half-width">
					<h2>Request Money</h2>
                    <form class="cd-form" action="../Webapp/RequestMoney" method=post>  <!--Add action for requesting money-->

					<p class="fieldset">
						<label class="image-replace cd-mobile" for="signup_name">Mobile No.</label>
						<input class="full-width has-padding has-border" id="signup_name"
							type="tel" maxlength="10" name="rmobileno" placeholder="Mobile No." style="font-size:                                    11pt"> 
                        <!--span class="cd-error-message">Please Enter Mobile</span-->
					</p>

					<p class="fieldset">
						<label class="image-replace cd-amount" for="signup-username">Amount</label>
						<input class="full-width has-padding has-border"
							id="signup-username" type="tel" name="amount"
							placeholder="Amount" style="font-size: 11pt"> <!--span class="cd-error-message">Invalid Amount</span-->
					</p>
                        <p class="fieldset">
						<input class="full-width has-padding" type="submit"
							value="Request">
					</p>
                     </form>
                     <p class="fieldset"><c:if test="${not empty error}">
  	 				 ${error}
  	 				 
  	 				 
  	 				 </c:if>
  	 				 </p>
				</div> <!-- .cd-half-width -->
				
			</li>
			
			
			<li>
				<div class="cd-half-width">
					<h2>Send Money</h2>
					<!-- this is mapped with displaysendmoney.java -->
					<form class="cd-form" action="../Webapp/ConfirmPayment" method=post> <!--Add action for sending money-->

					<p class="fieldset">
						<label class="image-replace cd-mobile" for="signup_name">Mobile No.</label>
						<input class="full-width has-padding has-border" id="signup_name"
							type="tel" maxlength="10" name="rmobileno" placeholder="Mobile No." style="font-size: 11pt"> <!--span
							class="cd-error-message">Please Enter Mobile</span-->
					</p>

					<p class="fieldset">
						<label class="image-replace cd-amount" for="signup-username">Amount</label>
						<input class="full-width has-padding has-border"
							id="signup-username" type="tel" name="amount"
							placeholder="Amount" style="font-size: 11pt"> <!--span class="cd-error-message">Invalid Amount</span-->
					</p>
                        <p class="fieldset">
						<input class="full-width has-padding" type="submit"
							value="Send">
					</p>
                     </form>
					
				</div> <!-- .cd-half-width -->

				<div class="cd-half-width cd-img-container">
					<img src="../assets/send.png" alt="tech 1">
				</div> <!-- .cd-half-width.cd-img-container -->
			</li>

			<li>
				<div class="cd-half-width">
					<h2>Add Money</h2>
					<!-- this is mapped with displaysendmoney.java -->
					<form class="cd-form" action="../Webapp/AddMoney" method=post> <!--Add action for sending money-->

			<!-- 	<p class="fieldset">
						<label class="image-replace cd-mobile" for="signup_name">Mobile No.</label>
						<input class="full-width has-padding has-border" id="signup_name"
							type="tel" maxlength="10" name="rmobileno" placeholder="Mobile No." style="font-size: 11pt"> <!--span
							class="cd-error-message">Please Enter Mobile</span
					</p>-->

					<p class="fieldset">
						<label class="image-replace cd-amount" for="signup-username">Amount</label>
						<input class="full-width has-padding has-border"
							id="signup-username" type="tel" name="amount"
							placeholder="Amount" style="font-size: 11pt"> <!--span class="cd-error-message">Invalid Amount</span-->
					</p>
                     <p class="fieldset">
						<input class="full-width has-padding" type="submit"
							value="Add">
					</p>
                     </form>
					
				</div> <!-- .cd-half-width -->

				<div class="cd-half-width cd-img-container">
					<img src="../assets/receive.png" alt="tech 1">
				</div> <!-- .cd-half-width.cd-img-container -->
			</li>


            <li>
				<div class="cd-half-width">
					<h2>Recharge</h2>
				</div> <!-- .cd-half-width -->
				
                <div class="cd-half-width cd-img-container">
					<img src="../assets/recharge.png" alt="tech 2">
				</div> <!-- .cd-half-width.cd-img-container -->
			</li>

           <!--  <li>
				<div class="cd-half-width">
					<h2>History</h2>
					
					<div>
					
					</div>
					
					
				</div> <!-- .cd-full-width S
			</li> -->
		</ul> <!-- .cd-hero-slider -->

		<div class="cd-slider-nav">
			<nav>
				<span class="cd-marker item-1"></span>
				
				<ul>
					<li class="selected"><a href="#0">Request</a></li>
					<li><a href="#0">Send</a></li>
					<li><a href="#0">Add</a></li>
					<li><a href="#0">Recharge</a></li>
					<!-- <li><a href="#0">History</a></li> -->
				</ul>
			</nav> 
		</div> <!-- .cd-slider-nav -->
	</section> <!-- .cd-hero -->
	
   <footer class="footer-distributed">

			<div class="footer-left">

				<h3>Mobile<span>Wallet</span></h3>

				<p class="footer-links">
					<a href="#">Home</a>
					�
					<a href="#">Offers</a>
					�
					<a href="#">About</a>
					�
					<a href="#">Faq</a>
					�
					<a href="#">Contact</a>
				</p>

				<p class="footer-company-name">M-Wallet � 2015</p>
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>Persistent Systems, Phase-1, Hinjewadi</span> Pune, India</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+12-34567890</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:support@company.com">support@company.com</a></p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					<span>About the app</span>
					This is going to be a really cool app.
				</p>

				<div class="footer-icons">

					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-github"></i></a>

				</div>
			</div>

		</footer>






</body>




</body>
</html>