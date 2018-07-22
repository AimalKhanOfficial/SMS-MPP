<%@page import="com.SMS.controller.CategoriesIndex"%>
<%@page import="com.SMS.controller.ProductsIndex"%>
<%@page import="com.SMS.controller.GetAdminDashboardStats"%>
<%@page import="com.SMS.utility.SessionAttributes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive
	Web Template | Contact Us :: w3layouts</title>
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
<link rel="stylesheet"
	href="bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

<style type="text/css">
.dynamicTile .col-sm-2.col-xs-4 {
	padding: 5px;
}

.dynamicTile .col-sm-4.col-xs-8 {
	padding: 5px;
}

#tile1 {
	background: rgb(0, 172, 238);
}

#tile2 {
	background: rgb(243, 243, 243);
}

#tile3 {
	background: rgb(71, 193, 228);
}

#tile4 {
	background-image:
		url('http://handsontek.net/demoimages/tiles/facebook.png');
	background-size: cover;
}

#tile5 {
	background: rgb(175, 26, 63);
}

#tile6 {
	background: rgb(62, 157, 215);
}

#tile7 {
	background: white;
}

#tile8 {
	background: rgb(209, 70, 37);
}

#tile9 {
	background: rgb(0, 142, 0);
}

#tile10 {
	background: rgb(0, 93, 233);
}

.tilecaption {
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	margin: 0 !important;
	text-align: center;
	color: white;
	font-family: Segoe UI;
	font-weight: lighter;
}

.custom {
	color: #fff;
}

<!--
This is for email-->.inbox .inbox-menu ul {
	margin-top: 30px;
	padding: 0;
	list-style: none
}

.inbox .inbox-menu ul li {
	height: 30px;
	padding: 5px 15px;
	position: relative
}

.inbox .inbox-menu ul li:hover,.inbox .inbox-menu ul li.active {
	background: #e4e5e6
}

.inbox .inbox-menu ul li.title {
	margin: 20px 0 -5px 0;
	text-transform: uppercase;
	font-size: 10px;
	color: #d1d4d7
}

.inbox .inbox-menu ul li.title:hover {
	background: 0 0
}

.inbox .inbox-menu ul li a {
	display: block;
	width: 100%;
	text-decoration: none;
	color: #3d3f42
}

.inbox .inbox-menu ul li a i {
	margin-right: 10px
}

.inbox .inbox-menu ul li a .label {
	position: absolute;
	top: 10px;
	right: 15px;
	display: block;
	min-width: 14px;
	height: 14px;
	padding: 2px
}

.inbox ul.messages-list {
	list-style: none;
	margin: 15px -15px 0 -15px;
	padding: 15px 15px 0 15px;
	border-top: 1px solid #d1d4d7
}

.inbox ul.messages-list li {
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	cursor: pointer;
	margin-bottom: 10px;
	padding: 10px
}

.inbox ul.messages-list li a {
	color: #3d3f42
}

.inbox ul.messages-list li a:hover {
	text-decoration: none
}

.inbox ul.messages-list li.unread .header,.inbox ul.messages-list li.unread .title
	{
	font-weight: 700
}

.inbox ul.messages-list li:hover {
	background: #e4e5e6;
	border: 1px solid #d1d4d7;
	padding: 9px
}

.inbox ul.messages-list li:hover .action {
	color: #d1d4d7
}

.inbox ul.messages-list li .header {
	margin: 0 0 5px 0
}

.inbox ul.messages-list li .header .from {
	width: 49.9%;
	white-space: nowrap;
	overflow: hidden !important;
	text-overflow: ellipsis
}

.inbox ul.messages-list li .header .date {
	width: 50%;
	text-align: right;
	float: right
}

.inbox ul.messages-list li .title {
	margin: 0 0 5px 0;
	white-space: nowrap;
	overflow: hidden !important;
	text-overflow: ellipsis
}

.inbox ul.messages-list li .description {
	font-size: 12px;
	padding-left: 29px
}

.inbox ul.messages-list li .action {
	display: inline-block;
	width: 16px;
	text-align: center;
	margin-right: 10px;
	color: #d1d4d7
}

.inbox ul.messages-list li .action .fa-check-square-o {
	margin: 0 -1px 0 1px
}

.inbox ul.messages-list li .action .fa-square {
	float: left;
	margin-top: -16px;
	margin-left: 4px;
	font-size: 11px;
	color: #fff
}

.inbox ul.messages-list li .action .fa-star.bg {
	float: left;
	margin-top: -16px;
	margin-left: 3px;
	font-size: 12px;
	color: #fff
}

.inbox .message .message-title {
	margin-top: 30px;
	padding-top: 10px;
	font-weight: 700;
	font-size: 14px
}

.inbox .message .header {
	margin: 20px 0 30px 0;
	padding: 10px 0 10px 0;
	border-top: 1px solid #d1d4d7;
	border-bottom: 1px solid #d1d4d7
}

.inbox .message .header .avatar {
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	height: 34px;
	width: 34px;
	float: left;
	margin-right: 10px
}

