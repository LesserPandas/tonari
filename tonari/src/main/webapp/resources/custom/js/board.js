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
	var like = document.getElementById("like").style.backgroundColor;
	if(like == "rgb(204, 204, 204)"){
		document.getElementById("like").style.backgroundColor = "#67bd3c";
	}else{
		document.getElementById("like").style.backgroundColor = "#ccc";
	}
}