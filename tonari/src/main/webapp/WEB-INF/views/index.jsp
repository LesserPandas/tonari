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
					となりの<span class="title-appeal">せんせい</span> さがし
				</h1>
				<em>自分の周りに隠れている先生を探す</em>
			</div>
			<div class="search-box col-md-12"
				style="padding-left: 80px; margin: 80px 0 0">
				<form id="search" method="get" action="board/mainsearch">
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon btn-green">科目</span> <select
								class="form-control border-radius option-select ht-45" id="sel1"
								name="category_bno">
								<option value=>全体</option>
								<option value="1">日本語</option>
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
							<span class="input-group-addon btn-green">地域</span> <select
								class="form-control border-radius option-select ht-45" id="sel1"
								name="dong">
								<option value=>全体</option>
								<option>용두동</option>
								<option>선화동</option>
								<option>갈마동</option>
								<option>은행동</option>
							</select>
						</div>
					</div>
					<div class="col-md-5 search-mg-15">
						<div class="input-group">
							<input type="text" class="form-control ht-45" name="keyword"
								placeholder="入力" style="width: 435px; display: inline-block">
							<span class="input-group-btn">
								<button class="btn btn-primary btn-green ht-45" type="submit"
									style="width: 100px">検索</button>
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
					<li><a href="/board/search?type=category&&keyword=1" class="category-link underline green">日本語</a></li>
					<li><a href="/board/search?type=category&&keyword=2" class="category-link underline green">Java</a></li>
					<li><a href="/board/search?type=category&&keyword=3" class="category-link underline green">Python</a></li>
					<li><a href="/board/search?type=category&&keyword=4" class="category-link underline green">Javascript</a></li>
					<li><a href="/board/search?type=category&&keyword=5" class="category-link underline green">Spring</a></li>
					<li><a href="/board/search?type=category&&keyword=6" class="category-link underline green">HTML5+CSS3</a></li>
					<li><a href="/board/search?type=category&&keyword=7" class="category-link underline green">Database</a></li>
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
                  <li role="presentation" class="bg-white" >
                     <a href="#recommend" aria-controls="recommend" role="tab" data-toggle="tab" id="recommendtab">推薦</a>
                  </li>
                  <li role="presentation" class="bg-white " >
                     <a href="#hot" aria-controls="hot" role="tab" data-toggle="tab" id="hottab">人気</a>
                  </li>
                  <li role="presentation">
                     <a href="#new" aria-controls="new" role="tab" data-toggle="tab">新規</a>
                  </li>
                  <li role="presentation">
                     <a href="#location" aria-controls="location" role="tab" data-toggle="tab">私の周り</a>
                  </li>
               </ul>
               <!-- Tab panes -->
               <div class="tab-content">
                  <!-- 추천 상세내용 -->
                  <div role="tabpanel" class="tab-pane active" id="recommend">
                     <div class="col-md-12 sale-product">
                        <div class="owl-carousel owl-carousel5">
                           <c:forEach items="${bestlist}" var="bestlist">
                              <div class="product-item" style="height:350px;">
                                 <div style="height: 100%; width: 100%;display: flex; flex-direction: column; justify-content: space-between;display: flex; flex-direction: column; justify-content: space-between;">
                                    <div>
                                       <div style="text-align: right;">
                                          <span>点数 :&nbsp;${bestlist.score}</span>
                                       </div>
                                       <div class="pi-img-wrapper" style="overflow: hidden">
                                          <img src="${bestlist.image }" class="img-responsive" alt="">
                                          <div>
                                             <a href="board/info?teacher_bno=${bestlist.teacher_bno }"
                                                class=" btn-default fancybox-button"
                                                style="border: none; text-align: center; padding: 0; margin: 0;">
                                                <span>"<br>${bestlist.coment }<br>"
                                             </span>
                                             </a>
                                          </div>
                                       </div>
                                    </div>
                                    <div>
                                       <div class="teacherInfo" style="display:flex; width:100%; justify-content: space-between;">
                                          <div style="display:inline;">${bestlist.category_name}</div>
                                          <div>${bestlist.gu}&nbsp;${bestlist.dong}</div>
                                       </div>
                                       <div class="teacherInfo">
                                          <h3 style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; padding: 0;">
                                             <a href="board/info?teacher_bno=${bestlist.teacher_bno }" style="font-weight: bold; font-size: 18px;">${bestlist.title }</a>
                                          </h3>
                                          <p>${bestlist.nick }</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </c:forEach>
                        </div>
                     </div>
                     <!-- END SALE PRODUCT -->
                  </div>
                  <!-- 인기 상세내용 -->
                  <div role="tabpanel" class="tab-pane active" id="hot">
                     <div class="col-md-12 sale-product">
                        <div class="owl-carousel owl-carousel5">
                           <c:forEach items="${likelist}" var="likelist">
                              <div class="product-item" style="height:350px;">
                                 <div style="height: 100%; width: 100%;display: flex; flex-direction: column; justify-content: space-between;display: flex; flex-direction: column; justify-content: space-between;">
                                    <div>
                                       <div style="text-align: right;">
                                          <span>点数 :&nbsp;${likelist.score}</span>
                                       </div>
                                       <div class="pi-img-wrapper" style="overflow: hidden">
                                          <img src="${likelist.image }" class="img-responsive" alt="">
                                          <div>
                                             <a href="board/info?teacher_bno=${likelist.teacher_bno }"
                                                class=" btn-default fancybox-button"
                                                style="border: none; text-align: center; padding: 0; margin: 0;">
                                                <span>"<br>${likelist.coment }<br>"
                                             </span>
                                             </a>
                                          </div>
                                       </div>
                                    </div>
                                    <div>
                                       <div class="teacherInfo" style="display:flex; width:100%; justify-content: space-between;">
                                          <div style="display:inline;">${likelist.category_name}</div>
                                          <div>${likelist.gu}&nbsp;${likelist.dong}</div>
                                       </div>
                                       <div class="teacherInfo">
                                          <h3 style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; padding: 0;">
                                             <a href="board/info?teacher_bno=${likelist.teacher_bno }" style="font-weight: bold; font-size: 18px;">${likelist.title }</a>
                                          </h3>
                                          <p>${likelist.nick }</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </c:forEach>
                        </div>
                     </div>
                  </div>
                  <!-- 신규 상세내용 -->
                  <div role="tabpanel" class="tab-pane active" id="new">
                     <div class="col-md-12 sale-product">
                        <div class="owl-carousel owl-carousel5">
                           <c:forEach items="${newlist}" var="newlist">
                              <div class="product-item" style="height:350px;">
                                 <div style="height: 100%; width: 100%; display: flex; flex-direction: column; justify-content: space-between;">
                                    <div>
                                       <div style="text-align: right;">
                                          <span>点数 :&nbsp;${newlist.score}</span>
                                       </div>
                                       <div class="pi-img-wrapper" style="overflow: hidden">
                                          <img src="${newlist.image }" class="img-responsive" alt="">
                                          <div>
                                             <a href="board/info?teacher_bno=${newlist.teacher_bno }"
                                                class=" btn-default fancybox-button"
                                                style="border: none; text-align: center; padding: 0; margin: 0;">
                                                <span>"<br>${newlist.coment }<br>"
                                             </span>
                                             </a>
                                          </div>
                                       </div>
                                    </div>
                                    <div>
                                       <div class="teacherInfo" style="display:flex; width:100%; justify-content: space-between;">
                                          <div style="display:inline;">${newlist.category_name}</div>
                                          <div>${newlist.gu}&nbsp;${newlist.dong}</div>
                                       </div>
                                       <div class="teacherInfo">
                                          <h3 style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; padding: 0;">
                                             <a href="board/info?teacher_bno=${newlist.teacher_bno }" style="font-weight: bold; font-size: 18px;">${newlist.title }</a>
                                          </h3>
                                          <p>${newlist.nick }</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </c:forEach>
                        </div>
                     </div>
                  </div>
                  <!-- 내주변 상세내용 -->
                  <div role="tabpanel" class="tab-pane active" id="location">
                     <div class="col-md-12 sale-product">
                        <c:if test="${empty locationlist}">
                           <h2 style="text-align: center;">ログインが必要にされるサービスです</h2>
                        </c:if>
                        <div class="owl-carousel owl-carousel5">
                           <c:forEach items="${locationlist}" var="locationlist">
                              <div class="product-item" style="height:350px;">
                                 <div style="height: 100%; width: 100%;display: flex; flex-direction: column; justify-content: space-between;display: flex; flex-direction: column; justify-content: space-between;">
                                    <div>
                                       <div style="text-align: right;">
                                          <span>点数 :&nbsp;${locationlist.score}</span>
                                       </div>
                                       <div class="pi-img-wrapper" style="overflow: hidden">
                                          <img src="${locationlist.image }" class="img-responsive" alt="">
                                          <div>
                                             <a href="board/info?teacher_bno=${locationlist.teacher_bno }"
                                                class=" btn-default fancybox-button"
                                                style="border: none; text-align: center; padding: 0; margin: 0;">
                                                <span>"<br>${locationlist.coment }<br>"
                                             </span>
                                             </a>
                                          </div>
                                       </div>
                                    </div>
                                    <div>
                                       <div class="teacherInfo" style="display:flex; width:100%; justify-content: space-between;">
                                          <div style="display:inline;">${locationlist.category_name}</div>
                                          <div>${locationlist.gu}&nbsp;${locationlist.dong}</div>
                                       </div>
                                       <div class="teacherInfo">
                                          <h3 style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; padding: 0;">
                                             <a href="board/info?teacher_bno=${locationlist.teacher_bno }" style="font-weight: bold; font-size: 18px;">${locationlist.title }</a>
                                          </h3>
                                          <p>${locationlist.nick }</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </c:forEach>
                        </div>
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
					<div class="carousel slide" id="fade-quote-carousel" data-ride="carousel">
						<!-- Carousel items -->
						<div class="carousel-inner">
							<div class="active item">
								<c:forEach var="review" items="${review }">
									<div class="col-md-3 border">
										<blockquote>
											<div>
												<h4 class="review-title">${review.nick }</h4>
												<span class="starpoint">${review.star }</span>
											</div>
										</blockquote>
										<div>${review.content }</div>
									</div>
								</c:forEach>
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
				<div style="padding: 10px; width: 50%; float: left; padding: 30px">
					<h2>공지사항</h2>
					<table class="table">
						<colgroup>
							<col style="width:15%;">
							<col style="width:65%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${notice }">
								<tr>
									<td>${notice.bno }</td>
									<td>
										<a href="board/viewboard?board_bno=${notice.bno }">${notice.title }</a>
									</td>
									<td>${notice.write_date }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div style="padding: 10px; width: 50%; float: left; padding: 30px">
					<h2>이벤트</h2>
					<table class="table">
						<colgroup>
							<col style="width:15%;">
							<col style="width:65%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
						</thead>
						<tbody>
							<c:forEach var="event" items="${event }">
								<tr>
									<td>${event.bno }</td>
									<td>
										<a href="board/viewboard?board_bno=${event.bno }">${event.title }</a>
									</td>
									<td>${event.write_date }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp"%>
<script>
	$(function(){
		$("#hottab").click();
		$("#recommendtab").click();
	})
</script>