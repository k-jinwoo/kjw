/**
 * 
 */
var isHpOk = false;

$(function(){
	$('input[name=hp]').focusout(function(){
		var hp = $(this).val();
		var param = {'hp':hp};
		
		$.ajax({
			url:'/Kjw/user/proc/checkHp.jsp',
			type:'get',
			data:param,
			dataType:'json',
			success:function(data){
				if(data.result == 1){
					$('.resultHp').css('color','red').text('이미 사용중인 전화번호 입니다.');
					isHpOk = false;
				}else{
					$('.resultHp').css('color','green').text('사용 가능한 전화번호 입니다.');
					isHpOk = true;
				}
			}
		});
	});
});