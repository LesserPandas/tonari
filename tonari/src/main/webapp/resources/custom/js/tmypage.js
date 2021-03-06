function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image");
            previewImage.src = e.target.result;
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0]);
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("uploadFile");
inputImage.addEventListener("change", e => {
    readImage(e.target)
})

$(function(){
	$("#title").focus();
	var start_year="1920";// 시작할 년도 
	var today = new Date(); 
	var today_year= today.getFullYear(); 
	var index=0; 
	for(var y=start_year; y<=today_year; y++){ //start_year ~ 현재 년도 
			document.getElementById('select_year').options[index] = new Option(y, y); 
			index++; 
		} 
		index=0; 
		for(var m=1; m<=12; m++){ 
			document.getElementById('select_month').options[index] = new Option(m, m); 
			index++; 
		} lastday(); 
})

function lastday(){ //년과 월에 따라 마지막 일 구하기
	var Year=document.getElementById('select_year').value; 
	var Month=document.getElementById('select_month').value; 
	var day=new Date(new Date(Year,Month,1)-86400000).getDate(); 
	/* = new Date(new Date(Year,Month,0)).getDate(); */ 
	var dayindex_len=document.getElementById('select_day').length; 
	if(day>dayindex_len){ 
		for(var i=(dayindex_len+1); i<=day; i++){ 
			document.getElementById('select_day').options[i-1] = new Option(i, i); 
		} 
	} else if(day<dayindex_len){ 
		for(var i=dayindex_len; i>=day; i--){ 
			document.getElementById('select_day').options[i]=null; 
		} 
	} 
}

function chkjoin() {
	var title= document.getElementById("title").value;
	var content = document.getElementById("content").value;
	var coment = document.getElementById("coment").value;
	var select_year = document.getElementById("select_year").value;
	if(!date()) {
		return false;
	}
	if(title=="") {
		alert("タイトルを書いてください");
		$("#title").focus();
		return false;
	}
	if(content == "") {
		alert("自己紹介文を書いてください");
		$("#content").focus();
		return false;
	}
	if(coment == "") {
		alert("コメントを書いてください");
		$("#coment").focus();
		return false;
	}
	age(select_year);
	image();
}

function date() {
	var dodate=0;
	var chkList = document.querySelectorAll("input[name=date]:checked");
	console.log(chkList);
	chkList.forEach(function(ch) {
		dodate += parseInt(ch.value);
	});
	
	if(dodate == 0) {
		alert("日にちを選んでください");
		return false;
	}else {
		$("#dodate").val(dodate);
		return true;
	}
	
}

function age(select_year) {
	var today = new Date(); 
	var today_year= today.getFullYear(); 
	var age = today_year - select_year;
	$("#age").val(age);
}