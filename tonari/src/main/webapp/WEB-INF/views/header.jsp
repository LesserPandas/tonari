<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	
<!DOCTYPE html>
<html lang="jp">

<!-- Head BEGIN -->
<head>
<meta charset="utf-8">
<title>隣の先生</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta content="「隣の先生」の説明" name="description">
<meta content="" name="keywords">
<meta content="チーム　「何とかなる」" name="author">

<meta property="og:site_name" content="隣の先生">
<meta property="og:title" content="隣の先生">
<meta property="og:description" content="自分の付近にいる先生探し">
<meta property="og:type" content="website">
<meta property="og:image" content="">

<!-- link to image for socio -->
<meta property="og:url" content="">

<!-- <link rel="shortcut icon" href="favicon.ico"> 사이트아이콘-->

<!-- Fonts START -->
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all">
<!--- fonts for slider on the index page -->
<!-- Fonts END -->

<!-- Global styles START -->
<link rel="stylesheet"
	href="/resources/assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link rel="stylesheet" href="/resources/assets/pages/css/animate.css">
<link rel="stylesheet"
	href="/resources/assets/plugins/fancybox/source/jquery.fancybox.css">
<link rel="stylesheet"
	href="/resources/assets/plugins/owl.carousel/assets/owl.carousel.css">
<!-- Page level plugin styles END -->

<!-- Theme styles START -->
<link rel="stylesheet" href="/resources/assets/pages/css/components.css">
<link rel="stylesheet" href="/resources/assets/pages/css/slider.css">
<link rel="stylesheet" href="/resources/assets/pages/css/style-shop.css"
	type="text/css">
<link rel="stylesheet" href="/resources/assets/corporate/css/style.css">
<link rel="stylesheet"
	href="/resources/assets/corporate/css/style-responsive.css">
<link rel="stylesheet"
	href="/resources/assets/corporate/css/themes/green.css"
	id="style-color">
<link rel="stylesheet" href="/resources/assets/corporate/css/custom.css">

<!-- 내가 추가-->
<link rel="stylesheet" href="/resources/assets/pages/css/index.css">
<link rel="stylesheet" href="/resources/custom/css/summernote/summernote-lite.css">
<link rel="stylesheet" href="/resources/custom/css/imagecheck.css">
<script src="/resources/assets/jquery-3.6.0.min.js"></script>
<script src="/resources/assets/plugins/jquery.min.js" type="text/javascript"></script>
<!-- 내가 추가-->

<!-- 한준희 결제 스크립트 -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>		
<!-- 한준희 결제 스크립트 -->

<!-- Theme styles END -->
</head>
<!-- Head END -->



