var MailFilter={
	filters:[
		{
			'id':'zum',
			'isError':true,
			'regexp':/^(zum\.com).*$/,
			'message':'zum은 메일 서비스를 제공하지 않습니다.',
			'alert_message':'zum은 별도 메일 서비스를 제공하지 않으니,\n@zum.com으로 메일 수신이 불가할 수 있습니다.\n계속 하시겠습니까?'
		}
    ],
    getFilter : function($element) {
		var target=$.trim($element.val());
		
		for(var i in this.filters) {
			var filter=this.filters[i];
			if(filter.regexp.test(target)) {
				return filter;
			}
		}
		
		return {
			'id':'ok',
			'isError':false,
			'alert_message':'사용 가능한 이메일입니다.',
			'message':'사용 가능한 이메일입니다.'
		};
	}
};

$(function() {
	var $btnPcMobile = $('#d_pc_mobile');
	
	$btnPcMobile.click(function() {
		$.cookie('viewMode', 'mobile', {'path' : '/', 'domain' : '.zum.com', 'expires' : 1 });
		location.reload();
		return false;
	});
});