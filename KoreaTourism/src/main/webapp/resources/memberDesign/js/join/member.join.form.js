(function(member) {
    var $frmInJoin = $('#frmInJoin'),
        $birthMonth = $('#inputInfoBirthMonth'),
        $birthYear = $('#inputInfoBirthYear'),
        $birthDate = $('#inputInfoBirthDay'),
        $underFourteenAlert = $('#inputInfoBirthDay').closest('dd').find('.text_alert'),
        $userId = $('#inputInfoID'),
        $userPass = $('#inputInfoPassword'),
        $userPassConfirm = $('#inputInfoPasswordRe'),
        $gender = $('#gender'),
        $userEmail = $('#inputInfoEmail'),
        $phoneRadio = $('#phoneRadio input'),
        $phoneAuthNum = $('#inputCertNumberPhone'),
        $emailAuthNum = $('#inputCertNumberEmail'),
        $inputPhone = $('#inputPhone'),
        $inputPhoneHelpInfo = $('.input_phone').next('.text_alert'),
        $authPhoneButton = $('.input_phone button'),
        $phoneConfirmButton = $('#phoneConfirm button'),
        $emailRadio = $('#emailRadio input'),
        $authEmailButton = $('#inputEmail').closest('div').find('button'),
        $confirmEmailButton = $('#emailConfirm').find('button'),
        $userName = $('#inputInfoName'),
        $timer = $('#timer'),
        $phoneTimer = $('#phoneTimer'),
        $authenticationInputs = $('.box_user_certification input'),
        $layer = $('#layer'),
        $layerCert = $('#layerCert'),
        $btnNext = $('#btnNext'),
        $btnCert = $('.btn_cert'),
        $btnCancel = $('.btn_cancel'),
        $btnConfirm = $('#btnConfirm'),
        time = 0;

    // 플래그값
    var flag = {
        'userId' : false,
        'userEmail' : false,
        'submit' : false,
        'certification' : false,
        'sendEmail' : false,
        'ajax' : false
    };

    // 중복체크값
    var checkValue = {
        'userId' : '',
        'userEmail' : '',
        'userPhone' : ''
    };

    var checkpass = new CheckPass({
        minLength : 8,
        minCombination : 3,
        maxAllowSameCharacter : 4,
        maxAllowSequenceCharacter : 4
    });

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////UNDERFOURTEEN
    $btnCert.click(function(){
        window.open('/member/join/popup/underfourteen', '보호자인증', "width=417, height=642, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
        return false;
    });

    $btnConfirm.click(function(){
        subSubmit();
        return false;
    });

    $btnCancel.click(function(){
        $layer.hide();
        return false;
    });

    member.general = {
        cert: function(data) {
            data = JSON.parse(data);
            if(data.isFourteenResult === true) { //json으로 변환
                $layerCert.hide();
                $('#layerSuccess').show();
            } else if(data.isFourteenResult === false){
                $layerCert.hide();
                $('#layerError').show();
            } else {
                alert('data 형식이 올바르지 않습니다.');
                return false;
            }
        }
    };
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////UNDERFOURTEEN

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////SUBMIT
    $btnNext.click(function() {
        submitAfterValidCheck();
        return false;
    });

    var pushEstat = function() {
        var stat = {
            'pos': 'join',
            'cm': '',
            'referrer': document.referrer,
            'url': location.href,
            'time': + new Date
        };

        ESTatTracker.push(['@Click', stat]);
    };

    var submit = function() {
        if(flag.ajax) return false;

        checkFourteen();
    };

    var subSubmit = function() {
        flag.ajax = true;
        $.ajax({
            'url' : 'member/getkey',
            'type' : 'POST',
            'dataType' : 'text',
            'contentType' : "application/text;charset=utf-8",
            'cache' : false,
            'success' : getKey.success,
            'error' : getKey.error
        });
    };

    var checkFourteen = function() {
    	var jsonData = { "data" : "success", "type" : "birth" };
        var result = JSON.stringify(jsonData);
        $.ajax({
            'url' : 'member/check',
            'type' : 'post',
            'data' : result ,
            'dataType' : 'text',
            'contentType' : "application/text;charset=utf-8",
            'async' : false,
            'cache' : false,
            'timeout' : 3000,
            'error' : function() {
                alert('일시적인 장애입니다. 잠시 후 다시 시도해 주세요.');
            },
            'success' : function(data) {
            	subSubmit();
            }
        });
    };

    var getKey = {
        'success' : function(data) {
        	console.log('getKet_success');
            if(data !== undefined && data !== null) {
                var birth = $birthYear.val() + "-" + $birthMonth.val() + "-" + $birthDate.val();
                var postZum = {
                    'm_userid' : $.trim($userId.val()),
                    'm_password' : $.trim($userPass.val()),
                    'm_name' : $.trim($userName.val()),
                    'm_birth' : birth,
                    'm_email' : $.trim($userEmail.val()),
                    'm_emailcheck' : flag.sendEmail,
                    'm_gender' : $gender.find('input[name=inputInfoGender]:checked').val()
                };
                var result = JSON.stringify(postZum);
                console.log(result);
                $.ajax({
                    'url' : 'member/user_join',
                    'dataType' : 'text',
                    'type' : 'POST',
                    'contentType' : "application/text;charset=utf-8",
                    'cache' : false,
                    'data' : result,
                    'success' : function(data) {
                        if(data == 'success') {
                        	alert('회원가입에 성공하였습니다. 축축');
                        	location.href="index";
                        }
                        else {
                            alert('회원가입에 실패하였습니다. 잠시후 다시 시도해 주세요.');
                        }
                    },
                    'error' : function() {
                        alert('일시적인 장애입니다. 잠시 후 다시 시도해 주세요. ajax_error');
                        flag.ajax = false;
                    }
                });
            }
            else {
                alert('회원가입에 실패하였습니다. 잠시후 다시 시도해 주세요.');
                flag.ajax = false;
            }
        },
        'error' : function() {
            alert('일시적인 장애입니다. 잠시 후 다시 시도해 주세요. getKey_error');
            flag.ajax = false;
        }
    };
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////SUBMIT

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////BIRTHDAY
    $birthYear.click(function() {
        $('.select_year').addClass('on');
    });
    $birthMonth.click(function() {
        $('.select_month').addClass('on');
    });
    $birthDate.click(function() {
        $('.select_day').addClass('on');
    });

    var checkDefaultDate = function() {
        var yearValue =  $birthYear.val(),
            monthValue = $birthMonth.val(),
            dateValue = $birthDate.val();
        if($.isNumeric(yearValue) && $.isNumeric(monthValue) && $.isNumeric(dateValue)) {
            checkUnderFourteen(yearValue, monthValue, dateValue);
        }
    };

    /**
     * append month options
     */
    $birthYear.change(function() {
        var yearValue = $.trim($(this).val());

        if(yearValue === '년') {
            removeMonthOption();
            removeDateOption();
            return false;
        }
        if($.isNumeric(yearValue)) {
            removeMonthOption();
            removeDateOption();
        }
        for(var i = 1; i <= 12; i++) {
            $birthMonth.append("<option>" + i + "</option>");
        }
        $birthYear.valid();
    });


    /**
     * append date options
     */
    $birthMonth.change(function() {
        var monthValue = $.trim($(this).val());
        var appendOption = function() {
            var date = validDate($birthYear.val(), monthValue);

            for(var i = 1 ; i <= date ; ++i) {
                $birthDate.append("<option>" + i + "</option>")
            }
        };

        if(monthValue === '월') {
            removeDateOption();
        }

        if($.isNumeric(monthValue)) {
            removeDateOption();
            appendOption();
        }


        if($('#inputInfoBirthDay option').size() == 1) {
            appendOption();
        }
        $birthMonth.valid();
    });

    $birthDate.change(function() {
        checkDefaultDate();
        $birthDate.valid();
    });

    /*
     * 윤년 체크
     */
    var validDate = function(year, month) {
        var monthArr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        var day;
        if(month !== "2" && $.isNumeric(month)) {
            day = monthArr[Number(month) - 1];
        }
        else {
            if($.isNumeric(year)) {
                var intYear = Number(year);
                if((intYear%4 === 0 && intYear%100 !== 0) || intYear%400 === 0) {
                    day = 29;
                }
                else {
                    day = 28;
                }
            }
            else {
                day = 31;
            }
        }
        return day;
    };

    var removeDateOption = function() {
        $('#inputInfoBirthDay option').remove();
        $('.select_day').removeClass('on');
        $birthDate.append("<option selected>일</option>");
        $underFourteenAlert.hide();
    };

    var removeMonthOption = function() {
        $('#inputInfoBirthMonth option').remove();
        $('.select_month').removeClass('on');
        $birthMonth.append("<option selected>월</option>");
    };

    /**
      * 만 14세 미만 체크
      */
    var checkUnderFourteen = function(userYear, userMonth, userDay) {
        var date = new Date(),
            year = date.getFullYear(),
            userBirth = new Date(year, userMonth - 1, userDay);

        var age = date < userBirth ? year - userYear - 1 : year - userYear;

        if(age < 14) {
            if(age < 0) {
                removeMonthOption();
                removeDateOption();
                alert('미래에서 오신 것을 환영합니다!');
            } else { //under fourteen
                alert('만 14세 미만으로 보호자 인증이 필요합니다.');
            }
        }
    };
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////BIRTHDAY

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////GENDER
    $('.check_gender input').on('change', function() {
        var target = $('.check_gender input:checked').parent('span').index();

        if(target >= 0)
            $('.check_gender > span').removeClass('selected').eq(target).addClass('selected');
    });
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////GENDER
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////ID

    /**
     * 유효성 체크후 서브밋
     */
    var submitAfterValidCheck = function() {
        var isValid = true;
        flag.submit = true;
        $.each($('.mustValid', $frmInJoin), function(i, node) {
            if($(node).valid() === 0) {
                isValid = false;
                return false;
            }
        });

        if(isValid && !flag.certification) {
            alert('인증이 필요합니다.');
            return false;
        }

        if(isValid) submit();
        flag.submit = false;
    };

    /**
     * input 에서 탭입력 무시
     * enter 입력은 유효성 체크
     */
    $('input.valid').keydown(function(e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code === 13) {
            submitAfterValidCheck();
        }
    }).keyup(function(e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code === 9) return false;
    }).focus(function() {
       $(this).parent('.text_box').addClass('on');
    }).blur(function() {
        if ($(this).val() === "") {
            $(this).parent('.text_box').removeClass('on');
        }
    });

    $inputPhone.blur(function() {
        if(checkValue.userPhone !== '' && $inputPhone.val() !==  checkValue.userPhone) {
            checkValue.userPhone = '';
            alert('휴대전화 번호가 변경되었습니다. 다시 인증해주세요.');
            clearPhoneAuth();
            initPhoneAuth();
        }
    });

    /**
     * 중복 체크
     */
    var overlapCheck = function(name, value) {
        if(flag[name] && value === checkValue[name]) return true;
        
        var jsonData = { "data" : value, "type" : name };
        var result = JSON.stringify(jsonData);
        
    	$.ajax({
            'url' : 'member/check',
            'type' : 'POST',
            'data' : result ,
            'dataType' : 'text',
            'contentType' : "application/text;charset=utf-8",
            'async' : false,
            'cache' : false,
            'timeout' : 3000,
            'error' : function() {
            	console.log(value)
                alert('일시적인 장애입니다. 잠시 후 다시 시도해 주세요.');
                return false;
            },
            'success' : function(data) {
                checkValue[name] = value;
                if(data == 'success') {
                    flag[name] = true;
                    return true;
                }
                flag[name] = false;
                return false;
            }
        });
    };

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////VALIDATION
    /**
     * 정규식 체크
     */
    var regexpCheck = function($vaildator, value, element, regexp) {
        return $vaildator.optional(element) || new RegExp(regexp).test(value);
    };

    $.validator.addMethod(
        'whitespace', function(value, element) {
            return regexpCheck(this, value, element, /^([^\s])*$/);
        }
    );

    $.validator.addMethod(
        'userId', function(value, element) {
            return regexpCheck(this, value, element, /^[a-z0-9]{6,12}$/);
        }
    );

    $.validator.addMethod(
        'userName', function(value, element) {
            return regexpCheck(this, value, element, /^([a-zA-Z]{2,30}|[가-힣]{1,16})$/);
        }
    );

    $.validator.addMethod(
        'userIdOverlap', function(value, element) {
            overlapCheck('userId', value);
            return flag.userId;
        }
    );

    $.validator.addMethod(
        'userEmail', function(value, element) {
            return regexpCheck(this, value, element, /^[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+(\.[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+)*@[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+(\.[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+)+$/);
        }
    );

    $.validator.addMethod(
        'phoneRex', function(value, element) {
            return regexpCheck(this, value, element, /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/);
        }
    );

    $.validator.addMethod(
        'userEmailOverlap', function(value, element) {
            overlapCheck('userEmail', value);
            return flag.userEmail;
        }
    );

    $.validator.addMethod(
        'combination', function(value, element) {
            return this.optional(element) || !checkpass.isCombination($(element).val());
        }
    );

    $.validator.addMethod(
        'same', function(value, element) {
            return this.optional(element) || !checkpass.isSameSequence($(element).val());
        }
    );

    $.validator.addMethod(
        'equalToId', function(value, element) {
            var userId = $.trim($userId.val());
            return this.optional(element) || (!userId || $(element).val() !== userId);
        }
    );

    $.validator.addMethod(
        'equalToPass', function(value, element) {
            var userPass = $.trim($userPass.val());
            return this.optional(element) || (!userPass || $(element).val() === userPass);
        }
    );

    $.validator.addMethod(
        'sequence', function(value, element) {
            return this.optional(element) || !checkpass.isStepSequence($(element).val());
        }
    );

    $.validator.addMethod(
        'checkDate', function(value, element) {
            if(value === '년도' || value === '월' || value === '일') {
                return false;
            } else {
                return true;
            }
        }
    );

    $.validator.setDefaults({
        'onkeyup' : false,
        'onclick' : false,
        'showErrors' : function(errorMap, errorList) {
            // 실패 메시지를 화면에 출력한다.
            this.defaultShowErrors();
            // 서브밋 이벤트일 경우에만 얼럿으로 메시지를 출력한다.
            if(flag.submit) {
                if(errorList[0] !== undefined && errorList[0].message !== undefined) {
                    alert(errorList[0].message);
                    flag.submit = false;
                    errorList[0].element.focus();
                }
            }
        }
    });

    $frmInJoin.validate({
        'submitHandler' : function(form) {
            submit();
            return false;
        },

        'onfocusout' : function(element) {
            if(!flag.submit) {
                var elementName = $(element).attr('name');
                if(elementName === 'userId') {
                    var userPass = $userPass.val();
                    if (userPass) {
                        $userPass.valid();
                    }
                    $(element).valid();
                }
                else if(elementName === 'userPass') {
                    var userPassConfirm = $userPassConfirm.val();
                    if (userPassConfirm) {
                        $userPassConfirm.valid();
                    }
                    $(element).valid();
                }
                else if(elementName === 'email') {
                    if(checkValue.userEmail !== $userEmail.val())
                        clearEmailAuth();
                    $(element).valid();
                }
                else if(elementName === 'phone') {
                    if(flag.certification && checkValue.userPhone !== $inputPhone.val())
                        flag.certification = false;

                    $(element).valid();
                }
                else {
                    $(element).valid();
                }
            }
        },

        'groups' : {
            'userBirthday' : 'birthYear birthMonth birthDate'
        },

        'rules' : {
            'userId' : {
                'required' : true,
                'whitespace' : true,
                'userId' : true,
                'userIdOverlap' : true,
                'maxlength' : false
            },

            'userName' : {
                'required' : true,
                'whitespace' : true,
                'userName' : true,
                'maxlength' : false
            },

            'email' : {
                'required' : true,
                'whitespace' : true,
                'userEmail' : true,
                'userEmailOverlap' : true,
                'maxlength' : false
            },

            'userPass' : {
                'required' : true,
                'whitespace' : true,
                'combination' : true,
                'same' : true,
                'sequence' : true,
                'equalToId' : true,
                'maxlength' : false
            },

            'userPassConfirm' : {
                'required' : true,
                'whitespace' : true,
                'equalToPass' : true,
                'maxlength' : false
            },

            'birthYear' : {
                'required' : true,
                'checkDate' : true,
                'whitespace' : true,
                'maxlength' : false
            },

            'birthMonth' : {
                'required' : true,
                'checkDate' : true,
                'whitespace' : true,
                'maxlength' : false
            },

            'birthDate' : {
                'required' : true,
                'checkDate' : true,
                'whitespace' : true,
                'maxlength' : false
            },

            'phone' : {
                'phoneRex' : true,
                'maxlength' : false
            }
        },

        'success' : function(label, element) {
            showConfirmed($(element).closest('dd'));
        },

        'errorPlacement' : function(error, element) {
            var list = $frmInJoin.validate().errorList;
            showAlert(element.closest('dd'), list.length > 0 ? list[0].message : '');
        },
        'debug' : false
    });

    var showAlert = function(element, alertMsg) {
        element.find('.icon_confirmed').hide();
        element.find('.text_alert').find('p').text(alertMsg);
        element.find('.text_alert').show();
        element.find('.text_box').addClass('warning');
        element.find('.icon_alert').show();
    };

    var showConfirmed = function(element) {
        element.find('.text_box').removeClass('warning');
        element.find('.text_alert').hide();
        element.find('.icon_alert').hide();
        element.find('.icon_confirmed').show();
    };

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////AUTHENTICATION
    //phone authentication
    $phoneRadio.on('click', function() {
        initPhoneAuth();
    });

    $emailRadio.on('click', function() {
        if(!$userEmail.valid()) {
            $userEmail.focus();
            return;
        }
        initEmailAuth();
    });

    var initPhoneAuth = function() {
        clearEmailAuth();
        $phoneRadio.closest('li').addClass('selected');
    };

    var initEmailAuth = function() {
        clearPhoneAuth();
        $emailRadio.closest('li').addClass('selected');
        $('#inputEmail').val($userEmail.val());
        $inputPhoneHelpInfo.show();
    };

    var clearPhoneAuth = function() {
        flag.certification = false;
        $phoneRadio.closest('li').removeClass('selected');
        $('#inputPhone').val('');
        $('#inputCertNumberPhone').val('');
        $('#phoneConfirm').hide();
        $('#phoneAuthTimeLimit').hide();
        $('#phoneAuthComplete').hide();
    };

    var clearEmailAuth = function() {
        flag.certification = false;
        flag.sendEmail = false;
        $emailRadio.closest('li').removeClass('selected');
        $('#emailConfirm').hide();
        $('#emailAuthTimeLimit').hide();
        $('#emailAuthComplete').hide();
        $('#inputCertNumberEmail').val('');
        $('#inputCertNumberEmail').closest('div').removeClass('on');
    };

    $authEmailButton.on('click', function() {
        //send email auth num
    	alert('메일을 보내는데 시간이조금 걸립니다.');
        $.ajax({
            'url' : 'member/sendEmail',
            'type' : 'post',
            'dataType' : 'text',
            'data' : $.trim($userEmail.val()),
            'contentType' : "application/text;charset=utf-8",
            'error' : function() {
                alert('일시적인 장애입니다. 잠시 후 다시 시도해 주세요.');
                return false;
            },
            'success' : function(data) {
                if(data !== undefined && data !== null) {
                    switch(data) {
                        case 'success':
                            alert('인증번호 전송이 완료 되었습니다.');
                            $('#emailConfirm').show();
                            $('#emailAuthTimeLimit').show();
                            initTimer(300, 'mail');
                            break;
                        case 'exceedLimit':
                            alert('인증번호 전송 횟수 초과. 잠시 후 다시 시도해 주세요');
                            break;
                        default:
                            alert('인증번호 전송이 실패 하였습니다.');
                    }
                } else {
                    alert('인증번호 전송이 실패 하였습니다.');
                }
                return false;
            }
        });
        return false;
    });

    $confirmEmailButton.on('click', function() {
        //confirm auth number, ajax call
        if($emailAuthNum.val().length < 6) {
            alert('인증번호 여섯자리를 입력해 주세요');
            return;
        }

        if(time <= 0) {
            alert('인증시간이 초과하였습니다. 재인증 받아주세요.')
            return;
        }
        
        $.ajax({
            'url' : 'member/checkEmail',
            'type' : 'post',
            'dataType' : 'text',
            'contentType' : "application/text;charset=utf-8",
            'data' : $emailAuthNum.val(),
            'timeout' : 3000,
            'success' : function(data) {
                if(data == 'success') {
                    flag.userEmail = true;
                    flag.certification = true;
                    flag.sendEmail = true;
                    checkValue.userEmail = $userEmail.val();

                    alert('이메일 인증이 완료되었습니다.');
                    clearTimer('mail');
                    $('#emailAuthTimeLimit').hide();
                    $('#emailAuthComplete').show();
                } else {
                    flag.certification = false;
                    flag.sendEmail = false;
                    checkValue.userEmail = '';

                    alert('유효하지 않은 인증번호 입니다. 인증번호를 다시 받아 주세요.');
                }
                return false;
            },
            'error' : function() {
                flag.certification = false;
                flag.sendEmail = false;
                checkValue.userEmail = '';
                alert('일시적인 장애입니다. 잠시 후 다시 시도해 주세요.');
                return false;
            }
        });
        return false;
    });

    var getAuthNumByPhone = function() {
        $.ajaxSetup({ cache: false });
        $.ajax({
            'url' : '/member/join/simple/auth/phone/num',
            'type' : 'post',
            'dataType' : 'json',
            'data' : {'phoneNum' : $.trim($inputPhone.val())},
            'timeout' : 3000,
            'error' : function() {
                alert('일시적인 장애입니다. 잠시 후 다시 시도해 주세요.');
                return false;
            },
            'success' : function(data) {
                if(data !== undefined && data !== null) {
                    switch(data.status) {
                        case 'success':
                            alert('인증번호 전송이 완료 되었습니다.');
                            $inputPhoneHelpInfo.hide();
                            $('#phoneConfirm').show();
                            $('#phoneAuthTimeLimit').show();
                            initTimer(300, 'phone');
                            break;
                        case 'exceedLimit':
                            alert('인증번호 전송 횟수 초과. 잠시 후 다시 시도해 주세요');
                            break;
                        default:
                            alert('인증번호 전송이 실패 하였습니다.');
                    }
                } else {
                    alert('인증번호 전송이 실패 하였습니다.');
                }
                return false;
            }
        });
        return false;
    };

    $authPhoneButton.on('click', function() {
        if(!$inputPhone.valid() || $inputPhone.val() === '') {
            alert('휴대번호를 입력해주세요. 예, 01012345678');
            $inputPhone.focus();
            return;
        }

        getAuthNumByPhone();
    });

    $phoneConfirmButton.on('click', function() {
        if($phoneAuthNum.val().length < 6) {
            alert('인증번호 여섯자리를 입력해 주세요');
            return;
        }

        if(time <= 0) {
            alert('인증시간이 초과하였습니다. 재인증 받아주세요.')
            return;
        }

        $.ajax({
            'url' : '/member/join/simple/auth/phone',
            'type' : 'post',
            'dataType' : 'json',
            'data' : {'phoneNum' : $inputPhone.val(),'authNum' : $phoneAuthNum.val()},
            'timeout' : 3000,
            'success' : function(data) {
                if(data !== undefined && data !== null && data === true) {
                    flag.certification = true;
                    checkValue.userPhone = $inputPhone.val();
                    $('#phoneAuthTimeLimit').hide();
                    $('#phoneAuthComplete').show();
                    clearTimer('phone');
                    alert('휴대폰 인증이 완료되었습니다.');
                } else {
                    flag.certification = false;
                    checkValue.userPhone = '';

                    alert('유효하지 않은 인증번호 입니다. 인증번호를 다시 받아 주세요.');
                }
                return false;
            },
            'error' : function() {
                flag.certification = false;
                checkValue.userPhone = '';
                alert('일시적인 장애입니다. 잠시 후 다시 시도해 주세요.');
                return false;
            }
        });
        return false;
    });


    $authenticationInputs.on('focus', function() {
        $(this).closest('div').addClass('on');
    }).on('blur', function() {
        if($(this).val() === '')
            $(this).closest('div').removeClass('on');
    });

    //insert number and ctrl v only
    $authenticationInputs.keydown(function (e) {
        //Allow backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            (e.keyCode == 86 && (e.ctrlKey === true || e.metaKey === true)) ||
            (e.keyCode >= 35 && e.keyCode <= 39)) {
            return;
        }
        //Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////AUTHENTICATION
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////TIMER
    var timer = null;

    var clearTimer = function(target) {
        time = 0;
        clearInterval(timer);
        changeShowTime(300, target);
    };

    var initTimer = function(initTime, target) {
        clearTimer(target);
        time = initTime;
        timer = setInterval(function() {
            if(time === 0) {
                clearInterval(timer);
                return;
            }

            changeShowTime(--time, target);
        }, 1000);
    };

    var changeShowTime = function(time, target) {
        var min = '' + parseInt(time / 60),
            sec = '' + (time % 60);
        var text = (min.length === 1 ? '0' + min : min) + ':' + (sec.length === 1 ? '0' + sec : sec);
        if(target === 'mail')
            $timer.html(text);
        else
            $phoneTimer.html(text);
    };
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////TIMER
    var init = function() {
    };

    init();
})(window["member"] = window["member"] || {});
