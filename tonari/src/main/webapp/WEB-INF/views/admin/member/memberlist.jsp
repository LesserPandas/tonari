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
								<h6 class="m-0 font-weight-bold text-primary">先生購読承認</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>番号</th>
												<th>名前</th>
												<th>登録日</th>
												<th>区分</th>
												<th>購読承認</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${list}" var="TeacherPermissionList">
												<tr>
													<td>${TeacherPermissionList.bno}</td>
													<td style="cursor: pointer ; "
													onClick=" location.href='memberview?name=${TeacherPermissionList.name}' "
													onMouseOver=" window.status = 'http://ihouse.so.vc' "
													onMouseOut=" window.status = '' "   >${TeacherPermissionList.name}</td>
													<td>${TeacherPermissionList.join_date}</td>
													<td>${TeacherPermissionList.category_name}</td>
													<td><a onClick="return confirm('承認しますか？')"
														href="permission.do?bno=${TeacherPermissionList.bno}"
														class="btn btn-primary btn-sm">承認</a> <a
														onClick="return confirm('キャンセルしますか？(キャンセルすると払い戻しできます。)')"
														href="deleteteacherlist1.do?bno=${TeacherPermissionList.bno}"
														class="btn btn-danger btn-sm">キャンセル</a></td>
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
					<h1 class="h3 mb-2 text-gray-800">会員管理</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">

						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">会員リスト</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>会員番号</th>
											<th>権限</th>
											<th>名前</th>
											<th>メール</th>
											<th>登録日</th>
											<th>会員削除</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${memberlist}" var="memberlist">
											<tr>
												<td>${memberlist.bno}</td>
												<c:if test="${memberlist.auth eq'admin'}">
													<td>管理者</td>
												</c:if>
												<c:if test="${memberlist.auth eq'student'}">
													<td>一般会員</td>
												</c:if>
												<td style="cursor: pointer ; "
													onClick=" location.href='memberview?name=${memberlist.name}' "
													onMouseOver=" window.status = 'http://ihouse.so.vc' "
													onMouseOut=" window.status = '' "   >${memberlist.name}</td>
												<td>${memberlist.email}</td>
												<td>${memberlist.join_date}</td>
												<td><a onClick="return confirm('削除しますか？')"
													href="delete.do?bno=${memberlist.bno}"
													class="btn btn-danger btn-sm">削除</a></td>
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
