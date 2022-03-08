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
						<li><a href="/login">ログイン</a></li>
						<li><a href="/join">会員登録</a></li>
						</c:when>
						
						<c:when test="${not empty nowUser}">
						<!-- 닉네임 -->
						<li>${nowUser.nick}様</li>
						
						<!-- 홈으로 -->
						<li><a href="/">HOME</a></li>
						<!-- 마이페이지 -->
						<li><a href="/mypage">マイページ</a></li>
						<!-- 로그아웃 -->
						<li><a href="/join/logout">ログアウト</a></li>
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
				src="/resources/assets/corporate/img/logos/tonari_logo.jpeg"
				alt="Metronic Shop UI"></a> <a href="javascript:void(0);"
				class="mobi-toggler"><i class="fa fa-bars"></i></a>

			<!-- BEGIN NAVIGATION -->
			<div class="header-navigation">
				<ul>
					<li class="dropdown dropdown-megamenu"><a
						class="dropdown-toggle" data-toggle="dropdown" data-target="#"
						href="javascript:;"> 全体メニュー </a>
						<ul class="dropdown-menu">
							<li>
								<div class="header-navigation-content">
									<div class="row">
										<div class="col-md-3 header-navigation-col">
											<h4>カテゴリ</h4>
											<ul>
												<li><a href="/board/search?type=category&&keyword=1">日本語</a></li>
												<li><a href="/board/search?type=category&&keyword=2">JAVA</a></li>
												<li><a href="/board/search?type=category&&keyword=3">Python</a></li>
												<li><a href="/board/search?type=category&&keyword=4">Javascript</a></li>
												<li><a href="/board/search?type=category&&keyword=5">Spring</a></li>
												<li><a href="/board/search?type=category&&keyword=6">HTML5+CSS3</a></li>
												<li><a href="/board/search?type=category&&keyword=7">Database</a></li>
											</ul>
										</div>
										<div class="col-md-3 header-navigation-col">
											<h4>先生検索</h4>
											<ul>
												<li><a href="/board/search?type=orderby&&keyword=score&&snum=1">人気先生</a></li>
												<li><a href="/board/search?type=orderby&&keyword=teacher&&snum=0">新しい先生</a></li>
												<c:if test="${not empty nowUser }">
													<li><a href="/board/search?type=area&&keyword=${nowUser.nick }&&snum=2">周りの先生</a></li>
												</c:if>
											</ul>
										</div>
										<div class="col-md-3 header-navigation-col">
											<h4>掲示板</h4>
											<ul>
												<li><a href="/board/listboard?category=1">お知らせ</a></li>
												<li><a href="/board/listboard?category=2">イベント</a></li>
											</ul>
										</div>
										<div class="col-md-3 header-navigation-col">
											<h4>マイページ</h4>
											<ul>
												<li><a href="/mypage/studentinfo">個人情報修正</a></li>
												<li><a href="/mypage/like">お気に入りの先生</a></li>
												<li><a href="/mypage/payteacherList">私の先生</a></li>
												<li><a href="/mypage/subscription"><strong>先生に登録</strong></a></li>
											</ul>
										</div>
									</div>
								</div>
							</li>
						</ul></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="#" href="javascript:;">
							カテゴリ</a> <!-- BEGIN DROPDOWN MENU -->
						<ul class="dropdown-menu">
							<li><a href="/board/search?type=category&&keyword=1">日本語</a></li>
							<li><a href="/board/search?type=category&&keyword=2">JAVA</a></li>
							<li><a href="/board/search?type=category&&keyword=3">Python</a></li>
							<li><a href="/board/search?type=category&&keyword=4">Javascript</a></li>
							<li><a href="/board/search?type=category&&keyword=5">Spring</a></li>
							<li><a href="/board/search?type=category&&keyword=6">HTML5+CSS3</a></li>
							<li><a href="/board/search?type=category&&keyword=7">Database</a></li>
						</ul> <!-- END DROPDOWN MENU --></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="#" href="javascript:;">
							先生検索 </a> <!-- BEGIN DROPDOWN MENU -->
						<ul class="dropdown-menu">
							<li><a href="/board/search?type=orderby&&keyword=score&&snum=1">人気先生</a></li>
							<li><a href="/board/search?type=orderby&&keyword=teacher&&snum=0">新しい先生</a></li>
							<c:if test="${not empty nowUser }">
								<li><a href="/board/search?type=area&&keyword=${nowUser.nick }&&snum=2">周りの先生</a></li>
							</c:if>
						</ul> <!-- END DROPDOWN MENU --></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="#" href="javascript:;">
							掲示板 </a> <!-- BEGIN DROPDOWN MENU -->
						<ul class="dropdown-menu">
							<li><a href="/board/listboard?category=1">お知らせ</a></li>
							<li><a href="/board/listboard?category=2">イベント</a></li>
						</ul> <!-- END DROPDOWN MENU --></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="/mypage" href="/mypage">
							マイページ </a> <!-- BEGIN DROPDOWN MENU -->
						<ul class="dropdown-menu">

							<li><a href="/join/studentinfologintest">個人情報修正</a></li>
							<li><a href="/mypage/like">お気に入りの先生</a></li>
							<li><a href="/mypage/payteacherList">私の先生</a></li>
							<li><a href="/mypage/subscription"><strong>先生に登録</strong></a></li>
						</ul> <!-- END DROPDOWN MENU -->
					</li>

				</ul>
			</div>
			<!-- END NAVIGATION -->
		</div>
	</div>
	<!-- Header END -->

</body>