<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
	String id= request.getParameter("id");
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
.IntroductionBoxTitleImg{width:170px;height:50px;top:0;left:10px;position:absolute;
background:url(pic/Training-pic1.jpg) no-repeat;}
.IntroductionBox p{font-family:'微软雅黑';font-size:14px;line-height:30px;width:960px;margin:0 auto;}
.IntroductionBox img{margin:5px;}
.IntroductionBoxSmall{width:205px;height:36px;background:url(pic/Introduction-pic3.png) no-repeat;position:absolute;top:80px;left:496px;}
.IntroductionBoxTitleImg span {
    color: #FFFFFF;
    display: block;
    font-size: 16px;
    height: 50px;
    line-height: 50px;
}
</style>
<script type="text/javascript">
$(function() {
    
    
    $.ajax({
	url:"<%=path%>/skillAction!webSkillDetail",
	dataType:"json",
	data:{
	    techId:"<%=id%>"
	},
	success:function(data){
		  // alert(data.composition);
		  	$("#nameP").append(data.name);
		  	$("#source").append(data.sourceText);
		  	$("#type").append(data.typeText);
			$("#disease").append(data.diseases);
			$("#preApp").append(data.preApp);
	   		$("#contentP").append(data.composition);
	    
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
<!-- 			<div class="IntroductionBoxSmall"></div> -->
			<p id="nameP">技术名称:&nbsp;&nbsp;&nbsp;&nbsp;</p>
			<p id="source">技术来源:&nbsp;&nbsp;&nbsp;&nbsp;</p>
			<p id="type">技术类别:&nbsp;&nbsp;&nbsp;&nbsp;</p>
			<p id="disease">针对病症:&nbsp;&nbsp;&nbsp;&nbsp;</p>
			<p>前期应用:</p>
			<p id="preApp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			
			<p>技术组成：</p>
			<p id="contentP">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 			<br/><br/> -->
		</p>
		</div>
			<jsp:include page="footer.jsp" flush="true"/> 
   

    </div>
</body>
</html>