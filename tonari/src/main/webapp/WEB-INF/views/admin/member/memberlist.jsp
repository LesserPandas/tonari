<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@ include file="../header.jsp"%>



		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">


			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop"
							class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>
					</ul>
				</nav>
				<!-- End of Topbar -->




				<!-- Begin Page Content -->
				<c:set var="list" value="${TeacherPermissionList}" />
				<c:if test="${not empty list}">
					<div class="container-fluid">

						<!-- Page Heading -->

						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">강사구독승인</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>번호</th>
												<th>이름</th>
												<th>가입날짜</th>
												<th>구분</th>
												<th>구독승인</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${list}"
												var="TeacherPermissionList">
												<tr>
													<td>${TeacherPermissionList.bno}</td>
													<td>${TeacherPermissionList.name}</td>
													<td>${TeacherPermissionList.join_date}</td>
													<td>${TeacherPermissionList.category_name}</td>
													<td><a onClick="return confirm('승인하시겠습니까?')"
														href="permission.do?bno=${TeacherPermissionList.bno}"
														class="btn btn-primary btn-sm">승인</a></td>
													<!--  	<td><a href="permission.do?bno=${lectorpermitlist.bno}" class="btn btn-danger btn-sm">승인</a></td>  -->
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:if>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">회원관리</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">

						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>회원번호</th>
											<th>권한</th>
											<th>이름</th>
											<th>메일</th>
											<th>가입날짜</th>
											<th>회원삭제</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>회원번호</th>
											<th>권한</th>
											<th>이름</th>
											<th>메일</th>
											<th>가입날짜</th>
											<th>회원삭제</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${memberlist}" var="memberlist">
											<tr>
												<td>${memberlist.bno}</td>
												<td>${memberlist.auth}</td>
												<td>${memberlist.name}</td>
												<td>${memberlist.email}</td>
												<td>${memberlist.join_date}</td>
												<td><a onClick="return confirm('삭제하시겠어요?')"
													href="delete.do?bno=${memberlist.bno}"
													class="btn btn-danger btn-sm">삭제</a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>

							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->


			<%@ include file="../footer.jsp"%>

		</div>
		<!-- End of Content Wrapper -->
	</div>


	s
</body>
