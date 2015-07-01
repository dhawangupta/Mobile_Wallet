
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <!-- meta charset="utf-8" /-->
        <title>Mobile</title>
        
	<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../css/Details.css">
	<link rel="stylesheet" href="../css/reset_header.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="../css/style_header.css"> <!-- Resource style -->
        <!--footer styling-->
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <!--Sidebar styling-->  
    <link rel="stylesheet" href="../css/form.css">
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../font/titillium/stylesheet.css">
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/animation.css">
<link rel="stylesheet" type="text/css" href="../css/yellow-green/style.css">
<link rel="stylesheet" type="text/css" href="../css/yellow-green/color.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="../css/live-preview.css">
<link rel="stylesheet" type="text/css" href="../live-font/stylesheet.css">


        <!--js files-->
        <script src="../js/modernizr_header.js"></script> <!-- Modernizr -->
        <script src="../js/jquery-2.1.1.js"></script>
        <script src="../js/main_header.js"></script> <!-- Resource jQuery -->
        <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
        <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
    </head>
    <body>
      <header>
		<div class="cd-logo"><a href="#0"><img src="../img/Wallet-icon.png" alt="Logo"></a></div>

		<nav class="cd-main-nav-wrapper">
			<ul class="cd-main-nav">
				<li><a href="#0">Transactions</a></li>
				<li><a href="#0">Documents</a></li>
				<!--li><a href="#0">Blog</a></li>
				<li><a href="#0">Contact</a></li-->
				<li>
					<a href="#0" class="cd-subnav-trigger"><span> <%
					com.psl.model.Wallet w = (com.psl.model.Wallet)session.getAttribute("w");
					if(w!=null){
					out.println(w.getName());
					}
					
					%></span></a>

					<ul>
						<li class="go-back"><a href="#0">Menu</a></li>
						<li><a href="#0">Wallet Money</a></li>
						<li><a href="#0">Settings</a></li>
						<li><a href="#0">Something Else</a></li>
						<li><a href="#0">Logout</a></li>
						<!--li><a href="#0">Category 5</a></li-->
						<li><a href="#0" class="placeholder">
						<span>
						<%		 if(w!=null){
							out.println(w.getName());
						} %>
					</span></a></li>
					</ul>
				</li>
			</ul> <!-- .cd-main-nav -->
		</nav> <!-- .cd-main-nav-wrapper -->
		
		<a href="#0" class="cd-nav-trigger">Menu<span></span></a>
	</header>  
	
	 <%
	boolean b = (Boolean)session.getAttribute("moreamt");
	long amt = (Long)session.getAttribute("amt");
	long senderbal = (Long)session.getAttribute("senderbal");
	%>
	
  <!--  div class="checkout">
           <div class="card summary-card mb20">
	            <ul class="grid mt10 mb5">
	              <li class="merchant-name medium b">Total payment to be made</li>
                  <li class="fr large b">
      	            <span class="WebRupee"><i class="fa fa-inr"></i></span> <span id="totalAmountSpan"><% //	out.println(amt);	%>	</span>
                  </li>
                </ul>
                <div id="cart-details" class="fl">
	
	            <ul class="payment-details mb10 hide">
		            <li>
			            </li>
	            </ul>
            </div>-->
           
      
      <div class="card paytmcash-card">
      
	            <ul class="grid mt10 mb5">
	              <li class="merchant-name medium b">Total payment to be made</li>
                  <li class="fr large b">
      	            <span class="WebRupee"><i class="fa fa-inr"></i></span> <span id="totalAmountSpan"><% 	out.println(amt);	%>	</span>
                  </li>
                </ul>
                <div id="cart-details" class="fl">
	
	            <ul class="payment-details mb10 hide">
		            <li>
			            </li>
	            </ul>
            </div>
            <br>
    <div>
		<ul class="grid">
	        <li>
				<div id="pc" class="fl green-tick">
			  		 <input id="option" type="checkbox" name="field" value="option" checked onclick="if(this.checked){document.getElementById('obj1').style.display='';document.getElementById('obj2').style.display='none';}else{document.getElementById('obj1').style.display='none';document.getElementById('obj2').style.display='';}" />
                            <label for="option"><span><span></span></span></label>
				</div>
				
				<div class="fl ml20 text-box">
		          	<label for="pc" class="text mb5 mt6 b">Use Mobile Wallet</label>
		          	<div class="bal grey-text small" id="yourBal">
		          		 Your current balance is  
		          		<span class="text b">
      	            <span class="WebRupee"><i class="fa fa-inr"></i></span> <span class="amt"><% out.println(senderbal); %></span>
		          		</span>
		          		
		          	</div>
					<!-- div class="bal grey-text small mt6 hide" id="remBal" style="display: none;">Remaining balance <span class="text b"><i class="fa fa-inr"></i>Rs.</span> <span class="amt"></span></span></div-->
				</div>
	        </li>
	        </ul>
	        <div id="obj1" >
	        <ul class="grid">
	        <li class="fr balance-used-box hide">
	        	<div class="large b mt6">- 
	        		<span class="WebRupee"><i class="fa fa-inr"></i></span>
	        		<span id="balance-used">	
	        		<%	if(b){
					out.println(senderbal);
					} else {
					out.println(amt);
					}	
					%>
					</span>
	        	</div>
	        </li>
      	 </ul>
	 
      <div> <!-- class="card summary-card mb20" -->
	            <ul class="grid mt10 mb5">
	              <li class="merchant-name medium b">Total payment to be paid by cards</li>
                  <li class="fr large b">
      	            <span class="WebRupee"><i class="fa fa-inr"></i></span> 
      	            <span id="totalAmountSpan">
					<%if(b){
						out.println(amt-senderbal);
					} else {
						out.println(0);
					}	
					%>
					</span>
                  </li>
                </ul>
                </div>
           </div>
           
           
           <div id="obj2" style="display:none;" >
	        <ul class="grid">
	        <li class="fr balance-used-box hide">
	        	<div class="large b mt6">- 
	        		<span class="WebRupee"><i class="fa fa-inr"></i></span>
	        		<span id="balance-used">	
	        				0
					
					</span>
	        	</div>
	        </li>
      	 </ul>
	 
      <div> <!-- class="card summary-card mb20" -->
	            <ul class="grid mt10 mb5">
	              <li class="merchant-name medium b">Total payment to be paid by cards</li>
                  <li class="fr large b">
      	            <span class="WebRupee"><i class="fa fa-inr"></i></span> 
      	            <span id="totalAmountSpan">
					<%	out.println(amt);
					%>
					</span>
                  </li>
                </ul>
                </div>
           </div>
           
           
           
           </div>
           </div>
           












































    <!-- Start Tabs -->
    <div class="tabs"> 


    <!-- Start Container tab1 -->
    <div id="tab1" class="container">
      <div class="label" id="l1"> <a href="#tab1" id="a1"><i class="fa fa-cc-mastercard"></i>&nbsp;&nbsp;Debit  Card</a> </div>
    <div class="content left" id="c1">
      <h4>Debit Card<a href="#"><i class="icon-remove-sign"></i></a></h4>
          <form class="cd-form" action="" method=post> <!--Add action for sending money-->
                <p>Enter Card Details</p>
					    <p class="fieldset">
						    <label class="image-replace" for="signup_name">Debit Card No.</label>
						    <input class="full-width has-padding has-border" id="signup_name"
							    type="tel" name="debitno" placeholder="Debit Card No." style="font-size: 11pt"> 
					    </p>
                                        <!-- Month dropdown -->
                
               <p class="details">
                   
                   <p class="inside_details">
                       Expiry Date
                        <select name="month" id="month" onchange="" size="1">
                            <option value="01">MM</option>
                            <option value="01">January</option>
                            <option value="02">February</option>
                            <option value="03">March</option>
                            <option value="04">April</option>
                            <option value="05">May</option>
                            <option value="06">June</option>
                            <option value="07">July</option>
                            <option value="08">August</option>
                            <option value="09">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select>

                         <select name="month" id="month" onchange="" size="1">
                            <option value="01">YYYY</option>
                            <option value="01">1900</option>
                            <option value="02">1910</option>
                            <option value="03">1920</option>
                            <option value="04">1930</option>
                            <option value="05">1940</option>
                            <option value="06">1950</option>
                            <option value="07">1960</option>
                            <option value="08">1970</option>
                            <option value="09">1980</option>
                            <option value="10">1990</option>
                            <option value="11">2000</option>
                            <option value="12">2010</option>
                        </select>
                       </p>
                        
                        <p class="inside_details">
                            CVV
                   <input class="cvv" id="signup_name"
							    type="tel" maxlength="3" name="cvv" placeholder="CVV" style="font-size: 11pt"> 
                         </p>
                </p>
                            <p class="fieldset">
						    <input class="full-width has-padding" type="submit"
							    value="Pay">
					    </p>
                         </form>
    </div>
  </div>
  <!-- End Container tab1 --> 
  
  <!-- Start Container tab2 -->
  <div id="tab2" class="container">
    <div class="label" id="l2"> <a href="#tab2" id="a2"><i class="fa fa-credit-card"></i>&nbsp;&nbsp;Credit Card</a> </div>
    <div class="content left" id="c2">
      <h4>Credit Card<a href="#"><i class="icon-remove-sign"></i></a></h4>
          <form class="cd-form" action="" method=post> <!--Add action for sending money-->
                <p>Enter Card Details</p>
					    <p class="fieldset">
						    <label class="image-replace" for="signup_name">Credit Card No.</label>
						    <input class="full-width has-padding has-border" id="signup_name"
							    type="tel" name="creditno" placeholder="Credit Card No." style="font-size: 11pt"> 
					    </p>
                                        <!-- Month dropdown -->
                
               <p class="details">
                   
                   <p class="inside_details">
                       Expiry Date
                        <select name="month" id="month" onchange="" size="1">
                            <option value="01">MM</option>
                            <option value="01">January</option>
                            <option value="02">February</option>
                            <option value="03">March</option>
                            <option value="04">April</option>
                            <option value="05">May</option>
                            <option value="06">June</option>
                            <option value="07">July</option>
                            <option value="08">August</option>
                            <option value="09">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select>

                         <select name="month" id="month" onchange="" size="1">
                            <option value="01">YYYY</option>
                            <option value="01">1900</option>
                            <option value="02">1910</option>
                            <option value="03">1920</option>
                            <option value="04">1930</option>
                            <option value="05">1940</option>
                            <option value="06">1950</option>
                            <option value="07">1960</option>
                            <option value="08">1970</option>
                            <option value="09">1980</option>
                            <option value="10">1990</option>
                            <option value="11">2000</option>
                            <option value="12">2010</option>
                        </select>
                       </p>
                        
                        <p class="inside_details">
                            CVV
                   <input class="cvv" id="signup_name"
							    type="tel" maxlength="3" name="cvv" placeholder="CVV" style="font-size: 11pt"> 
                         </p>
                </p>
                            <p class="fieldset">
						    <input class="full-width has-padding" type="submit"
							    value="Pay">
					    </p>
                         </form>
    </div>
  </div>
  <!-- End Container tab2 --> 
  
  <!-- Start Container tab3 -->
  <div id="tab3" class="container">
    <div class="label" id="l3"> <a href="#tab3"><i class="fa fa-globe"></i>&nbsp;&nbsp;Net Banking</a> </div>
    <div class="content left" id="c3">
      <h4>Net Banking<a href="#"><i class="icon-remove-sign"></i></a></h4>
      <p></p>
    </div>
  </div>
  <!-- End Container tab2 --> 
  
  <!-- Start Container tab4 -->
  <div id="tab4" class="container">
    <div class="label" id="l4"> <a href="#tab4"><i class="fa fa-money"></i>&nbsp;&nbsp;ATM</a> </div>
    <div class="content left" id="c4">
      <h4>ATM<a href="#"><i class="icon-remove-sign"></i></a></h4>
      <p></p>
    </div>
  </div>
  <!-- End Container tab4 --> 

   <!-- Start Container tab5 -->
  <div id="tab5" class="container">
    <div class="label" id="l5"> <a href="#tab5"><i class="fa fa-money"></i>&nbsp;&nbsp;Cash</a> </div>
    <div class="content left" id="c5">
      <h4>Cash<a href="#"><i class="icon-remove-sign"></i></a></h4>
      <p></p>
    </div>
  </div>
  <!-- End Container tab5 -->  
  
