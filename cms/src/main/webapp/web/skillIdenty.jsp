<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link type='text/css' rel="stylesheet" href="head foot.css"/>
<style>



.container .main{padding-bottom:100px;} 
.container .main .content{height:450px;background:url(pic/pic04.jpg) repeat-x;position:relative;}
.container .main span{font-family:'黑体'; font-weight:bold;text-align:center;position:absolute;display:block}

.container .main .title{line-height:80px;color:#138465;font-size:26px;width:319px;height:81px;background:url(pic/pic11.png) repeat-y;left:315px;top:90px;}

.container .main .block{line-height:80px;font-size:26px;color:#057d5c;width:221px;height:79px;background:url(pic/pic06.png) 0px 1px no-repeat;}
.container .main .block1{left:180px;top:28px;}
.container .main .block2{left:543px;top:28px;}
.container .main .block3{left:180px;top:212px;}
.container .main .block4{left:543px;top:212px;}
.container .main .block5{left:357px;top:397px;}

.container .main .line1{width:147px;height:19px;background:url(pic/pic06.png) 0px -184px no-repeat;left:398px;top:58px;}
.container .main .line2{width:44px;height:202px;background:url(pic/pic06.png) -73px -211px no-repeat;left:765px;top:62px;}
.container .main .line3{width:147px;height:19px;background:url(pic/pic06.png) 0px -165px no-repeat;left:398px;top:237px;}
.container .main .line4{width:223px;height:206px;background:url(pic/pic06.png) 0px -426px no-repeat;left:132px;top:246px;}


.container .main .button{font-size:22px;color:white;width:196px;height:71px;background:url(pic/pic12.png);left:628px;top:405px;}
.container .main .button:hover{cursor:pointer;background:url(pic/pic13.png);}

.correlationRightTitle{width:100%; height:50px; background:#47c29a; margin: 5px 0;}
.correlationRightTitle img{margin:0px 5px;float:left;}
.correlationRightTitle span{font-size:16px; line-height:50px; height:50px; display:block;color:#fff;}

</style> 

</head>

<body>
	<div class='container'>

		 <jsp:include page="header.jsp" flush="true"/> 
		         		<div class="correlationRightTitle">
						<img src="pic/Training-pic1.jpg"/>
						<span id="titleSpan">中医独特技术认证流程</span>
					</div>
        <div class='main'>

        	<div class='content'>



            	<span class="block block1">个人信息注册</span>
                <span class="block block2">技术资料登记</span>
                <span class="block block3">独特技术论证</span>
                <span class="block block4">独特技术审查</span>
                <span class="block block5">认证发布</span>
                <span class="line line1"></span>
                <span class="line line2"></span>
                <span class="line line3"></span>
                <span class="line line4"></span>
                <a href="<%= path%>/web/register.jsp"><span class="button"></span>  </a>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>

    </div>
</body>
</html>