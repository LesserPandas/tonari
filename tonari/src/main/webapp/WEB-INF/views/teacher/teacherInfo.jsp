<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>
<link rel="stylesheet" href="css/teacher.css">
    
    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">ㅇㅇㅇ선생님</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
           <%@ include file ="side_board.jsp" %>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <div class="product-page">
              <div class="row">
                <div class="col-md-6 col-sm-6">
                  <div class="product-main-image product-main-image-overflow">
                    <img src="images/home/mainvisual.png" alt="Cool green dress with red bell" class="img-responsive">
                  </div>
                  <div class="product-other-images">
                    <a href="images/home/mainvisual.png" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="images/home/mainvisual.png"></a>
                    <a href="images/home/tahoe-ZUq6sKVnPfg-unsplash.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="images/home/tahoe-ZUq6sKVnPfg-unsplash.jpg"></a>
                    <a href="assets/pages/img/products/model5.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model5.jpg"></a>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                <div class="pull-right"><span>별점 
                  		<i class="bi bi-star-fill"></i>
                  	</span></div>
                  <h1>프로필 타이틀</h1>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                    <strong>닉네임</strong>
                    </div>
                  </div>
                  <div class="description">
                    <p>간단 소개(한 두줄)</p>
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">과목 :</label>
                       <strong style=";">소맥말이</strong>
                    </div>
                  </div>
                  <div style="margin-bottom: 10px;">
                  	<p>가능 한 날짜</p>
                  	<table class="teacherdate">
                  		<tr>
                  			<th>일</th>
                  			<th>월</th>
                  			<th>화</th>
                  			<th>수</th>
                  			<th>목</th>
                  			<th>금</th>
                  			<th>토</th>
                  		</tr>
                  		<tr>
                  			<td>O</td>
                  			<td>O</td>
                  			<td>X</td>
                  			<td>X</td>
                  			<td>O</td>
                  			<td>X</td>
                  			<td>X</td>
                  		</tr>
                  	</table>
                  </div>
                  <!-- 
                  <div>
	                  <ul class="social-icons">
	                    <li><a class="facebook" data-original-title="facebook" href="javascript:;"></a></li>
	                    <li><a class="twitter" data-original-title="twitter" href="javascript:;"></a></li>
	                    <li><a class="googleplus" data-original-title="googleplus" href="javascript:;"></a></li>
	                    <li><a class="evernote" data-original-title="evernote" href="javascript:;"></a></li>
	                    <li><a class="tumblr" data-original-title="tumblr" href="javascript:;"></a></li>
	                  </ul>
	                 </div>
	                  -->
                  <div class="pull-right">
                  	<a href="#" class="button largeButton">문의</a>
                  	<a href="#" class="button largeButton">찜하기</a>
                  	<a href="#" class="button largeButton">결제</a>
                  </div>
                  	
                </div>

                <div class="product-page-content">
                  <ul id="myTab" class="nav nav-tabs">
                    <li><a href="#Description" data-toggle="tab">강사 자기 소개</a></li>
                    <li class="active"><a href="#Reviews" data-toggle="tab">리뷰 (2)</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade" id="Description">
                      <p>자기 소개 글(없어도 된다면 삭제)</p>
                    </div>
                    <div class="tab-pane fade in active" id="Reviews">
                      <!--<p>There are no reviews for this product.</p>-->
                      <div class="review-item clearfix">
                        <div class="review-item-submitted">
                          <strong>닉네임</strong><span>별점</span>
                          <em>30/12/2013</em>
                          <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>                                              
                        <div class="review-item-content">
                            <p>댓글 내용</p>
                        </div>
                      </div>
                      <div class="review-item clearfix">
                        <div class="review-item-submitted">
                          <strong>Mary</strong>
                          <em>13/12/2013 - 17:49</em>
                          <div class="rateit" data-rateit-value="2.5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>                                              
                        <div class="review-item-content">
                            <p>Sed velit quam, auctor id semper a, hendrerit eget justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis vel arcu pulvinar dolor tempus feugiat id in orci. Phasellus sed erat leo. Donec luctus, justo eget ultricies tristique, enim mauris bibendum orci, a sodales lectus purus ut lorem.</p>
                        </div>
                      </div>

                      <!-- BEGIN FORM-->
                      <form action="#" class="reviews-form" role="form">
                        <h2>Write a review</h2>
                        <div class="form-group">
                          <label for="name">닉네임 <span class="require">*</span></label>
                          <input type="text" class="form-control" id="name" value="닉네임 고정">
                        </div>
                        
                        <div class="form-group">
                          <label for="review">Review <span class="require">*</span></label>
                          <textarea class="form-control" rows="8" id="review"></textarea>
                        </div>
                        <div class="form-group">
                          <label for="email">Rating</label>
                          <input type="range" value="4" step="0.25" id="backing5">
                          <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                          </div>
                        </div>
                        <div class="padding-top-20">                  
                          <button type="submit" class="btn btn-primary">Send</button>
                        </div>
                      </form>
                      <!-- END FORM--> 
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
<%@ include file ="../footer.jsp" %>