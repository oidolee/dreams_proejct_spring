
// -- [회원가입 페이지]

// 이메일
function selectEmailChk() {
    // select 박스에서 이메일 주소를 선택시 해당값이 들어가도록 한다.
    if(document.joinform.email3.value == 0) {  // 직접입력인 경우
        document.joinform.email2.value = "";
        document.joinform.email2.focus();
        return false;	// false : 이벤트 핸들러의 기본 동작을 중단
    }
    else {
        document.joinform.email2.value = document.joinform.email3.value;
        return false;
    }
}

// 아이디 중복확인 버튼 클릭시
// 1. 중복확인 페이지 open
function confirmId() {
	// alert("중복확인");
	let reg_id = /^[a-z][a-z0-9_]{3,15}$/;
	
	if(!document.joinform.userid.value) {
		alert("아이디를 입력하세요!!");
		document.joinform.userid.focus();
		return false;
	}
	else if(!reg_id.test(document.joinform.userid.value)) {
            alert("아이디 형식이 올바르지 않습니다. 아이디는 영문 소문자, 숫자, 언더스코어(_)로만 구성되어야 하며, 길이는 4자 이상 16자 이하여야 합니다. 숫자로 시작할 수 없습니다.");
            document.joinform.userid.value = "";
            document.joinform.userid.focus();
            return false;
    }
	var url = "/dreams_project2/idConfirmAction.cc?userid=" + document.joinform.userid.value;
	window.open(url, "confirm", "menubar=no, width=900, height=400")
	// 컨트롤러 url을 넘기므로 컨트롤러에 url 추가
}




