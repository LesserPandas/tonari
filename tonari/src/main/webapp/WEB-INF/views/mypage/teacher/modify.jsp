<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../header.jsp" %>
    
    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">Cool green dress with red bell</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
           <%@ include file ="../../side.jsp" %>
         
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <div class="product-page">
              <div class="row">
                <div class="col-md-6 col-sm-6" >
                  <div class="product-main-image">
                    <img src="assets/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive" data-BigImgsrc="assets/pages/img/products/model7.jpg">
                  </div>
                  <div class="product-other-images">
                    <a href="assets/pages/img/products/model3.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model3.jpg"></a>
                    <a href="assets/pages/img/products/model4.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model4.jpg"></a>
                    <a href="assets/pages/img/products/model5.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model5.jpg"></a>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                  <h1>닉네임</h1>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                    <input type="text" class="" id="name" value="1회당 수업료" style="
                 	   text-align: center;
    					width: 125px;
					    background-color: #fff;
					    background-image: none;
					    border: 1px solid #ccc;
					    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
					    border-color: #dbdbdb;
					    color: #777;
					    font: 16px Arial, sans-serif;
					    box-shadow: none;
					    padding-top: 0px;
						height: 25px;	">
						<strong>円</strong>
                      
                    </div>
                    <div class="availability">
                      Availability: <strong>In Stock</strong>
                    </div>
                  </div>
                  <div class="description">
                     <textarea class="form-control" rows="8" id="review"></textarea>
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">종목 :</label>
                       <select class="form-control input-sm">
                        <option>자바</option>
                        <option>jsp</option>
                        <option>spring</option>
                        <option>coding</option>
                        <option>nihonn</option>
                      </select>
                    </div>
                    <div class="pull-left">
                      <label class="control-label">암거나 넣자</label>
                      <select class="form-control input-sm">
                        <option>Red</option>
                        <option>Blue</option>
                        <option>Black</option>
                      </select>
                    </div>
                  </div>
                 
                
                  
                </div>

                <div class="product-page-content">
                  <ul id="myTab" class="nav nav-tabs">
                   
                    <li class="active"><a href="#Reviews" data-toggle="tab">자기소개</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade" id="Description">
                      <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. </p>
                    </div>
                    <div class="tab-pane fade" id="Information">
                      <table class="datasheet">
                        <tr>
                          <th colspan="2">Additional features</th>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">Value 1</td>
                          <td>21 cm</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">Value 2</td>
                          <td>700 gr.</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">Value 3</td>
                          <td>10 person</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">Value 4</td>
                          <td>14 cm</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">Value 5</td>
                          <td>plastic</td>
                        </tr>
                      </table>
                    </div>
                    <div class="tab-pane fade in active" id="Reviews">
                      <!--<p>There are no reviews for this product.</p>-->
                     
                      

                      <!-- BEGIN FORM-->
                      <form action="#" class="reviews-form" role="form">
                        <h2>자기소개</h2>
                        <div class="form-group">
                          <label for="name">닉네임 <span class="require">*</span></label>
                          <input type="text" class="form-control" id="name" value="닉네임 고정">
                        </div>
                        
                        <div class="form-group">
                          <label for="review">자기소개 <span class="require">*</span></label>
                          <textarea class="form-control" rows="8" id="review"></textarea>
                        </div>
                       
                        <div class="padding-top-20">                  
                          <button type="submit" class="btn btn-primary">저장</button>
                        </div>
                      </form>
                      <!-- END FORM--> 
                    </div>
                  </div>
                </div>

                <div class="sticker sticker-sale"></div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

        <!-- BEGIN SIMILAR PRODUCTS -->
       
      </div>
    </div>
<%@ include file ="../../footer.jsp" %>