</div>
<!-- End Tabs -->
</div>

</div>

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















<!-- 

<%/*
	boolean b = (Boolean)session.getAttribute("moreamt");
	long amt = (Long)session.getAttribute("amt");
	long senderbal = (Long)session.getAttribute("senderbal");	*/
%>
	<div>
	<p>Amount to be paid</p>		
	</div>
	
	<div>	
	<%// 	out.println(amt);	%>	
	</div>
	
	
	<div>		
	<input type="checkbox" checked onclick="if(this.checked){document.getElementById('obj1').style.display='';document.getElementById('obj2').style.display='none';}else{document.getElementById('obj1').style.display='none';document.getElementById('obj2').style.display='';}"/>Pay from wallet
	</div>


	<div id="obj1" >
	<%/*	if(b){
		out.println(senderbal);
		} else {
			out.println(amt);
		}	*/
	%>
	
	
	<div>
	To be paid by card :
		<div><%/*	if(b){
		out.println(amt-senderbal);
	} else {
		out.println(0);
	}	*/
	%>
	</div>
	</div>
	
	
	</div>

	<div id="obj2"	style="display:none;">
	0
	
	<div>
	To be paid by card :
	</div>
	
	<div>
	<%//	out.println(amt);
	%>
	</div>
	
	</div>
 -->
	<!-- <div>
	To be paid by card :
	</div>

	<div id="obj1">
	<%/*if(b){
		out.println(amt-senderbal);
	} else {
		out.println(0);
	}*/
	%>
	</div>
	
	<div id="obj2" style="display:none;">
	<%	//out.println(amt);
	%>
	</div>
 -->





<!--
<div>
<input type="checkbox" onclick="if(this.checked){document.getElementById('obj3').innerHTML='A';}else{document.getElementById('obj3').innerHTML='B';}"/>Show Cart
</div>
<div id="obj3">
Cart
</div>


<div>
<input type="checkbox" id="chk1"/>Show Home
</div>
<div id="obj4">
</div>

<script>
$("#chk1").click(function(){
    $.ajax({url: "http://localhost:5776/MobileWallet/Webapp/home", success: function(result){
        $("#obj4").html(result);
    }});
});
</script>
	</div>
		
	</div> -->
	
	
</body> 
</html>