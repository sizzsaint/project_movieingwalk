<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.io.*, java.text.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
    xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MovieingWalk 회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
    <link href="./../../css/index.css" rel="stylesheet" type="text/css">

    <script type="text/javascript">
    var empJ = /\s/g;
    //아이디 정규식
    var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
    // 비밀번호 정규식
    var pwJ = /^[A-Za-z0-9]{4,12}$/;
    // 이름 정규식
    var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    // 이메일 검사 정규식
    var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 휴대폰 번호 정규식
    var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
    /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
       
    var birthJ = false;
                //아이디 중복확인
                $("#mem_id").blur(function () {
                    if ($('#mem_id').val() == '') {
                        $('#id_check').text('아이디를 입력하세요.');
                        $('#id_check').css('color', 'red');
                       
                    } else if (idJ.test($('#mem_id').val()) != true) {
                        $('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
                        $('#id_check').css('color', 'red');
                    } else if ($('#mem_id').val() != '') {
                        var mem_id = $('#mem_id').val();
                        $.ajax({
                            async: true,
                            type: 'POST',
                            data: mem_id,//mem_id라는 이름으로 mem_id라는 데이터를 
                            url: '/register',
                            dateType: 'json',
                            contentType: "application/json; charset=UTF-8",
                            success: function (data) {
                                if (data.cnt > 0) {
                                    $('#id_check').text('중복된 아이디 입니다.');
                                    $('#id_check').css('color', 'red'); $("#usercheck").attr("disabled", true);
                                } else {
                                    if (idJ.test(mem_id)) {
                                        $('#id_check').text('사용가능한 아이디 입니다.');
                                        $('#id_check').css('color', 'blue'); $("#usercheck").attr("disabled", false);
                                    } else if (mem_id == '') {
                                        $('#id_check').text('아이디를 입력해주세요.');
                                        $('#id_check').css('color', 'red'); $("#usercheck").attr("disabled", true);
                                    } else {
                                        $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
                                        $('#id_check').css('color', 'red');
                                        $("#usercheck").attr("disabled", true);
                                    }
                                }
                            }
                        });
                        //ajax///
                    }//else if
                });//blur
                
                $('form').on('submit', function () {
                    var inval_Arr = new Array(8).fill(false);
                    if (idJ.test($('#mem_id').val())) { inval_Arr[0] = true; } else {
                        inval_Arr[0] = false;
                        alert('아이디를 확인하세요.'); return false;
                    } // 비밀번호가 같은 경우 && 비밀번호 정규식
                    if (($('#mem_pw').val() == ($('#mem_pw2').val())) && pwJ.test($('#mem_pw').val())) {
                        inval_Arr[1] = true;
                    } else {
                        inval_Arr[1] = false; alert('비밀번호를 확인하세요.'); return false;
                    } // 이름 정규식
                    if (nameJ.test($('#mem_name').val())) { inval_Arr[2] = true; } else {
                        inval_Arr[2] = false; alert('이름을 확인하세요.');
                        return false;
                    } // 생년월일 정규식
                    if (birthJ) {
                        console.log(birthJ); inval_Arr[3] = true;
                    } else {
                        inval_Arr[3] = false; alert('생년월일을 확인하세요.');
                        return false;
                    } // 이메일 정규식
                    if (mailJ.test($('#mem_email').val())) {
                        console.log(phoneJ.test($('#mem_email').val()));
                        inval_Arr[4] = true;
                    } else {
                        inval_Arr[4] = false; alert('이메일을 확인하세요.');
                        return false;
                    } // 휴대폰번호 정규식
                    if (phoneJ.test($('#mem_phone').val())) {
                        console.log(phoneJ.test($('#mem_phone').val()));
                        inval_Arr[5] = true;
                    } else { inval_Arr[5] = false; alert('휴대폰 번호를 확인하세요.'); return false; }
                    //성별 확인
                    if (member.mem_gender[0].checked == false && member.mem_gender[1].checked == false) {
                        inval_Arr[6] = false; alert('성별을 확인하세요.');
                        return false;
                    } else { inval_Arr[6] = true; } //주소확인
                    if (address.val() == '') {
                        inval_Arr[7] = false;
                        alert('주소를 확인하세요.');
                        return false;
                    } else inval_Arr[7] = true; //전체 유효성 검사
                    var validAll = true; for (var i = 0; i < inval_Arr.length; i++) {
                        if (inval_Arr[i] == false) {
                            validAll = false;
                        }
                    } if (validAll == true) { // 유효성 모두 통과
                        alert('MovieingWalk 가족이 되어주셔 감사합니다.');
                    } else { alert('정보를 다시 확인하세요.') }
                }); $('#mem_id').blur(function () {
                    if (idJ.test($('#mem_id').val())) {
                        console.log('true');
                        $('#id_check').text('');
                    } else {
                        console.log('false');
                        $('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
                        $('#id_check').css('color', 'red');
                    }
                });
                $('#mem_pw').blur(function () {
                    if (pwJ.test($('#mem_pw').val())) {
                        console.log('true');
                        $('#pw_check').text('');
                    } else {
                        console.log('false');
                        $('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
                        $('#pw_check').css('color', 'red');
                    }
                }); //1~2 패스워드 일치 확인
                $('#mem_pw2').blur(function () {
                    if ($('#mem_pw').val() != $(this).val()) {
                        $('#pw2_check').text('비밀번호가 일치하지 않습니다.');
                        $('#pw2_check').css('color', 'red');
                    } else { $('#pw2_check').text(''); }
                }); //이름에 특수문자 들어가지 않도록 설정
                $("#mem_name").blur(function () {
                    if (nameJ.test($(this).val())) {
                        console.log(nameJ.test($(this).val()));
                        $("#name_check").text('')
                            ;
                    } else {
                        $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
                        $('#name_check').css('color', 'red');
                    }
                }); $("#mem_email").blur(function () {
                    if (mailJ.test($(this).val())) {
                        $("#email_check").text('');
                    } else {
                        $('#email_check').text('이메일 양식을 확인해주세요.');
                        $('#email_check').css('color', 'red');
                    }
                }); // 생일 유효성 검사
                var birthJ = false; // 생년월일 birthJ 유효성 검사
                $('#mem_birth').blur(function () {
                    var dateStr = $(this).val();
                    var year = Number(dateStr.substr(0, 4)); // 입력한 값의 0~4자리까지 (연) 
                    var month = Number(dateStr.substr(4, 2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월) 
                    var day = Number(dateStr.substr(6, 2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일) 
                    var today = new Date(); // 날짜 변수 선언 
                    var yearNow = today.getFullYear(); // 올해 연도 가져옴 
                    if (dateStr.length <= 8) {
                        // 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다. 
                        if (year > yearNow || year < 1900) {
                            $('#birth_check').text('생년월일을 확인해주세요');
                            $('#birth_check').css('color', 'red');
                        } else if (month < 1 || month > 12) {
                            $('#birth_check').text('생년월일을 확인해주세요 ');
                            $('#birth_check').css('color', 'red');
                        } else if (day < 1 || day > 31) {
                            $('#birth_check').text('생년월일을 확인해주세요 ');
                            $('#birth_check').css('color', 'red');
                        } else if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
                            $('#birth_check').text('생년월일을 확인해주세요 ');
                            $('#birth_check').css('color', 'red');
                        } else if (month == 2) {
                            var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
                            if (day > 29 || (day == 29 && !isleap)) {
                                $('#birth_check').text('생년월일을 확인해주세요 ');
                                $('#birth_check').css('color', 'red');
                            } else {
                                $('#birth_check').text('');
                                birthJ = true;
                            }
                        } else {
                            $('#birth_check').text('');
                            birthJ = true;
                        }//end of if
                    } else {
                        //1.입력된 생년월일이 8자 초과할때 : auth:false
                        $('#birth_check').text('생년월일을 확인해주세요 ');
                        $('#birth_check').css('color', 'red');
                    }
                }); //End of method /*
                // 휴대전화
                $('#mem_phone').blur(function () {
                    if (phoneJ.test($(this).val())) {
                        console.log(nameJ.test($(this).val()));
                        $("#phone_check").text('');
                    } else {
                        $('#phone_check').text('휴대폰번호를 확인해주세요 ');
                        $('#phone_check').css('color', 'red');
                    }
                });
            
    </script>
</head>

                <body>
                    <jsp:include page="../main/header.jsp" />
                    <article class="container">
                        <div class="page-header">
                            <div class="col-md-6 col-md-offset-3">
                                <h3 style="color:white">회원가입</h3>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-offset-3" style="color:white;">
                            <form action="/registmember" method="post" role="form" id="usercheck" name="member">
                                <div class="form-group">
                                    <label for="id">아이디</label> <input type="text" class="form-control" id="mem_id"
                                        name="u_id" placeholder="ID" required="required" value="${u_id}">
                                    <div class="eheck_font" id="id_check" ></div>
                                </div>
                                <div class="form-group">
                                    <label for="pw">비밀번호</label> <input type="password" class="form-control" id="mem_pw"
                                        name="u_password" placeholder="PASSWORD" required="required" value="${u_password}">
                                    <div class="eheck_font" id="pw_check" ></div>
                                </div>
                                <div class="form-group">
                                    <label for="pw2">비밀번호 확인</label> <input type="password" class="form-control"
                                        id="mem_pw2" name="mem_pw2" placeholder="Confirm Password" required="required">
                                    <div class="eheck_font" id="pw2_check" ></div>
                                </div>
                                <div class="form-group">
                                    <label for="mem_name">이름</label> <input type="text" class="form-control"
                                        id="mem_name" name="u_name" placeholder="Name" required="required" value="${u_name}">
                                    <div class="eheck_font" id="name_check" ></div>
                                </div>
                                <div class="form-group">
                                    <label for="mem_birth">생년월일</label> <input type="tel" class="form-control"
                                        id="mem_birth" name="u_age" placeholder="ex) 19990101" required="required" value="${u_age}">
                                    <div class="eheck_font" id="birth_check" ></div>
                                </div>
                                <div class="form-group">
                                    <label for="mem_email">이메일 주소</label> <input type="email" class="form-control"
                                        id="mem_email" name="u_email" placeholder="E-mail" required="required" value="${u_email}">
                                    <div class="eheck_font" id="email_check" ></div>
                                </div>
                                <div class="form-group">
                                    <label for="mem_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label> <input type="tel"
                                        class="form-control" id="mem_phone" name="u_phone" placeholder="Phone Number" required="required" value="${u_phone}">
                                    <div class="eheck_font" id="phone_check"></div>
                                </div>
                                <div class="form-group">
                                    <label for="mem_gender">성별 </label>
                                     <input type="checkbox" id="mem_gender" value="남성" checked="checked" name="u_sex" onclick='checkOnlyOne(this)'>남 
                                        <input type="checkbox" id="mem_gender" value="여성" name="u_sex" onclick='checkOnlyOne(this)'>여
                                </div>

                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary">회원가입</button>
                                </div>
                            </form>
                        </div>
                    </article>
                    <jsp:include page="../main/footer.jsp" />
                </body>

                </html>