<!-- Body BEGIN -->
<body class="ecommerce">
	<!-- BEGIN STYLE CUSTOMIZER -->


	<!-- BEGIN TOP BAR -->
	<div class="pre-header">
		<div class="container">
			<div class="row">
				<!-- BEGIN TOP BAR LEFT PART -->
				<div class="col-md-6 col-sm-6 additional-shop-info">
					<ul class="list-unstyled list-inline">
						<!-- BEGIN CURRENCIES -->

					</ul>
				</div>
				<!-- END TOP BAR LEFT PART -->
				<!-- BEGIN TOP BAR MENU -->
				<div class="col-md-6 col-sm-6 additional-nav">
					<ul class="list-unstyled list-inline pull-right">
						<c:choose>
						<c:when test="${empty nowUser}">
						<li><a href="/">HOME</a></li>
						<li><a href="/login">로그인</a></li>
						<li><a href="/join">회원가입</a></li>
						</c:when>
						
						<c:when test="${not empty nowUser}">
						<!-- 닉네임 -->
						<li>${nowUser.nick}님</li>
						
						<!-- 홈으로 -->
						<li><a href="/">HOME</a></li>
						<!-- 마이페이지 -->
						<li><a href="/mypage">마이페이지</a></li>
						<!-- 로그아웃 -->
						<li><a href="/join/logout">로그아웃</a></li>
						</c:when>
						</c:choose>
					</ul>
				</div>
				<!-- END TOP BAR MENU -->
			</div>
		</div>
	</div>
	<!-- END TOP BAR -->


	<!-- BEGIN HEADER -->
	<div class="header">
		<div class="container">

			<a class="site-logo" href="/"><img
				src="/resources/assets/corporate/img/logos/logo-shop-green.png"
				alt="Metronic Shop UI"></a> <a href="javascript:void(0);"
				class="mobi-toggler"><i class="fa fa-bars"></i></a>

			<!-- BEGIN CART -->
			<div class="top-cart-block">
				<div class="top-cart-info">
					<a href="javascript:void(0);" class="top-cart-info-count">신규알림
						<span class="badge" style="border-radius: 10px !important;">42</span>
					</a>
				</div>
				<i class="fa fa-bell"></i>

				<div class="top-cart-content-wrapper">
					<div class="top-cart-content">
						<ul class="scroller" style="height: 250px;">

							<li><a href="shop-item.html"><img
									src="/resources/assets/pages/img/cart-img.jpg"
									alt="Rolex Classic Watch" width="37" height="34"></a> <span
								class="cart-content-count">x 1</span> <strong><a
									href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
								href="javascript:void(0);" class="del-goods">&nbsp;</a></li>

						</ul>
						<div class="text-right">
							<a href="shop-shopping-cart.html" class="btn btn-default">View
								Cart</a> <a href="shop-checkout.html" class="btn btn-primary">Checkout</a>
						</div>
					</div>
				</div>
			</div>
			<!--END CART -->

			<!-- BEGIN NAVIGATION -->
			<div class="header-navigation">
				<ul>
					<li class="dropdown dropdown-megamenu"><a
						class="dropdown-toggle" data-toggle="dropdown" data-target="#"
						href="javascript:;"> 전체메뉴 </a>
						<ul class="dropdown-menu">
							<li>
								<div class="header-navigation-content">
									<div class="row">
										<div class="col-md-3 header-navigation-col">
											<h4>카테고리</h4>
											<ul>
												<li><a href="/board/search?type=category&&keyword=1">일본어</a></li>
												<li><a href="/board/search?type=category&&keyword=2">JAVA</a></li>
												<li><a href="/board/search?type=category&&keyword=3">Python</a></li>
												<li><a href="/board/search?type=category&&keyword=4">Javascript</a></li>
												<li><a href="/board/search?type=category&&keyword=5">Spring</a></li>
												<li><a href="/board/search?type=category&&keyword=6">HTML5+CSS3</a></li>
												<li><a href="/board/search?type=category&&keyword=7">Database</a></li>
											</ul>
										</div>
										<div class="col-md-3 header-navigation-col">
											<h4>강사찾기</h4>
											<ul>
												<li><a href="/board/search?type=orderby&&keyword=score&&snum=1">인기 강사</a></li>
												<li><a href="/board/search?type=orderby&&keyword=teacher&&snum=0">신규 강사</a></li>
												<li><a href="shop-product-list.html">시간이 맞는 강사</a></li>
												<c:if test="${not empty nowUser }">
													<li><a href="/board/search?type=area&&keyword=${nowUser.nick }&&snum=2">내 주변 강사</a></li>
												</c:if>
											</ul>
										</div>
										<div class="col-md-3 header-navigation-col">
											<h4>게시판</h4>
											<ul>
												<li><a href="shop-product-list.html">공지사항</a></li>
												<li><a href="shop-product-list.html">이벤트</a></li>
												<li><a href="shop-product-list.html">강사 블로그</a></li>
												<li><a href="shop-product-list.html">즐겨찾기한 글</a></li>
												<li><a href="shop-product-list.html">학습 후기</a></li>
											</ul>
										</div>
										<div class="col-md-3 header-navigation-col">
											<h4>마이페이지</h4>
											<ul>
												<li><a href="/mypage/studentinfo">개인정보 수정</a></li>
												<li><a href="/mypage/like">좋아요한 선생님</a></li>
												<li><a href="/mypage/teacherList">나의 선생님</a></li>
												<li><a href="/mypage/subscription"><strong>선생님으로 등록</strong></a></li>
											</ul>
										</div>
									</div>
								</div>
							</li>
						</ul></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="#" href="javascript:;">
							카테고리 </a> <!-- BEGIN DROPDOWN MENU -->
						<ul class="dropdown-menu">
							<li><a href="/board/search?type=category&&keyword=1">일본어</a></li>
							<li><a href="/board/search?type=category&&keyword=2">JAVA</a></li>
							<li><a href="/board/search?type=category&&keyword=3">Python</a></li>
							<li><a href="/board/search?type=category&&keyword=4">Javascript</a></li>
							<li><a href="/board/search?type=category&&keyword=5">Spring</a></li>
							<li><a href="/board/search?type=category&&keyword=6">HTML5+CSS3</a></li>
							<li><a href="/board/search?type=category&&keyword=7">Database</a></li>
						</ul> <!-- END DROPDOWN MENU --></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="#" href="javascript:;">
							강사찾기 </a> <!-- BEGIN DROPDOWN MENU -->
						<ul class="dropdown-menu">
							<li><a href="/board/search?type=orderby&&keyword=score&&snum=1">인기 강사</a></li>
							<li><a href="/board/search?type=orderby&&keyword=teacher&&snum=0">신규 강사</a></li>
							<li><a href="shop-product-list.html">시간이 맞는 강사</a></li>
							<c:if test="${not empty nowUser }">
								<li><a href="/board/search?type=area&&keyword=${nowUser.nick }&&snum=2">내 주변 강사</a></li>
							</c:if>
						</ul> <!-- END DROPDOWN MENU --></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="#" href="javascript:;">
							게시판 </a> <!-- BEGIN DROPDOWN MENU -->
						<ul class="dropdown-menu">
							<li><a href="shop-product-list.html">공지사항</a></li>
							<li><a href="shop-product-list.html">이벤트</a></li>
							<li><a href="shop-product-list.html">강사 블로그</a></li>
							<li><a href="shop-product-list.html">즐겨찾기한 글</a></li>
							<li><a href="shop-product-list.html">학습 후기</a></li>
						</ul> <!-- END DROPDOWN MENU --></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="/mypage" href="/mypage">
							마이페이지 </a> <!-- BEGIN DROPDOWN MENU -->
						<ul class="dropdown-menu">
							<li><a href="/join/studentinfologintest">개인정보 수정</a></li>
							<li><a href="/mypage/like">좋아요한 선생님</a></li>
							<li><a href="/mypage/teacherList">나의 선생님</a></li>
							<li><a href="/mypage/subscription"><strong>선생님으로 등록</strong></a></li>
						</ul> <!-- END DROPDOWN MENU --></li>



					<!-- 개발용 링크 넣기  -->

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="#" href="javascript:;">
							테스트페이지 </a> <!-- BEGIN DROPDOWN MENU -->
						<ul class="dropdown-menu">
							<li>
								<div class="row" style="width:400px;">
									<div class="col-md-6">
										<ul>
											<li><h4 style="padding: 10px 10px 0">준희</h4></li>
											<li><a href="/login">로그인</a></li>
											<li><a href="/join">회원가입</a></li>
											<li><a href="/mypage/teacherJoin">강사등록</a></li>
											<li><a href="/mypage/teacherUpdate">강사정보수정</a></li>
											<li><a href="/mypage/subscription">구독하기</a></li>
											<li><a href="/mypage/subResult">구독결과</a></li>
											<li><a href="/mypage/studentInfoModify">일반회원 정보 수정</a></li>
											<li><a href="/mypage/like">선생님 찜한 목록</a></li>
										</ul>
									</div>

									<div class="col-md-6">
										<ul>
											<li><h4 style="padding: 10px 10px 0">남현</h4></li>
											<li><a href="/board/search?type=orderby&&keyword=teacher">강사 찾기</a></li>
											<li><a href="/board/info?teacher_bno=1">강사 정보</a></li>

											<li><h4 style="padding: 10px 10px 0">두홍</h4></li>
						                    <li><a href="/admin">Admin-로그인</a></li>
						                    <li><a href="/admin/memberlist">Admin-멤버리스트</a></li>
						                    <li><a href="/admin/teacherlist">Admin-강사리스트</a></li>
						                    <li><a href="/admin/board">Admin-게시판</a></li>
						                    <li><a href="/admin/write">Admin-게시판 글작성</a></li>
						                    <li><a href="/admin/update">Admin-게시판 글수정</a></li>
						                    <li><a href="/admin/mail">Admin-메일</a></li>
										</ul>
									</div>
								</div>
							</li>
						</ul> <!-- END DROPDOWN MENU --></li>

				</ul>
			</div>
			<!-- END NAVIGATION -->
		</div>
	</div>
	<!-- Header END -->

</body>