$(function(){
		$('#summernote').summernote({
		height: 300,
		fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
		fontNamesIgnoreCheck : [ '맑은고딕' ],
		focus: false,
		callbacks: {
			onImageUpload: function(files, editor, welEditable) {
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
	//var csrfHeaderName = "${_csrf.headerName}";
	//var csrfTokenValue = "${_csrf.token}";
	//스프링 시큐리티 이용하면 CSRF 토큰을 같이 전송해야한다
	
	//$(document).ajaxSend(function(e, xhr, options) {
	//xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	//});
	
	$.ajax({
		data: form_data,
		type: "POST",
		url: '/mypage/ImageFile',
		contentType: false,
		enctype: 'multipart/form-data',
		processData: false,
		success: function(img_name) {
		$(el).summernote('editor.insertImage', img_name.url);
		}
	});
}