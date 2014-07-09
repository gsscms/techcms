<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type='text/css' rel="stylesheet" href="<%=path%>/web/head foot.css"/>
<title>无标题文档</title>
<style>
 body{font-family:'微软雅黑';}
.loginBox{width:1000px;margin:20px auto;}
.login_top{width:1000px;height:218px;background:url(<%=path%>/img/login_01.jpg) no-repeat;}
.login_center{width:1000px;height:488px;}
.center_1{width:574px;height:436px;background:url(<%=path%>/img/login_02.jpg) no-repeat;float:left;}
.center_2{width:375px;height:436px;background:url(<%=path%>/img/login_03.jpg) no-repeat;float:left;}
.login_area{width:292px; height:340px;margin:45px auto;position:relative;}
.text{width:100%;height:60px;background:url(<%=path%>/img/text.png) no-repeat;}
input{width:260px;height:40px;margin-bottom:20px;padding-left:30px;}
.number,.password,.yzm_text{position:absolute;left:12px;color:#acacac;font-size:18px;padding-left:30px;}
.number{top:72px;background:url(<%=path%>/img/number.png) no-repeat;width:260px;line-height:29px;}
.password{background:url(img/password.png) no-repeat;top:138px;line-height:27px;}
.yzm_text{line-height:44px;left:-15px;}
.input_yzm{width:130px;height:40px;margin-right:10px;float:left;}
.yzm{background:url(<%=path%>/img/yzm.png);width:118px; height:45px;}
.yzm_img{height:45px;background-color:#a4a4a4;border:1px solid #bac4cd;margin-left:175px;}
.auto_login{position:relative;margin-top:20px;	}
.auto_login span{position:absolute;left:30px;font-size:12px;line-height:28px;}
.checkbox{width:22px;height:22px;position:absolute;left:-4px;margin-bottom:0px;}
.button{width:290px;height:46px;background:url(<%=path%>/img/button.jpg) no-repeat;margin-top:60px;}
.center_3{width:51px;height:436px;background:url(<%=path%>/img/login_04.jpg) no-repeat;float:left;}
.center_4{width:574px;height:52px;background:url(<%=path%>/img/login_05.jpg) no-repeat;float:left;}
.center_5{width:426px;height:52px;background:url(<%=path%>/img/login_06.jpg) no-repeat;float:left;}
.bottom_bj{background-color:#f3f3f3;height:65px;}
.bottom{width:1000px; height:55px;background-color:#03825f;line-height:55px;text-align:center;font-size:12px;}

</style>
<script type="text/javascript">
	function login(){
	    document.forms[0].action = "<%=path%>/login";
		document.forms[0].submit();
	}
</script>
</head>

<body>
	<div class="loginBox">
		<div class="login_top"></div>
		<div class="login_center">
			<div class="center_1"></div>
			<form action="" onsubmit="retur false;" method="post">
			<div class="center_2">
				<div class="login_area">
					<div class="text"></div>
					<input type="text" name="user.name" /><div class="number">帐号</div>
					<div class="password">密码</div><input type="password" name="user.password"></input>
					<div class="yzm_text">验证码</div><input type="text" class="input_yzm"/>
					<div class="yzm_img">
						
						<div class="yzm"></div>
					</div>			
					<div class="button" onclick="return login();"></div>
				</div>
			</div>
			</form>
			<div class="center_3"></div>
			<div class="center_4"></div>
			<div class="center_5"></div>
		</div>
		<div class="bottom_bj"></div>
		<div class="bottom">技术支持：中国中医科学院信息管理中心</div>
		
	</div>
</body>
</html>
