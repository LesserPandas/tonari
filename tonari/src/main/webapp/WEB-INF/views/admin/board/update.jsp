<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <body id="page-top">

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


				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-4 text-gray-800">관리자 글수정</h1>
					<div class="row">

						<div class="col-lg-9">
							<form id="board" method="post" action="updateboardpro.do" onsubmit="return check()">
								<input type="hidden" name="bno" value="${boardlist.bno}">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4" style="margin-left: 20%; font-size: 30px;">관리자 글 수정하기</h1>
									</div>
									<div class="email-right-box">
										<div class="toolbar" role="toolbar"></div>
										<div class="compose-content mt-5">
											<div class="form-group">
												<input type="text" class="form-control bg-transparent" name="title" value="${boardlist.title}">
											</div>
											<div class="form-group">
												<input type="text" class="form-control bg-transparent" placeholder="관리자" readonly>
											</div>
											<select name="category" style="margin-bottom: 1%;" >
												<option  value="${boardlist.category }" selected>게시글종류</option>
												<option>----------</option>
												<option value="1">공지사항</option>
												<option value="2">홍보/이벤트</option>
											</select>
											<div class="form-group">
												<textarea class="textarea_editor form-control bg-light"	id="summernote" rows="15" name="content">${boardlist.content}</textarea>
											</div>
										</div>
									</div>
									<div class="text-left m-t-15" style="margin-left: 32%;">
										<button type="submit" class="btn btn-danger btn-sm">수정&nbsp;&nbsp;</button>
										<a href="board" class="btn btn-danger btn-sm">취소</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>




			<!-- #/ container -->
        </div>
                <!-- /.container-fluid -->

      
      
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
      
           
           
                  </div>
           <!-- End of Content Wrapper --> 
           
           
           
           <script>
	//summernote
	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{
											height : 300,
											fontNames : [ '맑은고딕', 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', ],
											fontNamesIgnoreCheck : [ '맑은고딕' ],
											focus : true,

											callbacks : {
												onImageUpload : function(files,
														editor, welEditable) {
													for (var i = files.length - 1; i >= 0; i--) {
														sendFile(files[i], this);
													}
												}
											}

										})
					});
           
           </script>
        
 </body>      