// 2. join.jsp - onsubmit - 회원가입 페이지 필수체크
function signIncheck() {
	
	// [정규표현식]
	
	// 이름 : 한글로 이루어진 2에서 5글자의 문자열
	let reg_name = /^[가-힣]{2,5}$/;
	
	// 아아디 : 소문자 알파벳으로 시작하고, 그 뒤에 소문자 알파벳, 숫자 또는 밑줄이 3에서 15번 반복되는 문자열
	let reg_id = /^[a-z][a-z0-9_]{3,15}$/;
	
	// 비밀번호 : 영어 대소문자와 숫자로 이루어진 6에서 12자리의 문자열
	let reg_password = /^[A-Za-z0-9]{6,12}$/;
	
	// 이메일 아이디 : 소문자 알파벳 (a부터 z) 또는 숫자 (0부터 9) 중 하나에 해당하는 문자
	let reg_email1 = /^[a-z0-9]+$/;
	
	// 이메일 주소 : 영어 알파벳, 숫자 및 점으로만 구성된 뒤에 두 개 이상의 영어 알파벳으로 끝나는 문자열
	let reg_email2 = /^[a-zA-Z0-9.]+\.[a-zA-Z]{2,}$/
	
	
	
	// 핸드폰 : 첫번호는 010,070,080중 하나로 시작하고, 다음 번호는 3~4개까지 오고,
	//         마지막 번호는 숫자 4개가 일치하는 패턴으로 정규표현 객체를 생성
	// let reg_hp = /^(010|070|080)\d{3,4}\d{4}$/;   // d: digit 자리수
	
	
	
	/* 
	1. ^ : 문장의 처음부터 시작한다.
	2. [0-9a-zA-Z_-]+ : 숫자 또는 알파벳 소문자 대문자 또는 밑줄(_), 하이픈(-)이 1개이상(+)이상 와야한다.
	3. ([0-9a-zA-Z_-]+) :  2에서의 형식을 한 묶음으로 한다. 시작과 끝으로 한다.
	4. @ : 골뱅이가 들어가고
	5. \.: . 이 들어간다.
	6. {1,2} : 앞의 식이 1개 또는 2개가 연속으로 올 수 있다.
	7. $ : 문장끝
	8. i : 대소문자를 구분하지 않는다.
	9. * : 0또는 그이상의 문자가 연속될 수 있음을 의미
	*/
	// email2가 없으면 NG
	// let reg_email = /^[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/i;
	
	
	// 2-1. 중복확인
	// <input type="hidden" name="hiddenUserid" value="0">
	// hiddenUserid : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	
	// 2-2. 중복확인 버튼을 클릭하지 않는 경우 "중복확인 해주세요!!" 메세지 띄운다.
	
	// test는 주어진 문자열이 정규식(Regular Expression)과 일치하는지 여부를 확인하는 메서드
	
	// 아이디 입력확인
	if (!document.joinform.userid.value) {
		alert("아이디를 입력해주세요");
		document.joinform.userid.focus();
		return false;	// 동작 중지
	}
	else if(!reg_id.test(document.joinform.userid.value)) {
            alert("아이디 형식이 올바르지 않습니다. 아이디는 영문 소문자, 숫자, 언더스코어(_)로만 구성되어야 하며, 길이는 4자 이상 16자 이하여야 합니다. 숫자로 시작할 수 없습니다.");
            document.joinform.userid.value = "";
            document.joinform.userid.focus();
            return false;
    }
	
	
	// 중복확인
	if(document.joinform.hiddenUserid.value == 0) {
		alert("중복확인 해주세요!!");
		document.joinform.userid.focus();
		return false;
	}
	
	
	// 비밀번호 입력확인
	if (!document.joinform.userpwd.value) {
		alert("비밀번호를 입력해주세요");
		document.joinform.userpwd.focus();
		return false;	// 동작 중지
	}
	else if(!reg_password.test(document.joinform.userpwd.value)) {
            alert("비밀번호 입력(숫자와 문자 포함 형태의 6~12자리)!!");
            document.joinform.userpwd.value = "";
            document.joinform.userpwd.focus();
            return false;
        }

	// 비밀번호 재입력확인
	if (!document.joinform.userrepwd.value) {
		alert("비밀번호를 재입력해주세요");
		document.joinform.userrepwd.focus();
		return false;	// 동작 중지
	}
	
	// 비밀번호와 비밀번호 재입력 불일치
	if (document.joinform.userpwd.value != document.joinform.userrepwd.value) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		document.joinform.userpwd.focus();
		return false;	// 동작 중지
	}
	
	
	// 이름 입력확인
	if (!document.joinform.username.value) {
		alert("이름을 입력해주세요");
		document.joinform.username.focus();
		return false;	// 동작 중지
	}
	else if(!reg_name.test(document.joinform.username.value)) {
            alert("이름 입력(한글2~5글자)!!");
            document.joinform.userName.value = "";
            document.joinform.userName.focus();
            return false;
	}
	
	
	// 생년월일 입력확인
	if (!document.joinform.birthday.value) {
		alert("생년월일을 입력해주세요");
		document.joinform.birthday.focus();
		return false;	// 동작 중지
	}


	// 연락처 입력확인
	// 연락처 자릿수 체크
    var phone1 = document.getElementById("phone1").value;
    var phone2 = document.getElementById("phone2").value;
    var phone3 = document.getElementById("phone3").value;
    
	if (!document.joinform.phone1.value) {
	alert("휴대폰번호를 입력해주세요");
	document.joinform.phone1.focus();
	return false;	// 동작 중지
	}
	
	if (isNaN(phone1)) {
	    alert("올바른 전화번호를 입력해주세요 (숫자만 입력 가능합니다).");
	    document.joinform.phone1.focus();
	    return false;
	}
	
	if (phone1.substring(0, 3) !== "010") {
	    alert("올바른 전화번호를 입력해주세요 (010으로 시작해야 합니다).");
	    document.joinform.phone1.focus();
	    return false;
    }
    
	if (!document.joinform.phone2.value) {
	alert("휴대폰번호를 입력해주세요");
	document.joinform.phone2.focus();
	return false;	// 동작 중지
	}
	
	if (isNaN(phone2)) {
	    alert("올바른 전화번호를 입력해주세요 (숫자만 입력 가능합니다).");
	    document.joinform.phone2.focus();
	    return false;
	}
	
    if (phone2.length !== 4) {
        alert("연락처를 올바르게 입력해주세요.");
	    document.joinform.phone2.focus();
        return false;
    }
    
	if (!document.joinform.phone3.value) {
	alert("휴대폰번호를 입력해주세요");
	document.joinform.phone3.focus();
	return false;	// 동작 중지
	}
	
	if (isNaN(phone3)) {
	    alert("올바른 전화번호를 입력해주세요 (숫자만 입력 가능합니다).");
	    document.joinform.phone3.focus();
	    return false;
	}

    if (phone3.length !== 4) {
        alert("연락처를 올바르게 입력해주세요.");
	    document.joinform.phone3.focus();
        return false;
    }
    
    
	// 이메일 입력확인
	if (!document.joinform.email1.value) {
		alert("이메일을 입력해주세요");
		document.joinform.email1.focus();
		return false;	// 동작 중지
	}
	else if(!reg_email1.test(document.joinform.email1.value)) {
            alert("이메일을 입력해주세요 (영문 소문자와 숫자 조합이어야 합니다)");
            document.joinform.email1.value = "";
            document.joinform.email1.focus();
            return false;
        }
	
	if (!document.joinform.email2.value) {
		alert("이메일을 입력해주세요");
		document.joinform.email2.focus();
		return false;	// 동작 중지
	}
	else if(!reg_email2.test(document.joinform.email2.value)) {
            alert("이메일 주소를 정확하게 입력해주세요");
            document.joinform.email2.value = "";
            document.joinform.email2.focus();
            return false;
        }
	
	return true;
	
}

