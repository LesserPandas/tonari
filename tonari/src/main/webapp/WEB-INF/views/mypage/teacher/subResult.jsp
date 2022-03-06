<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
    <div class="main">
      <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>나의 구독 내역</h1>
            <div class="goods-page">
              <div class="goods-data clearfix">
                <div class="table-wrapper-responsive">
                
                <table summary="Shopping cart">
                  <tr>
                    <th class="goods-page-image">사진</th>
                    <th class="goods-page-description">설명</th>
                    <th class="goods-page-ref-no">종목</th>
                    <th class="goods-page-quantity">구독시작한 날짜</th>
                    <th class="goods-page-price">구독 기간</th>
                    <th class="goods-page-total" colspan="2">결제 가격</th>
                  </tr>
                  <tr>
                    <td class="goods-page-image">
                      <a href="javascript:;"><img id="preview-image" src="${tvo.image }" ><!-- alt="Berry Lace Dress" --></a>
                    </td>
                    <td class="goods-page-description">
                      <h3>${nowUser.nick }</h3>
                      <p><strong>한마디</strong>${tvo.coment }</p>
                      <a href="/mypage/teacherUpdate">상세 정보</a>
                    </td>
                    <td class="goods-page-ref-no">
                      ${tvo.category_name }
                    </td>
                    <td class="goods-page-price">
                      <strong>${subResult.write_date}</strong>
                    </td>
                    <td class="goods-page-price">
                      <strong>${subResult.submonth}<span>개월</span></strong>
                    </td>
                    <td class="goods-page-total">
                      <strong class="amount"><span>円</span></strong>
                      
                      
                    </td>
                    <td class="del-goods-col">
                      <a class="del-goods" href="javascript:;">&nbsp;</a>
                    </td>
                  </tr>
                 
                
                </table>
                </div>

                
              </div>
            
            </div>
          </div>
      
        </div>
 

      </div>
    </div>
<script>
/* var submonth = null;
var submonth2 = null;
function payMonth(){
	submonth = ${subResult.submonth};
	submonth2 = parseInt(submonth);
	var payMonth = submonth2*1000;
	$(".payMonth").html(payMonth);
}; */

var month =${subResult.submonth};
var amount= null;
amount = 1000 * month;
console.log(amount);
/* $(document).ready(function() {
	var total = function(n) {
		var month =${subResult.submonth};
		
		month = parseInt(month);
		

		amount = month*1000;
		
		$(".amount").html(amount);
	}

}); */

</script>
    <%@ include file="../../footer.jsp" %>