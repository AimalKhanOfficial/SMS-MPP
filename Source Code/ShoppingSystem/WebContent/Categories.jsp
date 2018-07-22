<%@page import="com.SMS.utility.SessionAttributes"%>
<%@page import="com.SMS.controller.CategoriesIndex"%>
<%@page import="com.SMS.biz.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">

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
<%ArrayList<Category> categories = CategoriesIndex.getCategories();%>
	
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

<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/buttons.dataTables.min.css">

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
		if (session.getAttribute(SessionAttributes.UserType_ID.toString()).equals("2")) {
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
	<!-- contact page -->
	<div class="contact-w3l">
		<div class="container">

			<div class="text-right">
				<button onclick="AddCategory()" class="btn btn-info">
					<span class="glyphicon glyphicon-plus"></span> Add Category
				</button>
			</div>

			<br /> <br />
			<table id="example" class="display nowrap" cellspacing="0"
				width="100%">
				<thead>
					<tr>
						<th>Category ID</th>
						<th>Category</th>
						<th>Action</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>Category ID</th>
						<th>Category</th>
						<th>Action</th>
					</tr>
				</tfoot>
				<tbody>

					<%
						for(Category cat : categories) {
					%>
					<tr>
						<td><%=cat.getCategoryID()%></td>
						<td><%=cat.getCategory()%></td>
						<td><button class="btn btn-warning" type="button"
								onclick="EditCategory('<%=cat.getCategoryID()%>', '<%=cat.getCategory()%>')">
								<span class="glyphicon glyphicon-pencil"></span>
							</button>
							<button type="button"
								onclick="DisableCategory('<%=cat.getCategoryID()%>')"
								class="btn btn-danger">
								<span class="glyphicon glyphicon-trash"></span>
							</button></td>
					</tr>
					<%
						}
					%>



				</tbody>
			</table>


			<!-- Bootstrap Modals - Aimal Khan - MUM -->
			<div id="myCategoryDisableConfirmationModal" class="modal fade"
				role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #1accfd; color: white;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Delete Confirmation</h4>
						</div>
						<input type="text" id="txtCategoryId" style="display: none;" />
						<div class="modal-body">
							<p>Do you really want to delete this Category?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger"
								onclick="DisableCategoryFinalConfirmation()">Yes</button>
							<button type="button" class="btn btn-success"
								data-dismiss="modal">No, Close</button>
						</div>
					</div>

				</div>
			</div>

			<div id="myCategoryAddUpdateModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #1accfd; color: white;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Category Management</h4>
						</div>
						<input type="text" id="txtUpdateAddCategoryId"
							style="display: none;" />
						<!-- 1 means Add, 2 means Update -->
						<input type="text" id="txtUpdateAddOperation"
							style="display: none;" />
						<div class="modal-body">
							Do you want to add/update this category? <br /> <br /> <input
								type="text" class="form-control" id="txtCategoryName" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								onclick="AddUpdateCategory()">Yes</button>
							<button type="button" class="btn btn-info" data-dismiss="modal">No,
								Close</button>
						</div>
					</div>

				</div>
			</div>

			<!-- bootstrap modals ends here -->

		</div>
	</div>

	<!-- footer -->
	<footer>
	<div class="container"></div>
	</footer>
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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.buttons.min.js"></script>
	<script src="js/buttons.flash.min.js"></script>
	<script src="js/jszip.min.js"></script>
	<script src="js/pdfmake.min.js"></script>
	<script src="js/vfs_fonts.js"></script>
	<script src="js/buttons.html5.min.js"></script>
	<script src="js/buttons.print.min.js"></script>


	<!-- //jquery -->
	<script type="text/javascript" src="js/jquery.toast.js"></script>
	<!-- popup modal (for signin & signup)-->
	<script src="js/jquery.magnific-popup.js"></script>
	<script>
		function AddCategory() {
			document.getElementById('txtUpdateAddCategoryId').value = "";
			document.getElementById('txtUpdateAddOperation').value = "ADD";
			document.getElementById('txtCategoryName').value = "";
			$('#myCategoryAddUpdateModal').modal('show');
		}

		function EditCategory(categoryId, catogoryName) {
			document.getElementById('txtUpdateAddCategoryId').value = categoryId;
			document.getElementById('txtUpdateAddOperation').value = "UPDATE";
			document.getElementById('txtCategoryName').value = catogoryName;
			$('#myCategoryAddUpdateModal').modal('show');
		}

		function AddUpdateCategory() {
			var categoryName = document.getElementById('txtCategoryName').value;
			var operationType = document
					.getElementById('txtUpdateAddOperation').value;

			if (operationType === "UPDATE") {
				var categoryId = document
						.getElementById('txtUpdateAddCategoryId').value;

				if (categoryName.length < 1) {
					$.toast({
						heading : 'Success',
						text : "Enter valid category name!",
						position : 'top-right',
						icon : 'error'
					});
					return;
				} else {

					$
							.ajax({
								url : 'UpdateCategory',
								data : {
									"categoryId" : categoryId,
									"categoryName" : categoryName
								},
								type : 'post',
								cache : false,
								success : function(data) {
									$
											.toast({
												heading : 'Success',
												text : "Category has been successfully edited!",
												position : 'top-right',
												icon : 'success'
											});

									setTimeout(function() {

										location.reload();

									}, 4000);

								},
								error : function() {
									alert('error');
								}
							});

				}

			} else {
				if (categoryName.length < 1) {
					$.toast({
						heading : 'Success',
						text : "Enter valid category name!",
						position : 'top-right',
						icon : 'error'
					});
					return;
				} else {

					$.ajax({
						url : 'CreateCategory',
						data : {
							"categoryName" : categoryName
						},
						type : 'post',
						cache : false,
						success : function(data) {
							$.toast({
								heading : 'Success',
								text : "Category has been successfully added!",
								position : 'top-right',
								icon : 'success'
							});

							setTimeout(function() {

								location.reload();

							}, 4000);

						},
						error : function() {
							alert('error');
						}
					});
				}
			}

		}

		function DisableCategory(categoryId) {
			//alert(categoryId);
			document.getElementById('txtCategoryId').value = categoryId;
			$('#myCategoryDisableConfirmationModal').modal('show');
		}

		function DisableCategoryFinalConfirmation() {
			var txtcategoryId = document.getElementById('txtCategoryId').value;

			$.ajax({
				url : 'DisableCategory',
				data : {
					"categoryId" : txtcategoryId
				},
				type : 'post',
				cache : false,
				success : function(data) {

					$.toast({
						heading : 'Success',
						text : "Category has been successfully deleted!",
						position : 'top-right',
						icon : 'success'
					});

					setTimeout(function() {

						location.reload();

					}, 4000);

				},
				error : function() {
					alert('error');
				}
			});

		}

		$(document).ready(function() {
			$('#example').DataTable({
				dom : 'Bfrtip',
				buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]
			});
		});

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

		function contactAdmin() {
			var txtMessage = document.getElementById('txtMessage').value;

			$
					.ajax({
						url : 'ContactAdmin',
						data : {
							"query" : txtMessage
						},
						type : 'post',
						cache : false,
						success : function(data) {

							$
									.toast({
										heading : 'Success',
										text : "Query has been successfully submitted! We'll get in touch with you soon!",
										position : 'top-right',
										icon : 'success'
									});

							setTimeout(function() {
							}, 2000);

							location.reload();

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
		
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->
	
</body>

</html>