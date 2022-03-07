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
					<h1 class="h3 mb-2 text-gray-800">会員管理</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">

						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">会員リスト</h6>
						</div>
						<div class="card-body">
							<div id="checkout" class="panel panel-default">
							

								<!-- BEGIN PAYMENT ADDRESS -->

								<form id="memberview" method="post" action="memberview" onsubmit="return check()">


									<div class="row" >
										<div class="col-md-6 col-sm-6">

	
											<h3>アカウント情報</h3>
											<div class="form-group" style="width: 300px;  ">
												<label for="nick">ニックネーム</label> <input type="text" id="nick"
													name="nick" class="form-control" value="${memberview.nick}" readonly/>
											</div>
											<div class="form-group" style="width: 300px;">
												<label for="email">メール <span class="require"></span></label>
												<input type="text" id="email" name="email"
													class="form-control" value="${memberview.email}" readonly>
												<span id="msg" style="display: block; padding: 5px 0;"></span>
											</div>
											<div class="form-group" style="width: 300px;">
												<label for="password">パスワード <span class="require"></span></label>
												<input type="text" id="passwd" name="passwd"
													class="form-control" value="${memberview.passwd}" readonly>
											</div>


										
											<div class="form-group" style="width: 300px;">
												<label for="firstname" for="name">名前 <span
													class="require"></span></label> <input type="text" id="name"
													name="name" class="form-control" value="${memberview.name}" readonly>
											</div>
											<div class="form-group" style="width: 300px;">
												<label for="sex">性別 <span class="require"></span></label>
												<c:choose>
													<c:when test="${memberview.sex eq 'f'}">
														<input type="text" class="form-control" value="女子"
															readonly />
													</c:when>

													<c:otherwise>
														<input type="text" class="form-control" value="男子"
															readonly />
													</c:otherwise>
												</c:choose>
											</div>

										</div>



										<div class="col-md-6 col-sm-6" >
											<h3>住所</h3>

											<div id="layer"
												style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
												<img
													src="//t1.daumcdn.net/postcode/resource/images/close.png"
													id="btnCloseLayer"
													style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
													onclick="closeDaumPostcode()" alt="닫기 버튼">
											</div>

											<div class="form-group">
												<label for="address1"></label> <input type="text"
													id="sample2_address" name="address" class="form-control"
													style="width: 300px" value="${memberview.address}" readonly><br>
											</div>

											<h3>電話番号</h3>
											<div class="form-group"
												style="width: 300px; font-size: large;">
												<label for="phone"><span class="require"></span></label>
												<input type="text" id="phone" id="phone" name="phone"
													class="form-control" value="${memberview.phone}" readonly>
													</div>

											<h3>登録日</h3>
											<div class="form-group"
												style="width: 300px; font-size: large;">
												<label for="join_date"><span class="require"></span></label>
												<input type="text" id="join_date" id="join_date" name="join_date"
													class="form-control" value="${memberview.join_date}" readonly>
											</div>
											   <div class="text-left m-t-15" style="margin-left: 32%; ">
                                        <button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button" onclick="history.back();"><i class="ti-close m-r-5 f-s-12"></i>戻る</button>
                                    </div>
										</div>
									</div>
							</form>
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
