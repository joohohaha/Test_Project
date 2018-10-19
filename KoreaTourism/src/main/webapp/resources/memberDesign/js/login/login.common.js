var	message = {
	empty:{
		id: "아이디를 입력하세요",
		password: "비밀번호를 입력하세요"
	}
};
	
var	getKey = function(callback){
		$.ajax({
			url: "https://sign.zum.com/auth/getkey",
			type: "get",
			dataType: "jsonp",
			cache: false,
			error: function(){
				callback(null);
				return false;
			},
			success: function(data){
				callback(data);
				return false;
			}
		});
	};
	
var checkCapsLock = function(capslock, event) {
	var kc = event.keyCode ? event.keyCode : event.which;
	var sk = event.shiftKey ? event.shiftKey : ((kc == 16) ? true : false);
	if(((kc >= 65 && kc <= 90) && !sk)||((kc >= 97 && kc <= 122) && sk)){
		capslock.css("display","block");
	}
	else {
		capslock.css("display", "none");
	}
};

var getParam = function(name) {
    name = name + '=';
    var idx = location.search.indexOf(name);
    if (idx < 0) {
        return '';
    }
    var substr = location.search.substring(idx + name.length)
    if (substr.indexOf('&') < 0) {
        return substr;
    }
    else {
        return substr.substring(0, substr.indexOf('&'));
    }
};