// -- [중복확인 페이지]

// 3. idConfirmAction.jsp - onload
function idConfirmFocus() {
	document.confirmform.userid.focus();
}

// 4. idConfirmAction.jsp - submit
function idConfirmCheck() {
	
	// 아아디
	let reg_id = /^[a-z][a-z0-9_]{3,15}$/;
	
	if(!document.confirmform.userid.value) {
		alert("아이디를 입력하세요!!");
		document.confirmform.userid.focus();
		return false;
	}
	else if(!reg_id.test(document.confirmform.userid.value)) {
            alert("아이디 형식이 올바르지 않습니다. 아이디는 영문 소문자, 숫자, 언더스코어(_)로만 구성되어야 하며, 길이는 4자 이상 16자 이하여야 합니다. 숫자로 시작할 수 없습니다.");
            document.confirmform.userid.value = "";
            document.confirmform.userid.focus();
            return false;
    }
}

// 5. 자식창에서 부모창으로 userid값을 전달 => 사용가능한 id를 찾은경우
/*
 	opener : window 객체의 open() 메서드로 열린 자식창(=중복확인창)에서 부모창(=회원가입창)에 접근할 때 사용
	// hiddenUserid : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	self.close();	// 자식창 닫기
*/
function setUserid(userid) {
	opener.document.joinform.userid.value = userid;
	opener.document.joinform.hiddenUserid.value = "1";
	self.close();
}

// -- [회원상세 페이지]
// 이메일
function selectEmailChk_detail() {
    // select 박스에서 이메일 주소를 선택시 해당값이 들어가도록 한다.
    if(document.modifyform.email3.value == 0) {  // 직접입력인 경우
        document.modifyform.email2.value = "";
        document.modifyform.email2.focus();
        return false;	// false : 이벤트 핸들러의 기본 동작을 중단
    }
    else {
        document.modifyform.email2.value = document.modifyform.email3.value;
        return false;
    }
}




        



// -- [회원정보 입력 페이지]
function inputChk() {

	// 주소 입력확인
	if (!document.joinform.post1.value) {
		alert("우편번호를 입력해주세요");
		document.joinform.post1.focus();
		return false;	// 동작 중지
	}
	if (!document.joinform.post2.value) {
		alert("우편번호를 입력해주세요");
		document.joinform.post2.focus();
		return false;	// 동작 중지
	}
	if (!document.joinform.adress1.value) {
		alert("기본주소를 입력해주세요");
		document.joinform.adress1.focus();
		return false;	// 동작 중지
	}
	if (!document.joinform.adress2.value) {
		alert("나머지주소를 입력해주세요");
		document.joinform.adress2.focus();
		return false;	// 동작 중지
	}

	


}