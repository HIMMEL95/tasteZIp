checkNull = function(obj, value) {
    if (value == "" || value == null) {
        obj.focus();
        return false;
    } else {
        return true;
    }
}

const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success');
};

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
};


// 비밀번호
password_V = function(obj, value, message, hide) {
	const re = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/g;
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else if($.trim($(obj).val()).length < 3) {
		hide.parent().addClass('error')
        $(hide).text("3자 이상 입력하세요")
        $(hide).show()
	} else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).hide()
        return true;
    }
}

password2_V = function(obj, value, message, hide) {
	const re = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/g;
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else if(!(($.trim($(obj).val()) === $.trim($('#ifmmPwd').val())))) {
        $(hide).text('비밀번호가 일치하지 않습니다.')
        hide.parent().addClass('error')
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).text('비밀번호가 일치 합니다.')
        $(".msg").css("color", "#198754");
        return true;
    }
}

