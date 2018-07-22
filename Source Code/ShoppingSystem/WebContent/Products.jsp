<%@page import="com.SMS.utility.SessionAttributes"%>
<%@page import="com.SMS.controller.CategoriesIndex"%>
<%@page import="com.SMS.biz.Category"%>
<%@page import="com.SMS.utility.Utility"%>
<%@page import="com.SMS.biz.Product"%>
<%@page import="com.SMS.controller.ProductsIndex"%>
<%@page import="com.SMS.dataAccessLayer.Connector"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">

<head>

<style type="text/css">
.thumbnail {
	height: 100px;
	margin: 10px;
}

article {
	width: 80%;
	margin: auto;
	margin-top: 10px;
}
</style>

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
<%ArrayList<Product> products = ProductsIndex.getProducts();
  ArrayList<Category> categories = CategoriesIndex.getCategories();%>
	
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
				<button onclick="AddProduct()" class="btn btn-info">
					<span class="glyphicon glyphicon-plus"></span> Add Product
				</button>
			</div>

			<br /> <br />
			<table id="example" class="display nowrap" cellspacing="0"
				width="100%">
				<thead>
					<tr>
						<th>Product</th>
						<th>Name</th>
						<th>Price</th>
						<th>Available Quantity</th>
						<th>Category</th>
						<th>Action</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>Product</th>
						<th>Name</th>
						<th>Price</th>
						<th>Available Quantity</th>
						<th>Category</th>
						<th>Action</th>
					</tr>
				</tfoot>
				<tbody>

					<%
						for(Product prod : products) {
					%>
					<tr>
						<td><img height="60px" width="100px"
							src="images/<%=prod.getImages().get(0).getImageURL()%>" alt="" /></td>
						<td><%=prod.getName()%></td>
						<td><%=prod.getPrice()%></td>
						<td><%=prod.getQuantityAvailable()%></td>
						<td><%=prod.getCategoryName()%></td>


						<td>
							<button class="btn btn-warning" type="button"
								onclick="EditProduct('<%=prod.getProductID()%>', '<%=prod.getName()%>', '<%=prod.getDescription()%>', '<%=prod.getPrice()%>', '<%=prod.getQuantityAvailable()%>', '<%=prod.getCategoryName()%>')">
								<span class="glyphicon glyphicon-pencil"></span>
							</button>

							<button type="button" class="btn btn-danger"
								onclick="DisableProduct('<%=prod.getProductID()%>')">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>


			<!-- Bootstrap Modals - Aimal Khan - MUM -->
			<div id="myProductDisableConfirmationModal" class="modal fade"
				role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #1accfd; color: white;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Delete Confirmation</h4>
						</div>
						<input type="text" id="txtProductId" style="display: none;" />
						<div class="modal-body">
							<p>Do you really want to delete this Category?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger"
								onclick="DisableProductFinalConfirmation()">Yes</button>
							<button type="button" class="btn btn-success"
								data-dismiss="modal">No, Close</button>
						</div>
					</div>

				</div>
			</div>

			<div id="myProductAddModal" class="modal fade" role="dialog"
				data-keyboard="false" data-backdrop="static">
				<div class="modal-dialog  modal-lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #1accfd; color: white;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Product Management - Add</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-sm-6">
									<div class="col-sm-3">Category:</div>
									<div class="col-sm-9">
										<select id="ddlCategory" class="form-control">
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
								<div class="col-sm-6">
									<div class="col-sm-3">Name:</div>
									<div class="col-sm-9">
										<input type="text" id="txtProductName" class="form-control" />
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-sm-6">
									<div class="col-sm-3">Price:</div>
									<div class="col-sm-9">
										<input type="number" id="txtProductPrice" class="form-control" />
									</div>
								</div>
								<div class="col-sm-6">
									<div class="col-sm-3">Available Quantity:</div>
									<div class="col-sm-9">
										<input type="number" id="txtProductQuantity"
											class="form-control" />
									</div>
								</div>
							</div>
							<br />
							<div class="row">

								<div class="col-sm-6">
									<div class="col-sm-3">Description:</div>
									<div class="col-sm-9">
										<textarea id="txtDescription" rows="6" class="form-control"
											cols="95"></textarea>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="col-sm-3">3 Images:</div>
									<div class="col-sm-9">
										<input class="text-center" id="files" type="file" multiple />
									</div>
								</div>

							</div>

							<div id="result"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								onclick="AddProductFinal()">Yes</button>
							<button type="button" class="btn btn-info" data-dismiss="modal">No,
								Close</button>
						</div>
					</div>

				</div>
			</div>

			<!-- bootstrap modals ends here -->

			<div id="myProductUpdateModal" class="modal fade" role="dialog"
				data-keyboard="false" data-backdrop="static">
				<div class="modal-dialog  modal-lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #1accfd; color: white;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Product Management - Update</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<input style="display: none;" type="text"
									id="txtProductIdUpdate" class="form-control" />

								<div class="col-sm-6">
									<div class="col-sm-3">Category:</div>
									<div class="col-sm-9">
										<select id="ddlCategoryUpdate" class="form-control">
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
								<div class="col-sm-6">
									<div class="col-sm-3">Name:</div>
									<div class="col-sm-9">
										<input type="text" id="txtProductNameUpdate"
											class="form-control" />
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-sm-6">
									<div class="col-sm-3">Price:</div>
									<div class="col-sm-9">
										<input type="number" id="txtProductPriceUpdate"
											class="form-control" />
									</div>
								</div>
								<div class="col-sm-6">
									<div class="col-sm-3">Available Quantity:</div>
									<div class="col-sm-9">
										<input type="number" id="txtProductQuantityUpdate"
											class="form-control" />
									</div>
								</div>
							</div>
							<br />
							<div class="row">

								<div class="col-sm-6">
									<div class="col-sm-3">Description:</div>
									<div class="col-sm-9">
										<textarea id="txtDescriptionUpdate" rows="6"
											class="form-control" cols="95"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								onclick="UpdateProductFinal()">Yes</button>
							<button type="button" class="btn btn-info" data-dismiss="modal">No,
								Close</button>
						</div>
					</div>
				</div>
			</div>

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
		function AddProduct() {
			$('#myProductAddModal').modal('show');
		}

		function EditProduct(productId, name, desc, price, quantity, category) {
			document.getElementById("txtProductIdUpdate").value = productId;
			document.getElementById("txtProductNameUpdate").value = name;
			document.getElementById("txtProductPriceUpdate").value = price;
			document.getElementById("txtDescriptionUpdate").value = desc;
			document.getElementById("txtProductQuantityUpdate").value = quantity;

			var textToFind = category;

			var dd = document.getElementById('ddlCategoryUpdate');
			for (var i = 0; i < dd.options.length; i++) {
				if (dd.options[i].text === textToFind) {
					dd.selectedIndex = i;
					break;
				}
			}

			$('#myProductUpdateModal').modal('show');

		}

		function UpdateProductFinal() {
			var validationMessage = "";
			var productId = document.getElementById("txtProductIdUpdate").value;
			var productName = document.getElementById("txtProductNameUpdate").value;
			var productPrice = document.getElementById("txtProductPriceUpdate").value;
			var productQuantity = document.getElementById("txtProductQuantityUpdate").value;
			var productDesc = document.getElementById("txtDescriptionUpdate").value;

			if (productName === "") {
				validationMessage += "- Product Name is required</br>";
			}
			if (productPrice === "") {
				validationMessage += "- Product Price is required</br>";
			}
			if (productQuantity === "") {
				validationMessage += "- Product Quantity is required</br>";
			}
			if (productDesc === "") {
				validationMessage += "- Product Description is required</br>";
			}

			if (validationMessage === "") {
				//debugger;
				var e = document.getElementById("ddlCategoryUpdate");
				var ddlCategory = e.options[e.selectedIndex].value;				
				$
						.ajax({
							url : 'UpdateProduct',
							data : {
								"productId" : productId,
								"categoryId" : ddlCategory,
								"productName" : productName,
								"productPrice" : productPrice,
								"productQuantity" : productQuantity,
								"productDesc" : productDesc
							},
							type : 'post',
							cache : false,
							success : function(data) {

								if (data.trim() === 'Success') {
									$
											.toast({
												heading : 'Success',
												text : "Product has been updated!",
												position : 'top-right',
												icon : 'success'
											});

									setTimeout(function() {
										location.reload();
									}, 3000);

								} else {
									$
											.toast({
												heading : ':(',
												text : "We have encountered an issue, please try again later!",
												position : 'top-right',
												icon : 'error'
											});
								}

							},
							error : function() {
								alert('error');
							}
						});

			} else {
				$.toast({
					heading : ':(',
					text : validationMessage,
					position : 'top-right',
					icon : 'error'
				});
			}
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

		function DisableProduct(productId) {
			//alert(categoryId);
			document.getElementById('txtProductId').value = productId;
			$('#myProductDisableConfirmationModal').modal('show');
		}

		function DisableProductFinalConfirmation() {
			var txtProductId = document.getElementById('txtProductId').value;
			//alert(txtProductId);
			$.ajax({
				url : 'DisableProduct',
				data : {
					"txtProductId" : txtProductId
				},
				type : 'post',
				cache : false,
				success : function(data) {

					$.toast({
						heading : 'Success',
						text : "Product has been successfully deleted!",
						position : 'top-right',
						icon : 'success'
					});

					setTimeout(function() {

						location.reload();

					}, 3000);

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
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- Script for photos -->
	<script type="text/javascript">
		window.onload = function() {
			//Check File API support
			if (window.File && window.FileList && window.FileReader) {
				var filesInput = document.getElementById("files");
				filesInput
						.addEventListener(
								"change",
								function(event) {
									var files = event.target.files; //FileList object
									var output = document
											.getElementById("result");
									for (var i = 0; i < files.length; i++) {
										var file = files[i];
										//Only pics
										if (!file.type.match('image'))
											continue;
										var picReader = new FileReader();
										picReader
												.addEventListener(
														"load",
														function(event) {
															var picFile = event.target;
															var div = document
																	.createElement("div");
															div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                        "title='" + picFile.name + "'/>";
															output
																	.insertBefore(
																			div,
																			null);
														});
										//Read the image
										picReader.readAsDataURL(file);
									}

									//alert(output.innerHTML);
								});

			} else {
				console.log("Your browser does not support File API");
			}
		}

		function AddProductFinal() {
			var validationMessage = "";
			var productName = document.getElementById("txtProductName").value;
			var productPrice = document.getElementById("txtProductPrice").value;
			var productQuantity = document.getElementById("txtProductQuantity").value;
			var productDesc = document.getElementById("txtDescription").value;
			var productImages = document.getElementById("files");

			if (productName === "") {
				validationMessage += "- Product Name is required</br>";
			}
			if (productPrice === "") {
				validationMessage += "- Product Price is required</br>";
			}
			if (productQuantity === "") {
				validationMessage += "- Product Quantity is required</br>";
			}
			if (productDesc === "") {
				validationMessage += "- Product Description is required</br>";
			}
			if (productImages.value.length < 1) {
				validationMessage += "- Must attach atleast one image</br>";
			}

			if (validationMessage === "") {

				//debugger;
				var e = document.getElementById("ddlCategory");
				var ddlCategory = e.options[e.selectedIndex].value;

				var $imgs = $('img.thumbnail'), arr = [];

				//gets the base64
				$imgs.each(function() {
					arr.push($(this).attr('src').split(',')[1]);
				});

				debugger;
				console.log((JSON.stringify(arr)));

				debugger;

				$
						.ajax({
							url : 'CreateProduct',
							data : {
								"categoryId" : ddlCategory,
								"productName" : productName,
								"productPrice" : productPrice,
								"productQuantity" : productQuantity,
								"productDesc" : productDesc,
								"productImages" : JSON.stringify(arr)
							},
							type : 'post',
							cache : false,
							success : function(data) {

								if (data.trim() === 'Success') {
									$
											.toast({
												heading : 'Success',
												text : "Congrats, a new product has been added!",
												position : 'top-right',
												icon : 'success'
											});

									setTimeout(function() {
										location.reload();
									}, 3000);

								} else {
									$
											.toast({
												heading : ':(',
												text : "We have encountered an issue, please try again later!",
												position : 'top-right',
												icon : 'error'
											});
								}

							},
							error : function() {
								alert('error');
							}
						});

				/* console.log(arr.join('@---@@@---@ '));
				console.log('After'); */
				//console.log(arr);
				/* var myPictures = "";
				
				var myFile = $('#files').prop('files');
				 for(var i = 0; 2; i++){
					 var file = myFile[i];
				     
					var picReader = new FileReader();
				    picReader.addEventListener("load",function(event){
				        var picFile = event.target;
				        myPictures[i] = picFile.result;
				    });
				    picReader.readAsDataURL(file);
				} 
				 
				 console.log(myPictures); */
				/*  var reader = new FileReader();
				reader.readAsDataURL(myFile);

				reader.onload = function() {
					return btoa(reader.result);	
				}; */

				//console.log(myFinalfiles[1]);
			} else {
				$.toast({
					heading : ':(',
					text : validationMessage,
					position : 'top-right',
					icon : 'error'
				});
			}

		}

		/* function ReadFile(myFile){
		    var reader = new FileReader();
			reader.readAsDataURL(myFile);

		    reader.onload = function() {
		    	return btoa(reader.result);	
		    };
		} */

		function _base64ToArrayBuffer(base64) {

			debugger;

			var binary_string = window.atob(base64);
			var len = binary_string.length;
			var bytes = new Uint8Array(len);
			for (var i = 0; i < len; i++) {
				bytes[i] = binary_string.charCodeAt(i);
			}
			return bytes.buffer;
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
	</script>

	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->

</body>

</html>