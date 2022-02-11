<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../../header.jsp"%>


<div class="main">
	<div class="container">

		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li><a href="">마이페이지</a></li>
			<li class="active">선생님 등록</li>
		</ul>
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->
			<%@ include file="../../side.jsp"%>

			<!-- END SIDEBAR -->

			<!-- BEGIN CONTENT -->
			<div class="col-md-9 col-sm-7">
				<div class="product-page">
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="image-container">
								<img style="display: block; max-width: 100%; height: auto;"
									id="preview-image">

							</div>

						</div>
						<div class="col-md-6 col-sm-6">

							<h1>선생님 정보 입력</h1>
							<div class="price-availability-block clearfix">
								<div class="price">
									<strong>닉네임 </strong><strong>&nbsp;이름</strong>
								</div>
							</div>
							<div class="description">
								<div class="form-group">
									<label for="name">선생님의 한마디 <span class="require">*</span></label>
									<input type="text" class="form-control" id="text"
										placeholder="20글자 내외로 적으세요!">
								</div>
							</div>
							<div class="product-page-options">
								<div class="pull-left">
									<label class="control-label">과목 :</label> <select
										class="form-control input-sm">
										<option>자바</option>
										<option>jsp</option>
										<option>spring</option>
										<option>coding</option>
										<option>nihonn</option>
									</select>
								</div>

								<div class="pull-left">
									<label class="control-label">지역 :</label> <strong style="">00동</strong>
								</div>

							</div>


							<div class="form-group">
								<p>수업이 가능한 날짜를 선택해 주세요!</p>
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
									<tr class="">
										<td><input type="checkbox" name="checker" id="checker1"><label
											for="checker1"></label></td>
										<td><input type="checkbox" name="checker" id="checker2"><label
											for="checker2"></label></td>
										<td><input type="checkbox" name="checker" id="checker1"><label
											for="checker3"></label></td>
										<td><input type="checkbox" name="checker" id="checker2"><label
											for="checker4"></label></td>
										<td><input type="checkbox" name="checker" id="checker1"><label
											for="checker5"></label></td>
										<td><input type="checkbox" name="checker" id="checker2"><label
											for="checker6"></label></td>
										<td><input type="checkbox" name="checker" id="checker2"><label
											for="checker7"></label></td>


									</tr>
								</table>

							</div>
							<div class="description">
								<div class="form-group">
									<label for="name">프로필 사진 선택<span class="require">*</span></label>
									<input style="display: block;" type="file" id="input-image">
								</div>


							</div>

							<!-- SNS
	                  <ul class="social-icons">
	                    <li><a class="facebook" data-original-title="facebook" href="javascript:;"></a></li>
	                    <li><a class="twitter" data-original-title="twitter" href="javascript:;"></a></li>
	                    <li><a class="googleplus" data-original-title="googleplus" href="javascript:;"></a></li>
	                    <li><a class="evernote" data-original-title="evernote" href="javascript:;"></a></li>
	                    <li><a class="tumblr" data-original-title="tumblr" href="javascript:;"></a></li>
	                  </ul>
                   -->
						</div>

						<div class="product-page-content">
							<ul id="myTab" class="nav nav-tabs">

								<li class=""><a href="#Reviews" data-toggle="tab">자기
										소개</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">

								<!-- BEGIN FORM-->
								<form action="#" class="reviews-form" role="form">
									<div class="formgroup">
										<label for="review">자기소개글 작성<span class="require">*</span></label>

										<textarea name="content" id="summernote" class="summernote"></textarea>
									</div>

									<div class="padding-top-20">
										<button type="submit" class="btn btn-primary">저장</button>
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


	<!-- END SIMILAR PRODUCTS -->
</div>

<script>
	//summernote jquery

	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{
											height : 300,
											fontNames : [ '맑은고딕', 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', ],
											fontNamesIgnoreCheck : [ '맑은고딕' ],
											focus : true,

											callbacks : {
												onImageUpload : function(files,
														editor, welEditable) {
													for (var i = files.length - 1; i >= 0; i--) {
														sendFile(files[i], this);
													}
												}
											}

										});

					})
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : 'profileImage.do',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_name) {
				alert(img_name);
				$(el).summernote('editor.insertImage', img_name);
			}
		});
	} // sendfile
</script>

<%@ include file="../../footer.jsp"%>