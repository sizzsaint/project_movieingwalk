<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.io.*, java.text.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>


<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
     integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../js/registerCheck.js"></script>
</head>

<body>
    <article class="container">
        <div class="page-header">
            <div class="col-md-6 col-md-offset-3">
                <h3>회원가입</h3>
            </div>
        </div>
        <div class="col-sm-6 col-md-offset-3">
            <sf:form action="/registmember" method="post" role="form" id="usercheck" name="member" modelAttribute="member">
                <div class="form-group">
                    <label for="id">아이디</label> <input type="text" class="form-control" id="u_id"
                        name="u_id"  placeholder="ID" value="${memberBean.u_id}">
                    <div class="eheck_font" id="id_check" ></div>
                </div>
                <div class="form-group">
                    <label for="pw">비밀번호</label> <input type="password" class="form-control" id="mem_pw"
                        name="u_password" placeholder="PASSWORD"  value="${u_password}">
                    <div class="eheck_font" id="pw_check" ></div>
                </div>
                <div class="form-group">
                    <label for="pw2">비밀번호 확인</label> <input type="password" class="form-control"
                        id="mem_pw2" name="mem_pw2" placeholder="Confirm Password" >
                    <div class="eheck_font" id="pw2_check" ></div>
                </div>
                <div class="form-group">
                    <label for="mem_name">이름</label> <input type="text" class="form-control"
                        id="mem_name" name="u_name" placeholder="Name"  value="${u_name}">
                    <div class="eheck_font" id="name_check" ></div>
                </div>
                <div class="form-group">
                    <label for="mem_birth">생년월일</label> <input type="tel" class="form-control"
                        id="mem_birth" name="u_age" placeholder="ex) 19990101" value="${u_age}">
                    <div class="eheck_font" id="birth_check" ></div>
                </div>
                <div class="form-group">
                    <label for="mem_email">이메일 주소</label> <input type="email" class="form-control"
                        id="mem_email" name="u_email" placeholder="E-mail" value="${u_email}">
                    <div class="eheck_font" id="email_check" ></div>
                </div>
                <div class="form-group">
                    <label for="mem_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label> <input type="tel"
                        class="form-control" id="mem_phone" name="u_phone" placeholder="Phone Number" value="${u_phone}">
                    <div class="eheck_font" id="phone_check"></div>
                </div>
                <div class="form-group">
                    <label for="mem_gender">성별 </label>
                     <input type="radio" id="mem_gender" value="남성" checked="checked" name="u_sex">남 
                        <input type="radio" id="mem_gender" value="여성" name="u_sex">여
                </div>

                <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary">회원가입</button>
                </div>
            </sf:form>
        </div>
    </article>

</body>

</html>