.inbox .message .header i {
	margin-top: 1px
}

.inbox .message .header .from {
	display: inline-block;
	width: 50%;
	font-size: 12px;
	margin-top: -2px;
	color: #d1d4d7
}

.inbox .message .header .from span {
	display: block;
	font-size: 14px;
	font-weight: 700;
	color: #3d3f42
}

.inbox .message .header .date {
	display: inline-block;
	width: 29%;
	text-align: right;
	float: right;
	font-size: 12px;
	margin-top: 18px
}

.inbox .message .attachments {
	border-top: 3px solid #e4e5e6;
	border-bottom: 3px solid #e4e5e6;
	padding: 10px 0;
	margin-bottom: 20px;
	font-size: 12px
}

.inbox .message .attachments ul {
	list-style: none;
	margin: 0 0 0 -40px
}

.inbox .message .attachments ul li {
	margin: 10px 0
}

.inbox .message .attachments ul li .label {
	padding: 2px 4px
}

.inbox .message .attachments ul li span.quickMenu {
	float: right;
	text-align: right
}

.inbox .message .attachments ul li span.quickMenu .fa {
	padding: 5px 0 5px 25px;
	font-size: 14px;
	margin: -2px 0 0 5px;
	color: #d1d4d7
}

.inbox .contacts ul {
	margin-top: 30px;
	padding: 0;
	list-style: none
}

.inbox .contacts ul li {
	height: 30px;
	padding: 5px 15px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis !important;
	position: relative;
	cursor: pointer
}

.inbox .contacts ul li .label {
	display: inline-block;
	width: 6px;
	height: 6px;
	padding: 0;
	margin: 0 5px 2px 0
}

