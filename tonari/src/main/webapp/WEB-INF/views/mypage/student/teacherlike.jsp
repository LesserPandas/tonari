<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    .goods-page1{
    font: 16px "PT Sans Narrow", sans-serif;
    text-transform: uppercase;
    border-bottom: solid 1px #ecebeb;
    padding-bottom: 10px;
    text-align:center;
    }
    </style>
<%@ include file="../../header.jsp" %>
    <div class="main">
      <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>좋아요한 선생 목록</h1>
            <div class="goods-page">
              <div class="goods-data clearfix">
                <div class="table-wrapper-responsive">
                
                <table summary="Shopping cart">
                	
                  <tr>
                    <th class="goods-page-image goods-page1">사진</th>
                    <th class="goods-page-description goods-page1">성명</th>
                    <th class="goods-page-ref-no goods-page1">과목</th>
                    <th class="goods-page-quantity goods-page1">기간(일)</th>
                    <th class="goods-page-price goods-page1">가격</th>
                    <th class="goods-page-total goods-page1" colspan="2">총 가격  </th>
                     <th class="goods-page-total goods-page1" colspan="2"></th>
                  </tr>
                  <tr>
                    <td class="goods-page-image ">
                      <a href="javascript:;"><img src="assets/pages/img/products/model3.jpg" alt="Berry Lace Dress"></a>
                    </td>
                    <td class="goods-page-description">
                       <p><strong>이름</strong></p>
                      <h3>닉네임</h3>
                     
                    </td>
                    <td class="goods-page-ref-no">
                      javc2133
                    </td>
                    <td class="goods-page-quantity">
                      
                      <div class="product-quantity">
                      	<input type="text" name="quantity" value="1" class="quantity   " 
									style=" border: none;    background: #edeff1 !important;    font: 300 23px 'Open Sans', sans-serif;    color: #647484;    height: 38px;    width: 50px;    text-align: center;    padding: 5px;">
									
									<div>
                      <button class="minus" type="button"style="background:#67bd3c;">-</button>
                      <button class="plus" type="button" style="background:#67bd3c;">+</button>
                      </div>	
						</div>
									
						
                    </td>
                    <td class="goods-page-price">
                      <strong>1818<span>円</span></strong>
                      
                    </td>
                    <td class="goods-page-total" style="text-align: right;">
                      <strong class="total">1818<span>円</span></strong>
                    </td>
                    <td class="del-goods-col">
                      <a class="del-goods" href="javascript:;"></a>
                    </td>
                  </tr>
                
                
                </table>
                </div>

                <div class="shopping-total">
                  <ul>
                    <li>
                      <em>1회 수강료</em>
                      <strong class="price"><span>$</span>47.00</strong>
                    </li>
                    <li>
                      <em>강의일 </em>
                     
                      <strong class="price">3<span>일</span></strong>
                    </li>
                    <li class="shopping-total-price">
                      <em>Total</em>
                      <strong class="price"><span>$</span>50.00</strong>
                    </li>
                  </ul>
                </div>
              </div>
              <button class="btn btn-default" type="submit">다른 선생찾으러가기 <i class="fa fa-shopping-cart"></i></button>
              <button class="btn btn-primary" type="submit">결제 <i class="fa fa-check"></i></button>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

<!-- 한준희 노필요  -->
        <!-- BEGIN SIMILAR PRODUCTS -->
       <!--  <div class="row margin-bottom-40">
          <div class="col-md-12 col-sm-12">
            <h2>Most popular products</h2>
            <div class="owl-carousel owl-carousel4">
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                  <div class="pi-price">$29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                  <div class="sticker sticker-new"></div>
                </div>
              </div>
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">Berry Lace Dress2</a></h3>
                  <div class="pi-price">$29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                </div>
              </div>
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="assets/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="assets/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">Berry Lace Dress3</a></h3>
                  <div class="pi-price">$29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                </div>
              </div>
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="assets/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="assets/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">Berry Lace Dress4</a></h3>
                  <div class="pi-price">$29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                  <div class="sticker sticker-sale"></div>
                </div>
              </div>
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">Berry Lace Dress5</a></h3>
                  <div class="pi-price">$29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                </div>
              </div>
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">Berry Lace Dress6</a></h3>
                  <div class="pi-price">$29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                </div>
              </div>
            </div>
          </div>
        </div> -->
        <!-- 한준희 노필요  -->
        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>

    <%@ include file="../../footer.jsp" %>