function like(){
	var like = document.getElementById("like").classList.contains("likeButtonActive");
	if(like == false){
		document.getElementById("like").classList.add("likeButtonActive");
	}
	if(like==true){
		document.getElementById("like").classList.remove("likeButtonActive");
	}
}

function orderby() {
	var orderby = document.getElementById("orderby").value; // orderby 할 명칭 불러오기
	$.ajax({
		type:"get",
		url:"/board/search",
		data:{orderby},
		success:function(data){
		},
		error:function(data){
		},
	})
}

function writeReview() {
	var nocoment = $("#nocoment").val();
	var content = $("#content").val();
	var score = $('input:radio[name=score]:checked').val();
	if(!checkcomment(nocoment,content)) {
		return false;
	}
	if(!checkscore(score)) {
		return false;
	}
	return true;
}

function checkcomment(nocoment,content) {
	if(nocoment == "" && content == "") {
		alert("レビューを書いてください");
		return false;
	}
	if(nocoment != "" && content != "") {
		$("#nocoment").val("").prop("selected", true);
		return true;
	}
	if(nocoment != "" && content == "") {
		$("#content").val(nocoment);
		$("#nocoment").val("").prop("selected", true);
		return true;
	}
	return true;
}

function checkscore(score) {
	if(score==undefined) {
		alert("点数を選択してください");
		return false;
	}
	return true;
}

function like(teacher_bno,member_bno) {
	var like = $("#teacher_"+teacher_bno);
	var chklike = like.hasClass("likeButtonActive");
	if(chklike) {
		removelike(teacher_bno,member_bno);
		like.removeClass("likeButtonActive");
	}else {
		addlike(teacher_bno,member_bno);
		like.addClass("likeButtonActive");
	}
}

function addlike(teacher_bno,member_bno) {
	$.ajax({
		type:"post",
		url:"/board/addlike",
		data:{teacher_bno: teacher_bno,member_bno:member_bno},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); }
	})
}

function removelike(teacher_bno,member_bno) {
	$.ajax({
		type:"post",
		url:"/board/removelike",
		data:{teacher_bno: teacher_bno,member_bno:member_bno}
	})
}