.inbox .contacts ul li:hover {
	background: #e4e5e6
}
</style>
</head>
<body>

	<%
		if (session.getAttribute(SessionAttributes.FirstName.toString()) == null) {
	%>
	<script type="text/javascript">
		window.location.href = "index.jsp";
	</script>
	<%
		}
	%>

	<%
		if (session.getAttribute(SessionAttributes.UserType_ID.toString())
				.equals("2")) {
	%>
	<script type="text/javascript">
		window.location.href = "CustomerDashboard.jsp";
	</script>
	<%
		}
	%>

	<%
		String firstName = (String) request.getSession().getAttribute(
				SessionAttributes.FirstName.toString());
		String lastName = (String) request.getSession().getAttribute(
				SessionAttributes.LastName.toString());

		int userId = Integer.parseInt(request.getSession()
				.getAttribute(SessionAttributes.UserID.toString())
				.toString());

		int categoryId = Integer.parseInt(request.getSession()
				.getAttribute(SessionAttributes.CategoryId.toString())
				.toString());
	%>


	<!-- top-header -->
	<div class="header-most-top">

		<div class="row">

			<div class="col-sm-8">
				<p>Online Shopping Management System (SMS)</p>
			</div>


			<p><%=firstName%>
				<%=lastName%>
				| <a href="#" onclick="LogOut()">Log Out</a>
			</p>

		</div>
	</div>

	<!-- top Products -->
	<div class="ads-grid">
		<div class="container dynamicTile">
			<div class="row ">
				<div class="col-sm-4 col-xs-4">
					<div id="tile1" class="tile">
						<div class="carousel slide" data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<div class="text-center"
										style="height: 200px; width: 560px; background-color: #0AFC70;">
										<div style="font-size: 150px;">
											<span class="glyphicon glyphicon-comment custom"></span>
										</div>
										<div style="margin-left: 5px; margin-top: 6px;"
											class="text-left custom">
											<h3>
												Submitted Reviews:
												<%=GetAdminDashboardStats.getNumberOfCustomerReviews()%></h3>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="text-center"
										style="height: 200px; width: 560px; background-color: #76D7C4;">
										<div style="font-size: 150px;">
											<span class="glyphicon glyphicon-question-sign custom"></span>
										</div>
										<div style="margin-left: 5px; margin-top: 6px;"
											class="text-left custom">
											<h3>
												Customer Queries:
												<%=GetAdminDashboardStats.getCustomerQueries()%></h3>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="col-sm-4 col-xs-4">
					<div id="tile2" class="tile">

						<div class="carousel slide" data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<div class="text-center"
										style="height: 200px; width: 560px; background-color: #A569BD;">
										<div style="font-size: 150px;">
											<span class="glyphicon glyphicon-user custom"></span>
										</div>
										<div style="margin-left: 5px; margin-top: 6px;"
											class="text-left custom">
											<h3>
												Registered Users:
												<%=GetAdminDashboardStats.getCustomersCount()%></h3>
										</div>
									</div>

								</div>
								<div class="item" onclick="RedirectToProducts();">
									<div class="text-center"
										style="height: 200px; width: 560px; background-color: #F1C40F;">
										<div style="font-size: 150px;">
											<span class="glyphicon glyphicon-shopping-cart custom"></span>
										</div>
										<div style="margin-left: 5px; margin-top: 6px;"
											class="text-left custom">
											<h3>
												Total Products :
												<%=ProductsIndex.getProducts().size()%></h3>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="col-sm-4 col-xs-4">
					<div id="tile3" class="tile">
						<div class="carousel slide" data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active" onclick="RedirectToCategories();">
									<div class="text-center"
										style="height: 200px; width: 560px; background-color: #1accfd;">
										<div style="font-size: 150px;">
											<span class="glyphicon glyphicon-list-alt custom"></span>
										</div>
										<div style="margin-left: 5px; margin-top: 6px;"
											class="text-left custom">
											<h3>
												Total Categories:
												<%=CategoriesIndex.getCategories().size()%></h3>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="text-center"
										style="height: 200px; width: 560px; background-color: #EC7063;">
										<div style="font-size: 150px;">
											<span class="glyphicon glyphicon-envelope custom"></span>
										</div>
										<div style="margin-left: 5px; margin-top: 6px;"
											class="text-left custom">
											<h3>
												Offer Subscriptions:
												<%=GetAdminDashboardStats.getNumberOfSubscriptions()%></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<br />
			<hr />
			<div class="col-md-2"></div>


			<!-- /.col -->
			<div class="col-md-9">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Let customers know of new offer</h3>
						<br />
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="form-group">
							<textarea id="compose-textarea" class="form-control"
								style="height: 300px">
                      
                    </textarea>
						</div>

					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="pull-right">
							<button onclick="Send();" type="submit" class="btn btn-primary">
								<i class="fa fa-envelope-o"></i> Send
							</button>
						</div>
					</div>
					<!-- /.box-footer -->
				</div>
				<!-- /. box -->
			</div>
			<!-- /.col -->
			<br />
			<hr />
			<div class="col-md-2"></div>
		</div>

	</div>



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
			//document.getElementById("password1").onchange = validatePassword;
			//document.getElementById("password2").onchange = validatePassword;
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
				validationMsg += "- Provide Email Address<br/>"
			}
			if (password === "") {
				validationMsg += "- Provide Password"
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

	<script type="text/javascript">
		function ShowProductDetails(prodId) {

			$.ajax({
				url : 'GetProductDetails',
				data : {
					"ProductId" : prodId
				},
				type : 'post',
				cache : false,
				success : function(data) {
					if (data.trim() === "AllSet!") {
						window.location.href = "ProductDetails.jsp";
					} else if (data.trim() === "SessionTimeOut!") {
						window.location.href = "index.jsp";
					}
				},
				error : function() {
					alert('error');
				}
			});
		}

		function LogOut() {
			$.ajax({
				url : 'LogoutUser',
				data : {},
				type : 'post',
				cache : false,
				success : function(data) {
					window.location.href = "index.jsp";
				},
				error : function() {
					alert('error');
				}
			});
		}

		function SubscribeUserToOfferNotifications(userId, fName, lName) {
			alert('here');
			var fullName = fName + ' ' + lName;

			$
					.ajax({
						url : 'OfferSubscription',
						data : {
							"userId" : userId,
							"fullName" : fullName
						},
						type : 'post',
						cache : false,
						success : function(data) {
							if (data.trim() === 'success') {
								$
										.toast({
											heading : ':)',
											text : 'You will recieve offer notifications on your email!',
											position : 'top-right',
											icon : 'success'
										});

								setTimeout(function() {
									location.reload();
								}, 3000);

							} else {
								$.toast({
									heading : ':(',
									text : 'Some went wrong, try again later!',
									position : 'top-right',
									icon : 'error'
								});
							}
						},
						error : function() {
							alert('error');
						}
					});
		}

		function ConfirmSubscription() {
			$('#mySubsciprionConfirmationModal').modal('show');
		}

		function RedirectToProducts() {
			window.location.href = "Products.jsp";
		}

		function RedirectToCategories() {
			window.location.href = "Categories.jsp";
		}
	</script>

	<script src="bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<!-- Page Script -->
	<script>
		$(function() {
			//Add text editor
			$("#compose-textarea").wysihtml5();
		});

		function Send() {
			var emailtext = $('iframe').contents().find('.wysihtml5-editor')
					.html();
			if (emailtext === "") {
				$.toast({
					heading : ':(',
					text : 'You cannot send empty text to customers!',
					position : 'top-right',
					icon : 'error'
				});
			} else {
				$
						.ajax({
							url : 'NotifyUsersForOffer',
							data : {
								"emailtext" : emailtext
							},
							type : 'post',
							cache : false,
							success : function(data) {
								if (data.trim() === 'success') {
									$
											.toast({
												heading : ':)',
												text : 'Your offer has been sent to subscribed Customers!',
												position : 'top-right',
												icon : 'success'
											});

									$('iframe').contents().find('.wysihtml5-editor')
									.html("");

								} else {
									$
											.toast({
												heading : ':(',
												text : 'Some went wrong, try again later!',
												position : 'top-right',
												icon : 'error'
											});
								}
							},
							error : function() {
								alert('error');
							}
						});
			}
		}
	</script>
</body>
</html>