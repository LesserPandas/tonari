<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link href="/resources/custom/css/main.css" rel="stylesheet">
</head>
<body>
	<div class="title-wrapper simple-linear ">
		<!-- 메인 배너 이미지 -->
		<div class="container">
			<div class="container-inner col-md-6 col-md-offset-3">
				<h1>
					내 주변 <span class="title-appeal">선생님</span> 찾기
				</h1>
				<em>내 주변 숨어있는 선생님을 찾아보세요</em>
			</div>
			<div class="search-box col-md-12"
				style="padding-left: 80px; margin: 80px 0 0">
				<form id="search" method="get" action="board/mainsearch">
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon btn-green">과목</span> <select
								class="form-control border-radius option-select ht-45" id="sel1"
								name="category_bno">
								<option value=>전체선택</option>
								<option value="1">일본어</option>
								<option value="2">Java</option>
								<option value="3">Python</option>
								<option value="4">Javascript</option>
								<option value="5">Spring</option>
								<option value="6">HTML5+CSS3</option>
								<option value="7">Database</option>
							</select>
						</div>
					</div>
					<div class="col-md-2">
						<div class="input-group">
							<span class="input-group-addon btn-green">지역</span> <select
								class="form-control border-radius option-select ht-45" id="sel1"
								name="dong">
								<option value=>전체선택</option>
								<option>용두동</option>
								<option>선화동</option>
								<option>갈마동</option>
								<option>은행동</option>
							</select>
						</div>
					</div>
					<div class="col-md-5 search-mg-15">
						<div class="input-group">
							<!-- <span class="input-group-addon btn-green">검색어</span> -->
							<input type="text" class="form-control ht-45" name="keyword"
								placeholder="입력" style="width: 435px; display: inline-block">
							<span class="input-group-btn">
								<button class="btn btn-primary btn-green ht-45" type="submit"
									style="width: 100px">검색</button>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-inverse nav-category ht-100">
		<div class="container" style="margin-top: 10px">
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="/board/search?type=category&&keyword=1" class="category-link underline green">일본어</a></li>
					<li><a href="/board/search?type=category&&keyword=2" class="category-link underline green">Java</a></li>
					<li><a href="/board/search?type=category&&keyword=3" class="category-link underline green">Python</a></li>
					<li><a href="/board/search?type=category&&keyword=4" class="category-link underline green">Javascript</a></li>
					<li><a href="/board/search?type=category&&keyword=5" class="category-link underline green">Spring</a></li>
					<li><a href="/board/search?type=category&&keyword=6" class="category-link underline green">HTML5+CSS3</a></li>
					<li><a href="/board/search?type=category&&keyword=7" class="category-link underline green">DB</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="main">
		<div class="container">
			<!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
			<div class="row margin-bottom-40">
				<div role="tabpanel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="bg-white active"><a
							href="#recommend" aria-controls="recommend" role="tab"
							data-toggle="tab">추천</a></li>
						<li role="presentation" class="bg-white "><a href="#hot"
							aria-controls="hot" role="tab" data-toggle="tab">인기</a></li>
						<li role="presentation"><a href="#new" aria-controls="new"
							role="tab" data-toggle="tab">신규</a></li>
						<li role="presentation"><a href="#location"
							aria-controls="location" role="tab" data-toggle="tab">내주변</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<!-- 추천 상세내용 -->
						<div role="tabpanel" class="tab-pane active" id="recommend">
							<div class="col-md-12 sale-product">
								<div class="owl-carousel owl-carousel5">
									<div class="product-item">
										<div style="text-align: right;">
											<span>별점</span>4.1
										</div>
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model1.jpg"
												class="img-responsive" alt="">
											<div>
												<a href="#" class="btn btn-default fancybox-button">찜하기</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">강사명</a>
										</h3>
										<div class="pi-price">
											과목명<br>지역
										</div>
										<a href="info" class="btn btn-default add2cart">프로필보기</a>
									</div>
									<div class="product-item">
										<div style="text-align: right;">
											<span>별점</span>4.1
										</div>
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model1.jpg"
												class="img-responsive" alt="">
											<div>
												<a href="#" class="btn btn-default fancybox-button">찜하기</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">강사명</a>
										</h3>
										<div class="pi-price">
											과목명<br>지역
										</div>
										<a href="info" class="btn btn-default add2cart">프로필보기</a>
									</div>
									<div class="product-item">
										<div style="text-align: right;">
											<span>별점</span>4.1
										</div>
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model1.jpg"
												class="img-responsive" alt="">
											<div>
												<a href="#" class="btn btn-default fancybox-button">찜하기</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">강사명</a>
										</h3>
										<div class="pi-price">
											과목명<br>지역
										</div>
										<a href="info" class="btn btn-default add2cart">프로필보기</a>
									</div>
									<div class="product-item">
										<div style="text-align: right;">
											<span>별점</span>4.1
										</div>
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model1.jpg"
												class="img-responsive" alt="">
											<div>
												<a href="#" class="btn btn-default fancybox-button">찜하기</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">강사명</a>
										</h3>
										<div class="pi-price">
											과목명<br>지역
										</div>
										<a href="info" class="btn btn-default add2cart">프로필보기</a>
									</div>
									<div class="product-item">
										<div style="text-align: right;">
											<span>별점</span>4.1
										</div>
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model1.jpg"
												class="img-responsive" alt="">
											<div>
												<a href="#" class="btn btn-default fancybox-button">찜하기</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">강사명</a>
										</h3>
										<div class="pi-price">
											과목명<br>지역
										</div>
										<a href="info" class="btn btn-default add2cart">프로필보기</a>
									</div>
									<div class="product-item">
										<div style="text-align: right;">
											<span>별점</span>4.1
										</div>
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model1.jpg"
												class="img-responsive" alt="">
											<div>
												<a href="#" class="btn btn-default fancybox-button">찜하기</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">강사명</a>
										</h3>
										<div class="pi-price">
											과목명<br>지역
										</div>
										<a href="info" class="btn btn-default add2cart">프로필보기</a>
									</div>
								</div>
							</div>
							<!-- END SALE PRODUCT -->
						</div>
						<!-- 인기 상세내용 -->
						<div role="tabpanel" class="tab-pane" id="hot">
							<div class="col-md-12 text-center pt-5"
								style="height: 100px; padding-top: 50px">
								<h1>정보가 없어요!</h1>
							</div>
						</div>
						<!-- 신규 상세내용 -->
						<div role="tabpanel" class="tab-pane" id="new">
							<div class="col-md-12 text-center pt-5"
								style="height: 100px; padding-top: 50px">
								<h1>정보가 없어요!</h1>
							</div>
						</div>
						<!-- 내주변 상세내용 -->
						<div role="tabpanel" class="tab-pane" id="location">
							<div class="col-md-12 text-center pt-5"
								style="height: 100px; padding-top: 50px">
								<h1>정보가 없어요!</h1>
							</div>
						</div>
					</div>
				</div>
				<!-- BEGIN SALE PRODUCT -->
			</div>
			<!-- END SALE PRODUCT & NEW ARRIVALS -->
		</div>
	</div>

	<section id="carousel" style="margin-bottom: 80px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="carousel slide" id="fade-quote-carousel"
						data-ride="carousel">
						<!-- Carousel items -->
						<div class="carousel-inner">
							<div class="active item">
								<div class="col-md-3 border">
									<blockquote>
										<div>
											<h4 class="review-title">너무 좋아요!</h4>
											<span class="starpoint">⭐⭐⭐⭐⭐</span>
										</div>
									</blockquote>
									<div>박***</div>
									<div>에베베베베베베베베베베베베베베베베베...</div>
								</div>
								<div class="col-md-3 border">
									<blockquote>
										<div>
											<h4 class="review-title">너무 좋아요!</h4>
											<span class="starpoint">⭐⭐⭐⭐⭐</span>
										</div>
									</blockquote>
									<div>박***</div>
									<div>에베베베베베베베베베베베베베베베베베...</div>
								</div>
								<div class="col-md-3 border">
									<blockquote>
										<div>
											<h4 class="review-title">너무 좋아요!</h4>
											<span class="starpoint">⭐⭐⭐⭐⭐</span>
										</div>
									</blockquote>
									<div>박***</div>
									<div>에베베베베베베베베베베베베베베베베베...</div>
								</div>
								<div class="col-md-3 border">
									<blockquote>
										<div>
											<h4 class="review-title">너무 좋아요!</h4>
											<span class="starpoint">⭐⭐⭐⭐⭐</span>
										</div>
									</blockquote>
									<div>박***</div>
									<div>에베베베베베베베베베베베베베베베베베...</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="container" style="margin-bottom: 60px">
		<div class="row">
			<div class="col-md-12 search-mg-0 bg-success">
				<div
					style="padding: 10px; width: 50%; padding: 30px; background: #fff; float: left"">
					<h2>공지사항</h2>
					<table class="table">
						<thead>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>공지사항 예시1</td>
								<td>2022/02/13</td>
							</tr>
							<tr>
								<td>2</td>
								<td>공지사항 예시2</td>
								<td>2022/02/13</td>
							</tr>
							<tr>
								<td>3</td>
								<td>공지사항 예시3</td>
								<td>2022/02/13</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="padding: 10px; width: 50%; float: left; padding: 30px">
					<h2>이벤트</h2>
					<table class="table">
						<thead>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>이벤트 예시1</td>
								<td>2022/02/13</td>
							</tr>
							<tr>
								<td>2</td>
								<td>이벤트 예시2</td>
								<td>2022/02/13</td>
							</tr>
							<tr>
								<td>3</td>
								<td>이벤트 예시3</td>
								<td>2022/02/13</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- <div style="width: 50%; float: left; padding: 30px">
						<h2>FAQ</h2>
						<div class="input-group col-md-11" style="margin:15px 0">
							<input type="text" class="form-control" placeholder="질문 검색하기"><span
								class="input-group-btn"><button type="button"
									class="btn btn-primary">검색</button></span>
						</div>
						<table class="table">
							<tr>
								<td>1</td>
								<td>질문 예시1</td>
								<td>2022/02/13</td>
							</tr>
							<tr>
								<td>2</td>
								<td>질문 예시2</td>
								<td>2022/02/13</td>
							</tr>
							<tr>
								<td>3</td>
								<td>질문 예시3</td>
								<td>2022/02/13</td>
							</tr>
						</table>
					</div> -->
		</div>
	</div>
<%@ include file="footer.jsp"%>
