/**
 * 
 */
// 정규 표현식
var regUid = /^[a-z0-9]+[a-z0-9]{3,10}$/
// 최종 유효성 검증에 사용할 상태변수 선언
var isUidOk = false;

$(function(){
	$('input[name=uid]').focusout(function(){
		var uid = $(this).val();
		var param = {'uid':uid};
		$.ajax({
			url:'/Kjw/user/proc/checkUid.jsp',
			type:'get',
			data:param,
			dataType:'json',
			success:function(data){
				if(data.result == 1){
					$('.resultId').css('color','red').text('사용할 수 없는 아이디 입니다.');
					isUidOk = false;
				}else{
					if(regUid.test(uid)){
						$('.resultId').css('color','green').text('사용 가능한 아이디 입니다.');
						isUidOk = true;
					}else{
						$('.resultId').css('color','blue').text('아이디는 영문 소문자, 숫자 4 ~ 10자 입니다.');
						isUidOk = false;
					}
				}
			}
		});
	});
});