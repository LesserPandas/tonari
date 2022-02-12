function boardCheck() {
 if(document.frm.name.value.length == 0){
 alert("작성자를 입력하세요.");
 return false;
}
if(document.frm.pass.value.length == 0){
 alert("비밀번호를 입력하세요.");
 return false;
}
if(document.frm.title.value.length == 0){
 alert("제목을 입력하세요.");
 return false;
}
return true;
}

function open_win(url, name){
window.open(url, name, "width=500, height=230");

}

function like(){
	var like = document.getElementById("like").classList.contains("likeButtonActive");
	if(like == false){
		document.getElementById("like").classList.add("likeButtonActive");
	}
	if(like==true){
		document.getElementById("like").classList.remove("likeButtonActive");
	}
}

function checkReview(){
	var country = $("#country").val();
	var rate = $('input:radio[name=rating]:checked').val();
	var review = $("#review").val();
	
	if(country==""){
		alert("제목을 선택해주세요");
		return false;
	}
	if(rate==undefined){
		alert("별점을 선택해주세요");
		return false;
	}
	if(review == ""){
		alert("리뷰 내용을 작성해주세요");
		return false;
	}
}