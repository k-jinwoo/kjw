/**
 * 
 */
var isEmailOk = false;

$(function(){
	$('input[name=email]').focusout(function(){
		var email = $(this).val();
		var param = {'email':email};
		
		$.ajax({
			url:'/Kjw/user/proc/checkEmail.jsp',
			type:'get',
			data:param,
			dataType:'json',
			success:function(data){
						if(data.result == 1){
							$('.resultEmail').css('color','red').text('사용할 수 없는 이메일 입니다.');
							isEmailOk = false;
								}else{
									$('.resultEmail').css('color','green').text('사용 가능한 이메일 입니다.');
									isEmailOk = true;
				}
			}
		});
	});
});