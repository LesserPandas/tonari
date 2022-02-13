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
							</div>
						</li>
					</ul>
				</nav>
				<!-- End of Topbar -->




 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->              
                
                        <div class="card shadow mb-4">
                        <div class="card-header py-3">        
				<h6 class="m-0 font-weight-bold text-primary">강사구독승인</h6>             
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" >
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>이름</th>                                            
                                            <th>가입날짜</th>
                                            <th>구분</th>
                                            <th>강사승인</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                            <td>	<button type="button" onclick="location.href=''" class="btn btn-primary btn-sm">승인</button></td>
                                        </tr>
                                        <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>63</td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
              </div>  
        



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
											<th>번호</th>
											<th>권한</th>
											<th>이름</th>
											<th>메일</th>
											<th>가입날짜</th>
											<th>회원삭제</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>번호</th>
											<th>권한</th>
											<th>이름</th>
											<th>메일</th>
											<th>가입날짜</th>
											<th>회원삭제</th>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>
											<td>Edinburgh</td>
											<td>61</td>
											<td>2011/04/25</td>
											<td>$320,800</td>
										</tr>
										<tr>
											<td>Garrett Winters</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>63</td>
											<td>2011/07/25</td>
											<td>$170,750</td>
										</tr>
										<tr>
											<td>Ashton Cox</td>
											<td>Junior Technical Author</td>
											<td>San Francisco</td>
											<td>66</td>
											<td>2009/01/12</td>
											<td>$86,000</td>
										</tr>
										<tr>
											<td>Cedric Kelly</td>
											<td>Senior Javascript Developer</td>
											<td>Edinburgh</td>
											<td>22</td>
											<td>2012/03/29</td>
											<td>$433,060</td>
										</tr>
										<tr>
											<td>Airi Satou</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>33</td>
											<td>2008/11/28</td>
											<td><button type="button" onclick="location.href=''" class="btn btn-danger btn-sm">삭제</button></td>
										</tr>
										<tr>
											<td>Brielle Williamson</td>
											<td>Integration Specialist</td>
											<td>New York</td>
											<td>61</td>
											<td>2012/12/02</td>
											<td>$372,000</td>
										</tr>
										<tr>
											<td>Herrod Chandler</td>
											<td>Sales Assistant</td>
											<td>San Francisco</td>
											<td>59</td>
											<td>2012/08/06</td>
											<td>$137,500</td>
										</tr>
										<tr>
											<td>Rhona Davidson</td>
											<td>Integration Specialist</td>
											<td>Tokyo</td>
											<td>55</td>
											<td>2010/10/14</td>
											<td>$327,900</td>
										</tr>
										<tr>
											<td>Colleen Hurst</td>
											<td>Javascript Developer</td>
											<td>San Francisco</td>
											<td>39</td>
											<td>2009/09/15</td>
											<td>$205,500</td>
										</tr>
										<tr>
											<td>Sonya Frost</td>
											<td>Software Engineer</td>
											<td>Edinburgh</td>
											<td>23</td>
											<td>2008/12/13</td>
											<td>$103,600</td>
										</tr>
										<tr>
											<td>Jena Gaines</td>
											<td>Office Manager</td>
											<td>London</td>
											<td>30</td>
											<td>2008/12/19</td>
											<td>$90,560</td>
										</tr>
										<tr>
											<td>Quinn Flynn</td>
											<td>Support Lead</td>
											<td>Edinburgh</td>
											<td>22</td>
											<td>2013/03/03</td>
											<td>$342,000</td>
										</tr>
										<tr>
											<td>Charde Marshall</td>
											<td>Regional Director</td>
											<td>San Francisco</td>
											<td>36</td>
											<td>2008/10/16</td>
											<td>$470,600</td>
										</tr>
										<tr>
											<td>Haley Kennedy</td>
											<td>Senior Marketing Designer</td>
											<td>London</td>
											<td>43</td>
											<td>2012/12/18</td>
											<td>$313,500</td>
										</tr>
										<tr>
											<td>Tatyana Fitzpatrick</td>
											<td>Regional Director</td>
											<td>London</td>
											<td>19</td>
											<td>2010/03/17</td>
											<td>$385,750</td>
										</tr>
										<tr>
											<td>Michael Silva</td>
											<td>Marketing Designer</td>
											<td>London</td>
											<td>66</td>
											<td>2012/11/27</td>
											<td>$198,500</td>
										</tr>
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
</body>
