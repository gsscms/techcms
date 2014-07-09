<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type='text/css' rel="stylesheet" href="head foot.css"/>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
<title>平台介绍</title>
<style>
.IntroductionBox{width:998px;height:800px;border:1px solid #08946d;margin:10px 0px;position:relative;}
.IntroductionBoxTitle{width:980px;height:50px;background-color:#47c29a;margin:8px;position:relative;}
.IntroductionBoxTitleImg{width:170px;height:50px;top:0;left:10px;position:absolute;background:url(pic/Introduction-pic1.jpg) no-repeat;}
.IntroductionBox p{font-family:'微软雅黑';font-size:14px;line-height:30px;width:960px;margin:0 auto;}
.IntroductionBox img{margin:5px;}
.IntroductionBoxSmall{width:205px;height:36px;background:url(pic/Introduction-pic3.png) no-repeat;position:absolute;top:80px;left:496px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
   
    $.ajax({
		type: "POST",
        url: "<%= path%>/webInfo!webPlatform.action",
      //  data: {username:$("#username").val(), content:$("#content").val()},
        dataType: "json",
        success: function(data){
           $("#contentP").append(data.content);
        }
    });
	
    
});
</script>
</head>

<body>
	
	<div class='container'>
			 <jsp:include page="header.jsp" flush="true"/>

		<div class="IntroductionBox">
			<div class="IntroductionBoxTitle">
				<div class="IntroductionBoxTitleImg"></div>				
			</div>
			<div class="IntroductionBoxSmall"></div>
			<p id="contentP"><img src="<%=path%>/upload/platformImage.jpg" align ="left"/><br/><br/>
<!-- 			中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学，XXXXX中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学，XXXXX中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学，XXXXX中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学，XXXXX中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学，XXXXX中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学，XXXXX中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学，XXXXX中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学，XXXXX中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学，XXXXX中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学，XXXXX中医独特技术平台为挖掘中国有效的中医技术，弘扬中国传统医学， -->
<!-- 				我最近上网特别多，逛微博，发现“没头脑”和“不高兴”的言论基本占一半。年轻人感觉不到战争的残忍，天天鼓动跟那个打一仗、跟这个打一仗，跟打电脑游戏似的。 -->
<!-- 　　<br/>我们可以把日本当成对手，但一定要向对手学习好的东西，这样才有可能成为他真正的对手。不管是作家、军事研究者还是普通读者，每增加一个理性对待战争的人，就会让国家多一份力量。其实我们每个人都有理性的平台，我建议就从微博、微信开始。 -->
			</p>
		</div>
			<jsp:include page="footer.jsp" flush="true"/> 
   

    </div>
</body>
</html>