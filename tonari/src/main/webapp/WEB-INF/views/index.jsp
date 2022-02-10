<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>



<div class="title-wrapper">
	<!-- 메인 배너 이미지 -->
	<div class="container">
		<div class="container-inner col-md-4">
			<h1>
				내 주변 <span>선생님</span> 찾기
			</h1>
			<em>내 주변에 숨어있는 선생님을 찾아보세요!</em>
		</div>
		<div class="col-md-1"></div>
		<div class="search-box col-md-6">
			<form action="#">
				<div class="input-group mg-top-50">
					<input type="text" placeholder="Search" class="form-control h-40">
					<span class="input-group-btn">
						<button class="btn btn-primary h-40" type="submit">Search</button>
					</span>
				</div>
			</form>
		</div>

	</div>
</div>


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
								<!-- 선생님 -->
								<div>
									<!-- 선생님 -->
									<div class="product-item">
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model1.jpg"
												class="img-responsive" alt="Berry Lace Dress">
											<div>
												<a href="/resources/assets/pages/img/products/model1.jpg"
													class="btn btn-default fancybox-button">Zoom</a> <a
													href="#product-pop-up"
													class="btn btn-default fancybox-fast-view">View</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">Berry Lace Dress</a>
										</h3>
										<div class="pi-price">$29.00</div>
										<a href="javascript:;" class="btn btn-default add2cart">Add
											to cart</a>
										<div class="sticker sticker-sale"></div>
									</div>
								</div>
								<div>
									<!-- 선생님 -->
									<div class="product-item">
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model2.jpg"
												class="img-responsive" alt="Berry Lace Dress">
											<div>
												<a href="/resources/assets/pages/img/products/model2.jpg"
													class="btn btn-default fancybox-button">Zoom</a> <a
													href="#product-pop-up"
													class="btn btn-default fancybox-fast-view">View</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">Berry Lace Dress2</a>
										</h3>
										<div class="pi-price">$29.00</div>
										<a href="javascript:;" class="btn btn-default add2cart">Add
											to cart</a>
									</div>
								</div>
								<div>
									<!-- 선생님 -->
									<div class="product-item">
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model6.jpg"
												class="img-responsive" alt="Berry Lace Dress">
											<div>
												<a href="/resources/assets/pages/img/products/model6.jpg"
													class="btn btn-default fancybox-button">Zoom</a> <a
													href="#product-pop-up"
													class="btn btn-default fancybox-fast-view">View</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">Berry Lace Dress2</a>
										</h3>
										<div class="pi-price">$29.00</div>
										<a href="javascript:;" class="btn btn-default add2cart">Add
											to cart</a>
									</div>
								</div>
								<div>
									<!-- 선생님 -->
									<div class="product-item">
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model4.jpg"
												class="img-responsive" alt="Berry Lace Dress">
											<div>
												<a href="/resources/assets/pages/img/products/model4.jpg"
													class="btn btn-default fancybox-button">Zoom</a> <a
													href="#product-pop-up"
													class="btn btn-default fancybox-fast-view">View</a>
											</div>
										</div>
										<h3>
											<a href="javascript:;">Berry Lace Dress4</a>
										</h3>
										<div class="pi-price">$29.00</div>
										<a href="javascript:;" class="btn btn-default add2cart">Add
											to cart</a>
										<div class="sticker sticker-new"></div>
									</div>
								</div>
								<div>
									<!-- 선생님 -->
									<div class="product-item">
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model5.jpg"
												class="img-responsive" alt="Berry Lace Dress">
											<div>
												<a href="/resources/assets/pages/img/products/model5.jpg"
													class="btn btn-default fancybox-button">Zoom</a> <a
													href="#product-pop-up"
													class="btn btn-default fancybox-fast-view">View</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">Berry Lace Dress5</a>
										</h3>
										<div class="pi-price">$29.00</div>
										<a href="javascript:;" class="btn btn-default add2cart">Add
											to cart</a>
									</div>
								</div>
								<div>
									<!-- 선생님 -->
									<div class="product-item">
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model3.jpg"
												class="img-responsive" alt="Berry Lace Dress">
											<div>
												<a href="/resources/assets/pages/img/products/model3.jpg"
													class="btn btn-default fancybox-button">Zoom</a> <a
													href="#product-pop-up"
													class="btn btn-default fancybox-fast-view">View</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">Berry Lace Dress3</a>
										</h3>
										<div class="pi-price">$29.00</div>
										<a href="javascript:;" class="btn btn-default add2cart">Add
											to cart</a>
									</div>
								</div>
								<div>
									<!-- 선생님 -->
									<div class="product-item">
										<div class="pi-img-wrapper">
											<img src="/resources/assets/pages/img/products/model7.jpg"
												class="img-responsive" alt="Berry Lace Dress">
											<div>
												<a href="/resources/assets/pages/img/products/model7.jpg"
													class="btn btn-default fancybox-button">Zoom</a> <a
													href="#product-pop-up"
													class="btn btn-default fancybox-fast-view">View</a>
											</div>
										</div>
										<h3>
											<a href="shop-item.html">Berry Lace Dress3</a>
										</h3>
										<div class="pi-price">$29.00</div>
										<a href="javascript:;" class="btn btn-default add2cart">Add
											to cart</a>
									</div>
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

	<div class="container">
		<div class="row">
			<div class="col-md-3">div</div>
			<div class="col-md-3">div</div>
			<div class="col-md-3">div</div>
			<div class="col-md-3">div</div>
			<div class="col-md-3">div</div>
			<div class="col-md-3">div</div>
			<div class="col-md-3">div</div>
			<div class="col-md-3">div</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div style="width:50%; float:left">
					<div style="height:50%">a</div>
					<div style="height:50%">b</div>
				</div>
				<div style="width:50%; height: float:right">c</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>
