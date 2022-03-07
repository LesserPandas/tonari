<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/resources/custom/css/board.css">

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li class="active">先生サーチ</li>
		</ul>
		<!-- BEGIN SIDEBAR & CONTENT -->

		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->
			<div class="sidebar col-md-3 col-sm-5">
				<div class="sidebar-filter margin-bottom-25">
					<ul class="list-group margin-bottom-25 sidebar-menu">
						<c:forEach items="${sidelist }" var="sidelist">
							<li class="list-group-item clearfix"><a
								href="/board/search?type=category&&keyword=${sidelist.category_bno}">
									<i class="fa fa-angle-right"></i>${sidelist.category_name }
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- END SIDEBAR -->
			<!-- BEGIN CONTENT -->
			<div class="col-md-9 col-sm-7">
				<div class="content-search margin-bottom-20">
					<div class="row">
						<div class="col-md-6">
							<h1>
								<em>先生を</em>探してみよう！
							</h1>
						</div>
						<div class="col-md-6">
							<form action="search" method="get">
								<div class="input-group">
									<input type="text" placeholder="先生を探してみよう！"
										class="form-control" name="keyword" id="keyword"> <span
										class="input-group-btn">
										<button class="btn btn-primary" type="submit">Search</button>
									</span>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row list-view-sorting clearfix">
					<div class="col-md-2 col-sm-2 list-view">
						<a href="javascript:;"><i class="fa fa-th-large"></i></a> <a
							href="javascript:;"><i class="fa fa-th-list"></i></a>
					</div>
					<div class="col-md-10 col-sm-10">
						<div class="pull-right">
							<label class="control-label">順番</label> <select id="orderby"
								class="form-control input-sm"
								onchange="if(this.value) location.href=(this.value);">
								<option
									value="/board/search?type=orderby&&keyword=teacher&&snum=0" selected>新規</option>
								<option
									value="/board/search?type=orderby&&keyword=score&&snum=1">点数</option>
								<c:if test="${not empty nowUser }">
									<option value="/board/search?type=area&&keyword=${nowUser.nick }&&snum=2">近い先生</option>
								</c:if>
							</select>
						</div>
					</div>
				</div>
				<!-- BEGIN PRODUCT LIST -->
				<div class="row product-list">
					<!-- PRODUCT ITEM START -->

					<!-- list.board_bno > list.teacher_bno -->
					<c:if test="${empty list}">
						検索できた先生がいません
					</c:if>
					<c:forEach items="${list}" var="list">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="product-item" style="display: flex; flex-direction: column;">
								<div style="text-align: right;">
									<span>点数 :&nbsp;${list.score}</span>
								</div>
								<div class="pi-img-wrapper" style="overflow: hidden">
									<img src="${list.image }" class="img-responsive" alt="">
									<div>
										<a href="info?teacher_bno=${list.teacher_bno }"
											class=" btn-default fancybox-button"
											style="border: none; text-align: center; padding: 0; margin: 0;">
											<span>"<br>${list.coment }<br>"
										</span>
										</a>
									</div>
								</div>
								<div style="margin-top: auto">
									<div class="teacherInfo">
										<div style="display: inline">${list.category_name}</div>
										<div class="pull-right">${list.gu}&nbsp;${list.dong}</div>
									</div>
									<div class="teacherInfo">
										<c:if test="${not empty nowUser }">
											<button class="pull-right squareButton likeButton "
												id="teacher_${list.teacher_bno}" onclick="like(${list.teacher_bno},${nowUser.bno })">♥
											</button>
										</c:if>
										<h3 style="overflow:hidden;  text-overflow:ellipsis; white-space:nowrap; padding: 0;">
											<a href="info?teacher_bno=${list.teacher_bno }" style="font-weight: bold; font-size: 18px;">${list.title }</a>
										</h3>
										<p>${list.nick }</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- PRODUCT ITEM END -->
				</div>
				<!-- END PRODUCT LIST -->
				<!-- BEGIN PAGINATOR -->
				<div class="row">
					<div class="col-md-12 col-sm-12" style="text-align: center">
						<ul class="pagination paging">
							<c:if test="${pageMaker.prev }">
								<li><a href="${pageMaker.startPage-1 }">&laquo;</a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage }">
								<li><a
									href="search?pageNum=${num }&&type=${type}&&keyword=${keyword}">${num }</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li><a href="${pageMaker.startPage+1 }">&raquo;</a></li>
							</c:if>
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


<script> //selected						
	function Request(){
	    var requestParam ="";
		 
		//getParameter 펑션
		this.getParameter = function(param){
	        //현재 주소를 decoding
	        var url = unescape(location.href); 
	        //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다. 
	        var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&"); 
	        
	        for(var i = 0 ; i < paramArr.length ; i++){
	           var temp = paramArr[i].split("="); //파라미터 변수명을 담음
	        
	           if(temp[0].toUpperCase() == param.toUpperCase()){
	             // 변수명과 일치할 경우 데이터 삽입
	             requestParam = paramArr[i].split("=")[1]; 
	             break;
	           }
	        }
	        return requestParam;
	    }
	}

	// Request 객체 생성
	var request = new Request();
	// test 라는 파라메터 값을 얻기
	var option = request.getParameter("snum");
	$("#orderby option:eq("+option+")").prop("selected",true);
</script>
<script> //likebutton

$(document).ready(function(){
	var member_bno = ${nowUser.bno};
	if(member_bno != null){
		$.ajax({
			type:"post",
			url:"/board/chklike",
			dataType: "json",
			data:{"member_bno":member_bno},
			success:function(data){
					for(var i=0; i<data.length;i++){
						$("#teacher_"+data[i].teacher_bno).addClass("likeButtonActive");
					}
			}
		})
	}
})

</script>
<script src="/resources/custom/js/board.js" type="text/javascript"></script>
<%@ include file="../footer.jsp"%>