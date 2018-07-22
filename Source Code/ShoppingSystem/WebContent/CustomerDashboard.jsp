<%@page import="com.SMS.controller.CategoriesIndex"%>
<%@page import="com.SMS.biz.Category"%>
<%@page import="com.SMS.controller.OfferSubscription"%>
<%@page import="com.SMS.controller.ProductsIndex"%>
<%@page import="com.SMS.biz.Product"%>
<%@page import="java.util.ArrayList"%>
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
		String firstName = (String) request.getSession().getAttribute(
		SessionAttributes.FirstName.toString());
		String lastName = (String) request.getSession().getAttribute(
		SessionAttributes.LastName.toString());
		
		int userId = Integer.parseInt(request.getSession().getAttribute(
		SessionAttributes.UserID.toString()).toString()); 
		
		int categoryId = Integer.parseInt(request.getSession().getAttribute(
				SessionAttributes.CategoryId.toString()).toString()); 
	%>

	<%
		ArrayList<Product> products = ProductsIndex.getProductsPerCategory(categoryId);
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
		<div class="container">

			<div class="text-right">
			
				<button onclick="Navigate()" class="btn btn-info">
					<span class="glyphicon glyphicon-pencil"></span> Contact Admin
				</button>
			
				<%
					if(OfferSubscription.checkIfSubscribedToNotifications(userId)){
				%>
				<button class="btn btn-success">
					<span class="glyphicon glyphicon-ok"></span> Subscribed to offers
					notifications
				</button>
				<%
					}else {
				%>
				<button class="btn btn-info" onclick="ConfirmSubscription()">
					<span class="glyphicon glyphicon-bullhorn"></span> Subscribe to
					offers notifications
				</button>
				<%
					}
				%>
			</div>
			
			<hr/>
			<%
				ArrayList<Category> categories = CategoriesIndex.getCategories();
			%>

			<!-- tittle heading -->
			<h3 class="tittle-w3l">
				Our Top Products <span class="heading-style"> <i></i> <i></i>
					<i></i>
				</span>
			</h3>
			<!-- product right -->
			<div class="agileinfo-ads-display col-md-12">
				<div class="wrapper">
					<!-- first section (nuts) -->
					<div class="product-sec1">

						<div class="row">

							<div class="col-sm-2">Choose Category:</div>
							<div class="col-sm-3">
								<select id="ddlCategory" class="form-control" onchange="loadProductsPerCategory(this.value)">
									<option value="0">All</option>
									<%
										for(Category cat : categories){
									%>
									<option value="<%=cat.getCategoryID()%>"><%=cat.getCategory()%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
						<hr/>
						<%
							for(Product prod : products) {
						%>
						<div class="col-md-4 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="images/<%=prod.getImages().get(0).getImageURL()%>"
										alt="" height="160" width="160">
									<div class="men-cart-pro">
										<div class="inner-men-cart-pro">
											<a href="#"
												onclick="ShowProductDetails('<%=prod.getProductID()%>')"
												class="link-product-add-cart">Quick View</a>
										</div>
									</div>
									<span class="product-new-top">New</span>

								</div>
								<div class="item-info-product ">
									<h4>
										<a href="#"><%=prod.getName()%></a>
									</h4>
									<div class="info-product-price">
										<span class="item_price">$<%=prod.getPrice()%></span>
									</div>
									<div
										class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
										<form action="#" method="post">
											<fieldset>
												<input type="hidden" name="cmd" value="_cart" /> <input
													type="hidden" name="add" value="1" /> <input type="hidden"
													name="business" value=" " /> <input type="hidden"
													name="item_name" value="<%=prod.getName()%>" /> <input
													type="hidden" name="amount" value="<%=prod.getPrice()%>" />
												<input type="hidden" name="discount_amount" value="0.00" />
												<input type="hidden" name="currency_code" value="USD" /> <input
													type="hidden" name="return" value=" " /> <input
													type="hidden" name="cancel_return" value=" " /> <input
													type="submit" name="submit" value="Add to cart"
													class="button" />
											</fieldset>
										</form>
									</div>

								</div>
							</div>
						</div>
						<%
							}
						%>
						<div class="clearfix"></div>
					</div>
					<!-- //fourth section (noodles) -->
				</div>
			</div>
			<!-- //product right -->
		</div>
	</div>

	<!-- Bootstrap Modals - Aimal Khan - MUM -->
	<div id="mySubsciprionConfirmationModal" class="modal fade"
		role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header"  style="background-color: #1accfd; color: white;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Subscription Confirmation</h4>
				</div>
				<input type="text" id="txtProductId" style="display: none;" />
				<div class="modal-body">
					<p>Are you sure you want to recieve offer notifications via
						Email?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						onclick="SubscribeUserToOfferNotifications('<%=userId%>', '<%=firstName%>','<%=lastName%>')">Yes</button>
					<button type="button" class="btn btn-info" data-dismiss="modal">No,
						Close</button>
				</div>
			</div>

		</div>
	</div>

	<!-- //footer -->
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
			//alert('here');
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
		
		function loadProductsPerCategory(categoryId){
			//alert(categoryId);
			$
			.ajax({
				url : 'SetCategoryForProducts',
				data : {
					"categoryId" : categoryId
				},
				type : 'post',
				cache : false,
				success : function(data) {
					
					if(data.trim()==="AllSet!"){
						location.reload();	
					}
					else {
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
		
		var element = document.getElementById('ddlCategory');
	    element.value = <%= categoryId%>;
	    
		function Navigate(){
			window.location.href = "ContactAdmin.jsp";	
		}
	</script>
</body>
</html>