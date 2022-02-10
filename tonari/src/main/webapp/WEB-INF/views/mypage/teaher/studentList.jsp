<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>

</style>
<%@ include file ="header.jsp" %>
    
    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">My Wish List</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <%@ include file ="side.jsp" %>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <h1>내 학생 목록</h1>
            <div class="goods-page">
              <div class="goods-data clearfix">
                <div class="table-wrapper-responsive">
                <table summary="Shopping cart">
                  <tr>
                    <th class="goods-page-image">이름</th>
                    <th class="goods-page-description">설명</th>
                    <th class="goods-page-stock">종목</th>
                    <th class="goods-page-price" colspan="2">기간</th>
                  </tr>
                  <tr>
                    <td class="goods-page-stock">
                      		닉네임
                    </td>
                    <td class="goods-page-description">
                      <h3><a href="javascript:;">닉네임</a></h3>
                     
                    </td>
                    <td class="goods-page-stock">
                      		일본어
                    </td>
                    <td class="goods-page-price">
                      <strong><span></span>21.03.08 ~ 21.07.30</strong>
                    </td>
                    <td class="del-goods-col">
                      <a class="del-good" href="javascript:;">&nbsp;</a>
                      
                    </td>
                  </tr>
                 
                </table>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>

    

    <!-- END STEPS -->
<%@ include file ="footer.jsp" %>