<%@page import="com.SMS.utility.SessionAttributes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive
	Web Template | Home :: w3layouts</title>
<!--/tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Grocery Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!--//tags -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<!--pop-up-box-->
<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
	media="all" />
<!--//pop-up-box-->
<!-- price range -->
<link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
<!-- fonts -->
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"
	rel="stylesheet">

<link rel="stylesheet" href="css/jquery.toast.css">

</head>
<body>

	<!-- top-header -->
	<div class="header-most-top">
		<p>Online Shopping Management System (SMS)</p>
	</div>
	<!-- //top-header -->
	<!-- header-bot-->
	<div class="header-bot">
		<div class="header-bot_inner_wthreeinfo_header_mid">

			<!-- header-bot -->
			<div class="col-md-8 header">
				<!-- header lists -->
				<ul>
					<li><a href="#" data-toggle="modal" data-target="#myModal1">
							<span class="fa fa-unlock-alt" aria-hidden="true"></span> Sign In
					</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal2">
							<span class="fa fa-pencil-square-o" aria-hidden="true"></span>
							Sign Up
					</a></li>
				</ul>
				<!-- //header lists -->

				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<!-- signin Model -->
	<!-- Modal1 -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #1accfd; color: white;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body modal-body-sub_agile">
					<div class="main-mailposi">
						<span class="fa fa-envelope-o" aria-hidden="true"></span>
					</div>
					<div class="modal_body_left modal_body_left1">
						<h3 class="agileinfo_sign">Sign In</h3>
						<p>
							Don't have an
							account? <a href="#" data-toggle="modal" data-target="#myModal2">
								Sign Up Now</a>
						</p>
						<form action="#" method="post">
							<div class="styled-input agile-styled-input-top">
								<input type="text" placeholder="Email Address" name="Name"
									id="txtEmail" required="">
							</div>
							<div class="styled-input">
								<input type="password" placeholder="Password" name="password"
									id="txtPassword" required="">
							</div>
							<div class="row">
								<input type="button" class="btn btn-info" onclick="LoginUser()"
									value="Sign In">
								<div class="text-right">
									<a href="RetrievePassword.jsp">Forget Password</a>
								</div>
							</div>

						</form>
						<div class="clearfix"></div>
					</div>

				</div>
			</div>
			<!-- //Modal content-->
		</div>
	</div>
	<!-- //Modal1 -->
	<!-- //signin Model -->
	<!-- signup Model -->
	<!-- Modal2 -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #1accfd; color: white;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body modal-body-sub_agile">
					<div class="main-mailposi">
						<span class="fa fa-envelope-o" aria-hidden="true"></span>
					</div>
					<div class="modal_body_left modal_body_left1">
						<h3 class="agileinfo_sign">Sign Up</h3>
						<p>Let's set up your SMS Account.</p>
						<form action="#" method="post">
							<div class="styled-input agile-styled-input-top">
								<input type="text" placeholder="First Name" id="txtFirstName"
									name="Name" required="">
							</div>
							<div class="styled-input agile-styled-input-top">
								<input type="text" placeholder="Last Name" id="txtLastName"
									name="txtLastName" required="">
							</div>
							<div class="styled-input agile-styled-input-top">
								<input type="text" placeholder="Contact Number"
									id="txtContactNumber" name="txtContactNumber" required="">
							</div>
							<div class="styled-input">
								<input type="email" placeholder="E-mail" id="txtEmailAddress"
									name="Email" required="">
							</div>
							<div class="styled-input">
								<input type="password" placeholder="Password" name="password"
									id="password1" required="">
							</div>
							<div class="styled-input">
								<input type="password" placeholder="Confirm Password"
									name="Confirm Password" id="password2" required="">
							</div>
							<div class="styled-input agile-styled-input-top">
								<input type="text" placeholder="Shipping Address"
									id="txtShippingAddress" name="txtShippingAddress" required="">
							</div>
							<input type="button" onclick="RegisterCustomer()" value="Sign Up">
						</form>
						<p>
							<a href="#">By clicking register, I agree to your terms</a>
						</p>
					</div>
				</div>
			</div>
			<!-- //Modal content-->
		</div>
	</div>
	<!-- //Modal2 -->
	<!-- //signup Model -->
	<!-- //header-bot -->
	<!-- navigation -->

	<!-- //navigation -->
	<!-- banner -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators-->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1" class=""></li>
			<li data-target="#myCarousel" data-slide-to="2" class=""></li>
			<li data-target="#myCarousel" data-slide-to="3" class=""></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="container">
					<div class="carousel-caption">
						<h3>
							Big <span>Save</span>
						</h3>
						<p>
							Get flat <span>10%</span> Cashback

						</p>
					</div>
				</div>
			</div>
			<div class="item item2">
				<div class="container">
					<div class="carousel-caption">
						<h3>
							Healthy <span>Saving</span>
						</h3>
						<p>
							Get Upto <span>30%</span> Off
						</p>

					</div>
				</div>
			</div>
			<div class="item item3">
				<div class="container">
					<div class="carousel-caption">
						<h3>
							Big <span>Deal</span>
						</h3>
						<p>
							Get Best Offer Upto <span>20%</span>
						</p>

					</div>
				</div>
			</div>
			<div class="item item4">
				<div class="container">
					<div class="carousel-caption">
						<h3>
							Today <span>Discount</span>
						</h3>
						<p>
							Get Now <span>40%</span> Discount
						</p>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- //banner -->

	<!-- copyright -->
	<div class="copy-right">
		<div class="container">
			<p>
				© 2017 Grocery Shoppy. All rights reserved | Design by <a
					href="http://w3layouts.com"> W3layouts.</a>
			</p>
		</div>
	</div>
	<!-- //copyright -->

	<!-- js-files -->
	<!-- jquery -->
	<script src="js/jquery-2.1.4.min.js"></script>

	<script type="text/javascript" src="js/jquery.toast.js"></script>

	<!-- //jquery -->

	<!-- popup modal (for signin & signup)-->
	<script src="js/jquery.magnific-popup.js"></script>
	<script>
		$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
				type : 'inline',
				fixedContentPos : false,
				fixedBgPos : true,
				overflowY : 'auto',
				closeBtnInside : true,
				preloader : false,
				midClick : true,
				removalDelay : 300,
				mainClass : 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- Large modal -->
	<!-- <script>
		$('#').modal('show');
	</script> -->
	<!-- //popup modal (for signin & signup)-->

	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
		paypalm.minicartk.render(); //use only unique class names other than paypalm.minicartk.Also Replace same class name in css and minicart.min.js

		paypalm.minicartk.cart
				.on(
						'checkout',
						function(evt) {
							var items = this.items(), len = items.length, total = 0, i;

							// Count the number of each item in the cart
							for (i = 0; i < len; i++) {
								total += items[i].get('quantity');
							}

							if (total < 3) {
								alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
								evt.preventDefault();
							}
						});
	</script>
	<!-- //cart-js -->

	<!-- price range (top products) -->
	<script src="js/jquery-ui.js"></script>
	<script>
		//<![CDATA[ 
		$(window).load(
				function() {
					$("#slider-range").slider(
							{
								range : true,
								min : 0,
								max : 9000,
								values : [ 50, 6000 ],
								slide : function(event, ui) {
									$("#amount").val(
											"$" + ui.values[0] + " - $"
													+ ui.values[1]);
								}
							});
					$("#amount").val(
							"$" + $("#slider-range").slider("values", 0)
									+ " - $"
									+ $("#slider-range").slider("values", 1));

				}); //]]>
	</script>
	<!-- //price range (top products) -->

	<!-- flexisel (for special offers) -->
	<script src="js/jquery.flexisel.js"></script>
	<script>
		$(window).load(function() {
			$("#flexiselDemo1").flexisel({
				visibleItems : 3,
				animationSpeed : 1000,
				autoPlay : true,
				autoPlaySpeed : 3000,
				pauseOnHover : true,
				enableResponsiveBreakpoints : true,
				responsiveBreakpoints : {
					portrait : {
						changePoint : 480,
						visibleItems : 1
					},
					landscape : {
						changePoint : 640,
						visibleItems : 2
					},
					tablet : {
						changePoint : 768,
						visibleItems : 2
					}
				}
			});

		});
	</script>
	<!-- //flexisel (for special offers) -->

	<!-- password-script -->
	<script>
		window.onload = function() {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity(
						"Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}

		function RegisterCustomer() {

			var txtFirstName = document.getElementById('txtFirstName').value;
			var txtLastName = document.getElementById('txtLastName').value;
			var txtEmailAddress = document.getElementById('txtEmailAddress').value;
			var txtPassword = document.getElementById('password1').value;
			var txtContactNumber = document.getElementById('txtContactNumber').value;
			var txtShippingAddress = document
					.getElementById('txtShippingAddress').value;

			var validationMsg = "";
			if (txtFirstName.trim() === "") {
				validationMsg += "- Must provide First Name<br/>";
			}

			if (txtLastName.trim() === "") {
				validationMsg += "- Must provide Last Name<br/>";
			}

			if (txtEmailAddress.trim() === "") {
				validationMsg += "- Must provide Email Address<br/>";
			}

			if (txtPassword.trim() === "") {
				validationMsg += "- Must provide Password<br/>";
			}

			if (txtContactNumber.trim() === "") {
				validationMsg += "- Must provide Contact Number<br/>";
			}

			if (txtShippingAddress.trim() === "") {
				validationMsg += "- Must provide Shipping Address";
			}

			if (validationMsg.trim() === "") {
				$.ajax({
					url : 'SignUp',
					data : {
						"firstName" : txtFirstName,
						"lastName" : txtLastName,
						"emailAddress" : txtEmailAddress,
						"password" : txtPassword,
						"contactNumber" : txtContactNumber,
						"shippingAddress" : txtShippingAddress
					},
					type : 'post',
					cache : false,
					success : function(data) {
						//alert(data);
						//$('#somediv').text(responseText);

						$('#myModal2').modal('toggle');

						$.toast({
							heading : 'Success',
							text : 'Account has been successfully created!',
							position : 'top-right',
							icon : 'success'
						});

					},
					error : function() {
						alert('error');
					}
				});
			} else {
				$.toast({
					heading : ':(',
					text : validationMsg,
					position : 'top-right',
					icon : 'error'
				});
			}
		}
	</script>
	<!-- //password-script -->

	<!-- smoothscroll -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smoothscroll -->

	<!-- start-smooth-scrolling -->
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->

	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});

		function LoginUser() {
			var email = document.getElementById('txtEmail').value;
			var password = document.getElementById('txtPassword').value;

			var validationMsg = "";
			if (email === "") {
				validationMsg += "- Provide Email Address<br/>";
			}
			if (password === "") {
				validationMsg += "- Provide Password";
			}

			if (validationMsg === "") {
				$.ajax({
					url : 'PerformLogin',
					data : {
						"email" : email,
						"password" : password
					},
					type : 'post',
					cache : false,
					success : function(data) {
						if (data.trim() === "NoUserRecordFound!") {
							$.toast({
								heading : ':(',
								text : 'Bad user name or password, try again!',
								position : 'top-right',
								icon : 'error'
							});
						} else if (data.trim() === "verifyUser!") {
							window.location.href = "VerifyCustomerAcc.jsp";
						} else {
							window.location.href = data;
						}
					},
					error : function() {
						alert('error');
					}
				});
			} else {

				$.toast({
					heading : ':(',
					text : validationMsg,
					position : 'top-right',
					icon : 'error'
				});
			}

		}
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->
</body>
</html>