<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
       
    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">Search result</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
      
          <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
           <%@ include file ="side_board.jsp" %>
          <!-- END SIDEBAR -->
          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <div class="content-search margin-bottom-20">
              <div class="row">
                <div class="col-md-6">
                  <h1><em>개꿀 선생님</em>을 찾아보자!</h1>
                </div>
                <div class="col-md-6">
                  <form action="#">
                    <div class="input-group">
						<input type="text" placeholder="개꿀 선생님을 검색해보자" class="form-control">
						<span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">Search</button>
                      </span>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="row list-view-sorting clearfix">
              <div class="col-md-2 col-sm-2 list-view">
                <a href="javascript:;"><i class="fa fa-th-large"></i></a>
                <a href="javascript:;"><i class="fa fa-th-list"></i></a>
              </div>
              <div class="col-md-10 col-sm-10">
                <div class="pull-right">
                  <label class="control-label">정렬</label>
                  <select class="form-control input-sm">
                    <option value="new" selected="selected">신규</option>
                    <option value="area">가까운 지역</option>
                    <option value="star">별점</option>
                  </select>
                </div>
              </div>
            </div>
            <!-- BEGIN PRODUCT LIST -->
            <div class="row product-list">
              <!-- PRODUCT ITEM START -->
              <div class="col-md-3 col-sm-4 col-xs-6">
                <div class="product-item">
	                <div style="text-align: right;">
	                	<span>별점</span>4.1
	                </div>
                  <div class="pi-img-wrapper">
                    <img src="assets/pages/img/products/model1.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="assets/pages/img/products/model1.jpg" class="btn btn-default fancybox-button">찜하기</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">강사명</a></h3>
                  <div class="pi-price">과목명<br>지역</div>
                  <a href="info" class="btn btn-default add2cart">프로필보기</a>
                </div>
              </div>
              <!-- PRODUCT ITEM END -->
            </div>
            <!-- END PRODUCT LIST -->
            <!-- BEGIN PAGINATOR -->
            <div class="row">
              <div class="col-md-12 col-sm-12" style="text-align: center">
                <ul class="pagination">
                  <li><a href="javascript:;">&laquo;</a></li>
                  <li><a href="javascript:;">1</a></li>
                  <li><span>2</span></li>
                  <li><a href="javascript:;">3</a></li>
                  <li><a href="javascript:;">4</a></li>
                  <li><a href="javascript:;">5</a></li>
                  <li><a href="javascript:;">&raquo;</a></li>
                </ul>
              </div>
            </div>
            <!-- END PAGINATOR -->
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
<%@ include file = "../footer.jsp"%>