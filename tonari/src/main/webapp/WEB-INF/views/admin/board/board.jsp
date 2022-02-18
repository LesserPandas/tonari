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
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">게시판관리</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">게시판목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>번호</th>
											<th>구분</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성날짜</th>
											<th>조회수</th>
											<th>관리</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>번호</th>
											<th>구분</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성날짜</th>
											<th>조회수</th>
											<th>관리</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${boardlist}" var="boardlist">
											<tr>
												<td>${boardlist.bno}</td>
											<c:if test="${boardlist.category==1}" >												
												<td>공지사항</td>
											</c:if>
											<c:if test="${boardlist.category==2}" >												
												<td>홍보/이벤트</td>
											</c:if>		
												<td>${boardlist.title}</td>
												<td>${boardlist.name}</td>
												<td>${boardlist.write_date}</td>
												<td>${boardlist.viewcount}</td>
												<td>
											  	<a href="updateboard.do?bno=${boardlist.bno}"
													class="btn btn-danger btn-sm">수정</a>	
													<a
													onClick="return confirm('삭제하시겠어요?')"
													href="boarddelete.do?bno=${boardlist.bno}"
													class="btn btn-danger btn-sm">삭제</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<a href="write" class="btn btn-primary btn-icon-split"
									style="float: right; margin-right: 20%;"> <span
									class="text" style="padding: 2%;">글쓰기</span>
								</a>
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
</body>
