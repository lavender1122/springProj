<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<title></title>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#keyword").on("click", function() {
			let keyword = $("#keyword").val();
			console.log("keyword" + keyword);
			console.log($(this).parent().parent());//form
			$(this).parent().parent().submit();

		});
	});
</script>
</head>
<body class="sidebar-mini" style="height: auto;">
	<!-- <p> -->
	<%-- ${customerVOList} --%>
	<!-- </p> -->
	<div class="wrapper">
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">

			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="../../index3.html" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
			</ul>

			<ul class="navbar-nav ml-auto">

				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="#" role="button"> <i
						class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>

				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
						<span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item">

							<div class="media">
								<img src="../../dist/img/user1-128x128.jpg" alt="User Avatar"
									class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Brad Diesel <span class="float-right text-sm text-danger"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Call me whenever you can...</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div>

						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">

							<div class="media">
								<img src="../../dist/img/user8-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										John Pierce <span class="float-right text-sm text-muted"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">I got your message bro</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div>

						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">

							<div class="media">
								<img src="../../dist/img/user3-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Nora Silvester <span class="float-right text-sm text-warning"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">The subject goes here</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div>

						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Messages</a>
					</div></li>

				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">15
							Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> 4 new messages <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-users mr-2"></i> 8 friend requests <span
							class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
							3 new reports <span class="float-right text-muted text-sm">2
								days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Notifications</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button"> <i
						class="fas fa-expand-arrows-alt"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"
					role="button"> <i class="fas fa-th-large"></i>
				</a></li>
			</ul>
		</nav>




		<div class="content-wrapper" style="min-height: 1302.12px;">

			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Simple Tables</h1>
						</div>
						<a href="/customer/create">고객 등록</a>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Simple Tables</li>
							</ol>
						</div>
					</div>
				</div>
			</section>

			<section class="content">
				<div class="container-fluid">


					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Responsive Hover Table</h3>
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 150px;">
											<form action="/customer/list" method="get">
												<input type="text" name="keyword"
													class="form-control float-right" placeholder="Search">
												<div class="input-group-append">
													<button type="button" id="keyword"
														class="btn btn-default">
														검색 <i class="fas fa-search"></i>
													</button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<div class="card-body table-responsive p-0">
								<table class="table table-hover text-nowrap">
									<thead>
										<tr>
											<th>번호</th>
											<th>직원이름</th>
											<th>주소</th>
											<th>전화번호</th>
										</tr>
									</thead>
									<c:forEach var="customerVO" items="${customerVOList}"
										varStatus="stat">
										<tbody>
											<tr>
												<td>${customerVO.cstNo}</td>
												<td><a
													href="/customer/detail?cstNo=${customerVO.cstNo}">${customerVO.cstName}</a></td>
												<td><span class="tag tag-success">${customerVO.cstAddress}</span></td>
												<td>${customerVO.cstTelno}</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
							</div>

						</div>

					</div>
				</div>

				<div class="row"></div>

				<div class="row"></div>

				<div class="row"></div>
		</div>
		</section>

	</div>

	<footer class="main-footer">
		<div class="float-right d-none d-sm-block">
			<b>Version</b> 3.2.0
		</div>
		<strong>Copyright © 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.
		</strong> All rights reserved.
	</footer>

	<aside class="control-sidebar control-sidebar-dark"
		style="display: none;">

		<div class="p-3 control-sidebar-content" style="">
			<h5>Customize AdminLTE</h5>
			<hr class="mb-2">
			<div class="mb-4">
				<input type="checkbox" value="1" class="mr-1"><span>Dark
					Mode</span>
			</div>
			<h6>Header Options</h6>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Fixed</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Dropdown
					Legacy Offset</span>
			</div>
			<div class="mb-4">
				<input type="checkbox" value="1" class="mr-1"><span>No
					border</span>
			</div>
			<h6>Sidebar Options</h6>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Collapsed</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Fixed</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" checked="checked" class="mr-1"><span>Sidebar
					Mini</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Sidebar
					Mini MD</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Sidebar
					Mini XS</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Nav
					Flat Style</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Nav
					Legacy Style</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Nav
					Compact</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Nav
					Child Indent</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Nav
					Child Hide on Collapse</span>
			</div>
			<div class="mb-4">
				<input type="checkbox" value="1" class="mr-1"><span>Disable
					Hover/Focus Auto-Expand</span>
			</div>
			<h6>Footer Options</h6>
			<div class="mb-4">
				<input type="checkbox" value="1" class="mr-1"><span>Fixed</span>
			</div>
			<h6>Small Text Options</h6>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Body</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Navbar</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Brand</span>
			</div>
			<div class="mb-1">
				<input type="checkbox" value="1" class="mr-1"><span>Sidebar
					Nav</span>
			</div>
			<div class="mb-4">
				<input type="checkbox" value="1" class="mr-1"><span>Footer</span>
			</div>
			<h6>Navbar Variants</h6>
			<div class="d-flex">
				<select class="custom-select mb-3 text-light border-0 bg-white"><option
						class="bg-primary">Primary</option>
					<option class="bg-secondary">Secondary</option>
					<option class="bg-info">Info</option>
					<option class="bg-success">Success</option>
					<option class="bg-danger">Danger</option>
					<option class="bg-indigo">Indigo</option>
					<option class="bg-purple">Purple</option>
					<option class="bg-pink">Pink</option>
					<option class="bg-navy">Navy</option>
					<option class="bg-lightblue">Lightblue</option>
					<option class="bg-teal">Teal</option>
					<option class="bg-cyan">Cyan</option>
					<option class="bg-dark">Dark</option>
					<option class="bg-gray-dark">Gray dark</option>
					<option class="bg-gray">Gray</option>
					<option class="bg-light">Light</option>
					<option class="bg-warning">Warning</option>
					<option class="bg-white">White</option>
					<option class="bg-orange">Orange</option></select>
			</div>
			<h6>Accent Color Variants</h6>
			<div class="d-flex"></div>
			<select class="custom-select mb-3 border-0"><option>None
					Selected</option>
				<option class="bg-primary">Primary</option>
				<option class="bg-warning">Warning</option>
				<option class="bg-info">Info</option>
				<option class="bg-danger">Danger</option>
				<option class="bg-success">Success</option>
				<option class="bg-indigo">Indigo</option>
				<option class="bg-lightblue">Lightblue</option>
				<option class="bg-navy">Navy</option>
				<option class="bg-purple">Purple</option>
				<option class="bg-fuchsia">Fuchsia</option>
				<option class="bg-pink">Pink</option>
				<option class="bg-maroon">Maroon</option>
				<option class="bg-orange">Orange</option>
				<option class="bg-lime">Lime</option>
				<option class="bg-teal">Teal</option>
				<option class="bg-olive">Olive</option></select>
			<h6>Dark Sidebar Variants</h6>
			<div class="d-flex"></div>
			<select class="custom-select mb-3 text-light border-0 bg-primary"><option>None
					Selected</option>
				<option class="bg-primary">Primary</option>
				<option class="bg-warning">Warning</option>
				<option class="bg-info">Info</option>
				<option class="bg-danger">Danger</option>
				<option class="bg-success">Success</option>
				<option class="bg-indigo">Indigo</option>
				<option class="bg-lightblue">Lightblue</option>
				<option class="bg-navy">Navy</option>
				<option class="bg-purple">Purple</option>
				<option class="bg-fuchsia">Fuchsia</option>
				<option class="bg-pink">Pink</option>
				<option class="bg-maroon">Maroon</option>
				<option class="bg-orange">Orange</option>
				<option class="bg-lime">Lime</option>
				<option class="bg-teal">Teal</option>
				<option class="bg-olive">Olive</option></select>
			<h6>Light Sidebar Variants</h6>
			<div class="d-flex"></div>
			<select class="custom-select mb-3 border-0"><option>None
					Selected</option>
				<option class="bg-primary">Primary</option>
				<option class="bg-warning">Warning</option>
				<option class="bg-info">Info</option>
				<option class="bg-danger">Danger</option>
				<option class="bg-success">Success</option>
				<option class="bg-indigo">Indigo</option>
				<option class="bg-lightblue">Lightblue</option>
				<option class="bg-navy">Navy</option>
				<option class="bg-purple">Purple</option>
				<option class="bg-fuchsia">Fuchsia</option>
				<option class="bg-pink">Pink</option>
				<option class="bg-maroon">Maroon</option>
				<option class="bg-orange">Orange</option>
				<option class="bg-lime">Lime</option>
				<option class="bg-teal">Teal</option>
				<option class="bg-olive">Olive</option></select>
			<h6>Brand Logo Variants</h6>
			<div class="d-flex"></div>
			<select class="custom-select mb-3 border-0"><option>None
					Selected</option>
				<option class="bg-primary">Primary</option>
				<option class="bg-secondary">Secondary</option>
				<option class="bg-info">Info</option>
				<option class="bg-success">Success</option>
				<option class="bg-danger">Danger</option>
				<option class="bg-indigo">Indigo</option>
				<option class="bg-purple">Purple</option>
				<option class="bg-pink">Pink</option>
				<option class="bg-navy">Navy</option>
				<option class="bg-lightblue">Lightblue</option>
				<option class="bg-teal">Teal</option>
				<option class="bg-cyan">Cyan</option>
				<option class="bg-dark">Dark</option>
				<option class="bg-gray-dark">Gray dark</option>
				<option class="bg-gray">Gray</option>
				<option class="bg-light">Light</option>
				<option class="bg-warning">Warning</option>
				<option class="bg-white">White</option>
				<option class="bg-orange">Orange</option>
				<a href="#">clear</a></select>
		</div>
	</aside>

	<div id="sidebar-overlay"></div>
	</div>


	<script src="../../plugins/jquery/jquery.min.js"></script>

	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="../../dist/js/adminlte.min.js?v=3.2.0"></script>

	<script src="../../dist/js/demo.js"></script>


</body>
</html>