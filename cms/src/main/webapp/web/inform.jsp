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
<script type="text/javascript" src="<%=path %>/js/util.js"></script>
<title>中医独特诊疗技术研究平台-公告通知</title>
<style>
.IntroductionBox{width:998px;height:800px;border:1px solid #08946d;margin:10px 0px;position:relative;font-family:'微软雅黑';font-size:12px;}
.informTitle{width:99%; height:50px; background:#47c29a;margin:5px;}
.informTitle img{margin:0px 10px;float:left;}
.informTitle span{font-size:16px; line-height:50px; height:50px; display:block;color:#fff;}
.informTitleCaption{width:98%;margin:10px auto;}
.informTitleCaption dt{color:#18c69e;font-size:18px;line-height:30px;}
.informTitleCaption dd{line-height:22px;}
.informTitleCaption span{float:right;}
</style>

<script type="text/javascript">
	$(function() {
	    initPublicInfo();
// 		$.ajax({ 
<%-- 		    url: "<%=path %>/publicInfoGridAction!publicDict",  --%>
// 		    success: function(data){
// 				$.each(data, function (i,item) {					
// 					$("#publicInfoDiv").append("<dl id='"+item.id+"Dl'>"+ "<dt>"+item.value+"</dt>"+"</dl>");					
// 				});
// 				initPublicInfo();
// 			}
			  
// 		});		

	});
	
	function initPublicInfo(){
	    $.ajax({ 
		    url: "<%=path %>/webInfo!webInitPublicInfo", 
		    success: function(data){
				$.each(data, function (i,item) {
					var dl = $("#dl");
					var d =new Date(item.createTime).format('yyyy-MM-dd');
					dl.append("<dd><a href='<%=path%>/web/trainDetail.jsp?id="+item.id+"'>"+item.title+"</a><span>"+d+"</span></dd>");
				});
				
			}
			  
		});		
	}
</script>

</head>

<body>
	<div class='container'>
	 <jsp:include page="header.jsp" flush="true"/> 

		<div class="IntroductionBox">
			<div class="informTitle">
				<img src="pic/Training-pic1.jpg"/>
				<span>公告通知</span>
			</div>
			<div class="informTitleCaption" id="publicInfoDiv">				
				<dl id="dl">
<!-- 					<dt>XXXXXX分类</dt> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> -->
<!-- 					<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd>					 -->
					
				</dl>
			</div>
			
			
		</div>
   <jsp:include page="footer.jsp" flush="true"/> 

    </div>
</body>
</html>
