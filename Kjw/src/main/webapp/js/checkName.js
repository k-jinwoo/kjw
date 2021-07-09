/**
 * 
 */
var regName = /^[가-힣]{2,10}$/;
var isNameOk = false;

$(function(){
	$('input[name=name]').focusout(function(){
		var name = $(this).val();
		
		if(regName.test(name)){
			$('.resultName').css('color','green').text('사용 가능한 이름 입니다.');
			isNameOk = true;
		}else{
			$('.resultName').css('color','red').text('적합하지 않은 이름 입니다.');
			isNameOk = false;
		}
	});
});