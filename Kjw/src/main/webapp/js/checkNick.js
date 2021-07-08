/**
 * 
 */
var regNick = /^[a-z가-힣0-9]{2,10}$/;
var isNickOk = false;

$(function(){
	$('input[name=nick]').focusout(function(){
		var nick = $(this).val();
		var param = {'nick':nick};
		
		$.ajax({
			url:'/Kjw/user/proc/checkNick.jsp',
			type:'get',
			data:param,
			dataType:'json',
			success: function(data){
				if(data.result == 1){
					$('.resultNick').css('color','red').text('이미 사용중인 닉네임 입니다.');
					isNickOk = false;
				}else{
					if(regNick.test(nick)){
						$('.resultNick').css('color','green').text('사용 가능한 닉네임 입니다.');
						isNickOk = true;
					}else{
						$('.resultNick').css('color','blue').text('닉네임은 영문, 한글, 숫자포함 최소 2 ~ 10자 입니다.');
						isNickOk = false;
					}
				}
			}
		});
	});
});