$(document).ready(function() {
	FastClick.attach(document.body);
	
	$(".js-float-label-wrapper").FloatLabel();
	$(".js-float-option-wrapper").FloatSelect();

	$(document).on("keypress", function(e) {
		if(e.keyCode == 13){
			e.preventDefault();
		}
	});

	$("input, select").focus(function(){
		$(this).parent(".js-float-label-wrapper ,.js-float-option-wrapper").removeClass("error");
	})

	$("select").change(function(){
		if ($(this)[0].selectedIndex == 0) {
			$(".reason-description").hide(0);
		}else if($(this)[0].selectedIndex >= 1 && $(this)[0].selectedIndex <= 4){
			$(".reason-description").show(0);
			$(".reason-description").children().hide(0);
			$(".reason-description-refund").show(0);
		}else if($(this)[0].selectedIndex == 5){
			$(".reason-description").hide(0);
		}
	})

	var validate = {
		"name": function () {
			if ($("#form-name").val() == '') {
				$("#form-name").parent().addClass("error");
				return false;
			}else{
				return true;
			}
		},
		"phone": function () {
			if (!validatePhone($("#form-phone").val())) {
				$("#form-phone").parent().addClass("error");
				return false;
			}else{
				return true;
			}

			function validatePhone(number) { 
				var regex = /(^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$)|(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
				return regex.test(number);
			}
		},
		"email": function () {
			if (validateEmail($("#form-email").val()) || $("#form-email").val() == "") {
				return true;
			}else{
				$("#form-email").parent().addClass("error");
				return false;
			}

			function validateEmail(email) { 
				var regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				return regex.test(email);
			}
		},
		"number": function () {
			if (validateOrderNumber($("#form-order-number").val()) || validateSNNumber($("#form-order-number").val())) {
				return true;
			}else{
				$("#form-order-number").parent().addClass("error");
				return false;
			}

			function validateOrderNumber(number) {
				if (number.length >= 18 && number.length <= 20) {
					return true;
				}else{
					return false;
				}
			}

			function validateSNNumber(number) {
				if (number.length == 12) {
					return true;
				}else{
					return false;
				}
			}
		},
		"reason": function() {
			if ($("#form-reason")[0].selectedIndex == 0) {
				$("#form-reason").parent().addClass("error");
				return false;
			}else{
				return true;
			}
		}
	}

	$(".form-wrapper").submit(function(e){
		var formValidateResault = true;
		for (n in validate){
			var thisValidateResault = validate[n]();
			formValidateResault = formValidateResault && thisValidateResault;
		};

		if (formValidateResault) {
			$.ajax({
				type: "POST",
				url: "127.0.0.1:8000",
				data : $(this).serializeArray(),
			}).done(function () {
				var modal = '<div class="modal">您的售后申请已提交，<br>我们将在第一时间与您联系。<div class="return"><a href="http://www.modouwifi.com/order-list.html">返回 我的订单</a></div></div>',
				blackout='<div class="blackout"></div>';
				$("body").prepend(blackout).hide().fadeIn().append(modal);
			});
		}
		e.preventDefault();
		return false;
	})

})