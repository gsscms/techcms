<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
	String id=request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type='text/css' rel="stylesheet" href="head foot.css"/>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/util.js"></script>
<title>中医独特诊疗技术研究平台—相关课题</title>
<style>

.clearfix:after {visibility: hidden;display: block;font-size: 0;content: " ";clear: both;height: 0;}
.banner{width:1000px; height:275px; background:url(pic/banner.png) no-repeat; margin-top:15px;}
.correlationBox{width:1000px;margin:10px 0px;font-family:'微软雅黑';}
.correlationLeft{width:206px;float:left;border:1px solid #47c29a;padding:4px;height: 480px;}
.correlationLeftTitle{width:206px;height:45px;background:url(pic/correlation-pic1.jpg)}
.correlationLeft li{width:206px;height:45px;background:url(pic/correlation-pic2.jpg);margin-top:5px;line-height:45px;color:#3dba98;font-family:'黑体';font-size:18px;text-align:center;}
.correlationRight{width:770px;padding-left:10px;float:left;}
.correlationContent{margin-bottom:10px;}
.correlationRightTitle{width:100%; height:50px; background:#47c29a;}
.correlationRightTitle img{margin:0px 10px;float:left;}
.correlationRightTitle span{font-size:16px; line-height:50px; height:50px; display:block;color:#fff;}
.correlationRight p{padding:5px;font-size:12px;line-height:24px;}
.informTitleCaption{width:98%;margin:10px auto;}
.informTitleCaption dt{color:#18c69e;font-size:18px;line-height:30px;}
.informTitleCaption dd{line-height:22px;}
.informTitleCaption span{float:right;}
</style>
<script type="text/javascript">
		$(function() {
		    
		    $.ajax({
				url:"<%=path%>/trainGridAction!trainDict",
				success:function(data){
				   
				    $.each(data, function (i,item) {
					   var li = $("<li id='"+item.id+"'/>").append(item.value)
					   			.click(function(){
					   			    
					   			 $("#titleSpan").html("");
					   			 $("#titleSpan").append(item.value);
					   			  $.ajax({
					   				url:"<%=path%>/webInfo!trainByDictType",
					   				dataType:"json",
					   				data:{
					   				    dictId:data[i].id
					   				},
					   				success:function(data){
					   				 
					   				    $("#dl").html("");
					   				    $.each(data, function (i,item) {
					   						var d =new Date(item.createTime).format('yyyy-MM-dd');
					   					    $("#dl").append("<dd><a href='<%=path%>/web/trainDetail.jsp?id="+item.id+"'>"+item.title+"</a><span>"+d+"</span></dd>  ");
					   				    });
					   			    	}
					   			    });
					   			
					   			});
						if(item.id==<%=id%>)
						    $("#titleSpan").append(item.value);
					   
					   $("#topicUl").append(li);
				    });
				 
				}
		    });
		    
		    $.ajax({
			url:"<%=path%>/webInfo!trainByDictType",
			dataType:"json",
			data:{
			    dictId:<%=id%>
			},
			success:function(data){
			
			    $.each(data, function (i,item) {
					var d =new Date(item.createTime).format('yyyy-MM-dd');
				    $("#dl").append("<dd><a >"+item.title+"</a><span>"+d+"</span></dd>  ");
			    });
		    	}
		    });
		    
		});
</script>
</head>

<body>
	<div class='container'>
	 <jsp:include page="header.jsp" flush="true"/> 

<!-- 		<div class="banner"></div>   -->
		<div class="correlationBox clearfix">
			<div class="correlationLeft">
				<div class="correlationLeftTitle"></div>
				<ul id="topicUl">
<!-- 					<li>肥胖症针灸疗法</li> -->
<!-- 					<li>肥胖症针灸疗法</li> -->
			
				
				</ul>
			</div>
			<div class="correlationRight" id="rightDic">	
								<div class="correlationContent">
					<div class="correlationRightTitle">
						<img src="pic/Training-pic1.jpg"/>
						<span id="titleSpan"></span>
						<div class="informTitleCaption">
							<dl id="dl">
							
							</dl>
						</div>
						
					</div>
					<p id="desP"></p>
				</div>
			</div>
		
		
		</div>
			<jsp:include page="footer.jsp" flush="true"/> 

    </div>
</body>
</html>
