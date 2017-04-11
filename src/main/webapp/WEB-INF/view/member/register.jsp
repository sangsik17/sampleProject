<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>SampleProject - 회원가입</title>
<script src="/js/jquery-3.1.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/user_register.css">
</head>
<body>
    <div class="container">
        <div class="content">
            <form:form modelAttribute="member" method="post" autocomplete="false">
                <div class="form-box">
                    <div class="input-box">
                        <form:input path="memberId" class="form-control" placeholder="아이디"
                            maxlength="15" />
                        <div class="info">
                            <form:errors path="memberId" cssClass="errorMessage" />
                        </div>

                    </div>
                    <div class="input-box">
                        <form:password path="memberPassword" class="form-control"
                            placeholder="비밀번호" maxlength="15" />
                        <div class="info">
                            <form:errors path="memberPassword" cssClass="errorMessage" />
                        </div>
                    </div>
                    <div class="input-box">
                        <form:password path="confirmPassword" class="form-control"
                            placeholder="비밀번호 확인" maxlength="15" />
                        <div class="info">
<%--                             <form:errors path="confirmPassword" cssClass="errorMessage" /> --%>
                        </div>
                    </div>
                </div>
                <div class="form-box">
                    <div class="input-box">
                        <form:input path="memberName" class="form-control" placeholder="이름"
                            maxlength="10" />
                        <div class="info">
                            <form:errors path="memberName" cssClass="errorMessage" />
                        </div>
                    </div>
                    <div class="input-box">
                        <form:input path="memberEmail" class="form-control"
                            placeholder="이메일" maxlength="30" />
                        <div class="info">
                            <form:errors path="memberEmail" cssClass="errorMessage" />
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary btn-block" id="btn-register">회원가입</button>
            </form:form>
        </div>
    </div>
    <script src="/js/user_register.js"></script>
</body>
</html>