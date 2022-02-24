//function boardCheck() {
// if(document.frm.name.value.length == 0){
// alert("작성자를 입력하세요.");
// return false;
//}
//if(document.frm.pass.value.length == 0){
// alert("비밀번호를 입력하세요.");
// return false;
//}
//if(document.frm.title.value.length == 0){
// alert("제목을 입력하세요.");
// return false;
//}
//return true;
//}
//
//function open_win(url, name){
//window.open(url, name, "width=500, height=230");
//
//}

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
			console.log("success");
		},
		error:function(data){
			console.log("fail");
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
		alert("리뷰란이 공란입니다.");
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
		alert("점수를 선택해주세요");
		return false;
	}
	return true;x
}

function like(board_bno,member_bno) {
	var like = $("#board_"+board_bno);
	var chklike = like.hasClass("likeButtonActive");
	if(chklike) {
		removelike(board_bno,member_bno);
		like.removeClass("likeButtonActive");
	}else {
		addlike(board_bno,member_bno);
		like.addClass("likeButtonActive");
	}
}

function addlike(board_bno,member_bno) {
	$.ajax({
		type:"post",
		url:"/board/addlike",
		data:{board_bno: board_bno,member_bno:member_bno}
	})
}

function removelike(board_bno,member_bno) {
	$.ajax({
		type:"post",
		url:"/board/removelike",
		data:{board_bno: board_bno,member_bno:member_bno}
	})
}


