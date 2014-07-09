<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type='text/css' rel="stylesheet" href="head foot.css"/>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
<title>中医独特诊疗技术研究平台后台管理-联系我们</title>
<style>
.IntroductionBox{width:998px;height:800px;border:1px solid #08946d;margin:10px 0px;position:relative;font-family:'微软雅黑';font-size:12px;}
.contactTitle{width:99%; height:50px; background:#47c29a;margin:5px;}
.contactTitle img{margin:0px 10px;float:left;}
.contactTitle p{font-size:16px; line-height:50px; height:50px; display:block;color:#fff;}
.contactCaption{width:98%;margin:10px auto;}
.contactCaption dt{color:#18c69e;font-size:18px;line-height:30px;}
.contactCaption dd{line-height:30px;font-size:14px;}
.map{width:95%;height:580px;background:url(pic/map.jpg);margin:10px;border:1px solid #ccc;background-position: center;background-repeat: no-repeat;
}
</style>
<script>
$(function() {
    
    $.ajax({ 
	url: "<%=path %>/contactAction!initContact",
	success:function(data){
	    if(data!=null){
			$("#telDD").append(data.tel);
			$("#emailDD").append(data.email);
			$("#addressDD").append(data.address);
	    }
	     	
	}
	});	

    
});

</script>
</head>

<body>
	<div class='container'>
	 <jsp:include page="header.jsp" flush="true"/> 

		<div class="IntroductionBox">
			<div class="contactTitle">
					<img src="pic/Training-pic1.jpg"/>
					<p>联系我们</p>
				</div>
			<div class="contactCaption">				
				<dl>
					<dt>联系方式：</dt>
					<dd id="telDD">电话：</dd>
					<dd id="emailDD">邮箱：</dd>
					<dd id="addressDD">地址：</dd>					
				</dl>
			</div>
			<div class="map"></div>
			
			
		</div>
   	<jsp:include page="footer.jsp" flush="true"/> 

    </div>
</body>
</html>
