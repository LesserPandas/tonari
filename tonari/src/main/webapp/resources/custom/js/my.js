$(document).ready(function() {
	var total = function(n) {
		var price=$(".product-details .details span").attr("class");
		var amount = $(".quantity").attr("value"); //수량
		var amount = parseInt(amount); //숫자변환
		var amount = amount + n;
		if(amount < 1) {
			amount=1;
			alert("최소 수량은 1개 입니다");
		}
		var tot = price * amount;
		$(".quantity").attr("value",amount);
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		var tot = tot.toString().replace(regexp,',');
		$(".total").html(tot + "("+amount+"개)");
	}
	total(0);
	$(".plus").on("click",function() {
		total(1);
	});
	$(".minus").on("click",function() {
		total(-1);
	});
	
	
	//summernote jquery
			
			$(function(){
				$('#summernote').summernote({
				height:300,
				fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
				fontNamesIgnoreCheck : [ '맑은고딕' ],
				focus: true,
				
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
				       $.ajax({
				         data: form_data,
				         type: "POST",
				         url: 'productImage.do',
				         cache: false,
				         contentType: false,
				         enctype: 'multipart/form-data',
				         processData: false,
				         success: function(img_name) {
				        	 //alert(img_name);
				           $(el).summernote('editor.insertImage', img_name);
				         }
				       });
				    }
	
	
	
});