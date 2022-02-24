$(document).ready(function() {
	var total = function(n) {
		var price=$(".product-details .details span").attr("class");
		var amount = $(".quantity").attr("value"); //수량
		var amount = parseInt(amount); //숫자변환
		var amount = amount + n;
		if(amount < 1) {
			amount=1;
			alert("1일 이상부터 수강이 가능합니다!");
		}
		
		
		var tot = price * amount;
		$(".quantity").attr("value",amount);
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		var tot = tot.toString().replace(regexp,',');
		
		$(".total").html(tot + "("+amount+"일)");
		$(".amount").html("amount");
	}
	total(0);
	$(".plus").on("click",function() {
		total(1);
	});
	$(".minus").on("click",function() {
		total(-1);
	});
});