<%@page import="com.SMS.biz.CustomerReview"%>
<%@page import="com.SMS.controller.ParticularProductDetails"%>
<%@page import="com.SMS.biz.ProductImage"%>
<%@page import="com.SMS.controller.GetProductDetails"%>
<%@page import="com.SMS.controller.ProductsIndex"%>
<%@page import="com.SMS.biz.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.SMS.utility.SessionAttributes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">

<head>
<title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive
	Web Template | Single :: w3layouts</title>

<style type="text/css">
.btn-grey {
	background-color: #D8D8D8;
	color: #FFF;
}

.rating-block {
	background-color: #FAFAFA;
	border: 1px solid #EFEFEF;
	padding: 15px 15px 20px 15px;
	border-radius: 3px;
}

.bold {
	font-weight: 700;
}

.padding-bottom-7 {
	padding-bottom: 7px;
}

.review-block {
	background-color: #FAFAFA;
	border: 1px solid #EFEFEF;
	padding: 15px;
	border-radius: 3px;
	margin-bottom: 15px;
}

.review-block-name {
	font-size: 12px;
	margin: 10px 0;
}

.review-block-date {
	font-size: 12px;
}

.review-block-rate {
	font-size: 13px;
	margin-bottom: 15px;
}

.review-block-title {
	font-size: 15px;
	font-weight: 700;
	margin-bottom: 10px;
}
</style>

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
<!-- flexslider -->
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<!-- fonts -->
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"
	rel="stylesheet">
<link rel="stylesheet" href="css/jquery.toast.css">
</head>

<body>


	<%
		if (session.getAttribute(SessionAttributes.FirstName.toString()) == null || session.getAttribute(SessionAttributes.ProductId.toString()) == null) {
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
			String prodId = (String) session.getAttribute(
			SessionAttributes.ProductId.toString());
	%>


	<%
		Product products = ParticularProductDetails.GetProductDetailsFinal(prodId);
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

	<!-- //page -->
	<!-- Single Page -->
	<div class="banner-bootom-w3-agileits">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">
				Product Details <span class="heading-style"> <i></i> <i></i>
					<i></i>
				</span>
			</h3>
			<!-- //tittle heading -->
			<div class="col-md-5 single-right-left ">
				<div class="grid images_3_of_2">
					<div class="flexslider">
						<ul class="slides">

							<%
								for(ProductImage productImage : products.getImages()){
							%>
							<li data-thumb="images/<%=productImage.getImageURL()%>">
								<div class="thumb-image">
									<img src="images/<%=productImage.getImageURL()%>"
										data-imagezoom="true" class="img-responsive" alt="">
								</div>
							</li>
							<%
								}
							%>


						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="col-md-7 single-right-left simpleCart_shelfItem">
				<h3><%=products.getName()%></h3>

				<p>
					<span class="item_price">$<%=products.getPrice()%></span> <label>Free
						delivery</label>
				</p>
				<div class="single-infoagile">
					<ul>
						<li>Cash on Delivery Eligible.</li>
						<li>Shipping Speed to Delivery.</li>
						<li>1 offer from <span class="item_price">$<%=products.getPrice()%></span>
						</li>
					</ul>
				</div>
				<div class="product-single-w3l">
					<ul>
						<li>$<%=products.getDescription()%></li>
					</ul>
					<p>
						<i class="fa fa-refresh" aria-hidden="true"></i>All food products
						are <label>non-returnable.</label>
					</p>
				</div>
<%-- 				<div class="occasion-cart">
					<div
						class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
						<form action="#" method="post">
							<fieldset>
								<input type="hidden" name="cmd" value="_cart" /> <input
									type="hidden" name="add" value="1" /> <input type="hidden"
									name="business" value=" " /> <input type="hidden"
									name="item_name" value="<%=products.getName()%>" /> <input
									type="hidden" name="amount" value="$<%=products.getPrice()%>" />
								<input type="hidden" name="discount_amount" value="0.00" /> <input
									type="hidden" name="currency_code" value="USD" /> <input
									type="hidden" name="return" value=" " /> <input type="hidden"
									name="cancel_return" value=" " /> <input type="submit"
									name="submit" value="Add to cart" class="button" />
							</fieldset>
						</form>
					</div>

				</div> --%>

			</div>
			<div class="clearfix"></div>

			<br /> <br />
			<h3 class="tittle-w3l">
				Tell us what you think <span class="heading-style"> <i></i> <i></i>
					<i></i>
				</span>
			</h3>

			<div class="row">
				<div class="col-sm-12">
					<div class="review-block">

						<div>
							<textarea rows="4" cols="113" id="txtCustomerReviewText"
								placeholder="Share your experience with this product"></textarea>
							<br /> <br />
							<div class="text-right">
								<input type="button" onclick="AddReview()" class="btn btn-info"
									value="Submit Review">
							</div>
						</div>

						<hr />

						<h3 class="tittle-w3l">
							Customer Reviews <span class="heading-style"> <i></i> <i></i>
								<i></i>
							</span>
						</h3>

						<br />

						<%
							for(CustomerReview customerReview : products.getCustomerReviews()) {
						%>
						<div class="row">
							<div class="col-sm-2">
								<img src="images/03a.png" class="img-rounded" width="150"
									height="150">
								<div class="text-center">
									<h3><%=customerReview.getUserDetails().getFirstName()%>
										<%=customerReview.getUserDetails().getLastName()%></h3>
										<br/>
										<div class="review-block-date">
									<%=customerReview.getCreatedAt()%></div>
								</div>
								
							</div>

							<div class="col-sm-9">
								<div class="review-block-description"><%=customerReview.getComment()%></div>
							</div>
						</div>
						<hr />
						<%
							}
						%>


					</div>
				</div>

			</div>
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
	<!-- //jquery -->
	<script type="text/javascript" src="js/jquery.toast.js"></script>
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
		paypalm.minicartk.render(); //use only unique class names other than paypal1.minicart1.Also Replace same class name in css and minicart.min.js

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
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- imagezoom -->
	<script src="js/imagezoom.js"></script>
	<!-- //imagezoom -->

	<!-- FlexSlider -->
	<script src="js/jquery.flexslider.js"></script>
	<script>
		// Can also be used with $(document).ready()
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				controlNav : "thumbnails"
			});
		});
	</script>
	<!-- //FlexSlider-->

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

		function AddReview() {

			var reviewText = document.getElementById("txtCustomerReviewText").value;

			if (reviewText === "") {
				$.toast({
					heading : ':(',
					text : "Must write some thing!",
					position : 'top-right',
					icon : 'error'
				});
			} else {
				$.ajax({
					url : 'CreateProductReview',
					data : {
						"reviewText" : reviewText, 
						"prodId" : <%=prodId%>
					},
					type : 'post',
					cache : false,
					success : function(data) {
						if (data.trim() === "success!") {
							$.toast({
								heading : ':)',
								text : "Your review has been posted!",
								position : 'top-right',
								icon : 'success'
							});

							setTimeout(function() {
								location.reload();
							}, 3000);
						} else if (data.trim() === "sessionTimeOut!") {
							window.location.href = "index.jsp";
						} else {
							$.toast({
								heading : ':(',
								text : "Something went wrong, try again!",
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
	<!-- //flexisel (for special offers) -->

	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->


</body>

</html>