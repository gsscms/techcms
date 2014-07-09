<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<title>无标题文档</title>
<style>
.TrainingBox{width:1000px; height:870px; margin:10px 0px; font-family:'微软雅黑';}
.TrainingImg{width:440px; height:292px; background:#47c29a;float:left;}
.TrainingImg img{width:424px; height:273px; margin:9px 7px;}
.TrainingHotnews{width:550px; height:292px; float:left; margin-left:8px; float:left;}
.TrainingHotnews span{float:right;}
.TrainingHotnewsTitle{width:100%; height:50px; background:#47c29a;}
.TrainingHotnewsTitle img{margin:0px 10px;float:left;}
.TrainingHotnewsTitle p{font-size:16px; line-height:50px; height:50px; display:block;color:#fff;}
.TrainingHotnewsCaption{width:98%;margin:10px auto;}
.TrainingHotnewsCaption ul li{font-size:12px;font-family:'微软雅黑';line-height:22px;}
.TrainingHotnewsTitle2{width:997px;border:1px solid #47c29a;float:left;margin-top:10px;font-size:12px;}
.TrainingHotnewsTitle2Top{width:98%;height:225px;margin:5px auto;padding:12px 0px;border-bottom:1px dotted #ccc;}

.Title2Left{width:468px;float:left;border-right:1px #ccc dotted;padding:10px;}
.noRightBorder{border-right:0;}
.noBottomBorder{border-bottom:0;}
.Title2Left dt{color:#18c69e;font-size:18px;line-height:30px;}
.Title2Left dd{line-height:22px;}
.Title2Left span{float:right;font-size:12px;font-family:'微软雅黑';}
a{color:#000000}
</style>

<script type="text/javascript">
$(function() {
    
    $.ajax({ 
	    url: "<%=path %>/trainGridAction!trainDict", 
	    success: function(data){
			
			for(var i=0;i<data.length;){
			    var leftdl=$("<dl/>").attr("id",data[i].id).append($("<dt/>").append(data[i].value).append("<span><a href='<%=path%>/web/subTrain.jsp?id="+data[i].id+"'>更多>><a></span>"));
			    var left=$("<div/>").addClass("Title2Left").append(leftdl);
			    
			    var div=$("<div/>").addClass("TrainingHotnewsTitle2Top").append(left);
			    if(i+1<data.length){
				  var rightdl=$("<dl/>").attr("id",data[i+1].id).append($("<dt/>").append(data[i+1].value).append("<span><a href='<%=path%>/web/subTrain.jsp?id="+data[i+1].id+"'>更多>><a></span>"));
				  var right=$("<div/>").addClass("Title2Left noRightBorder").append(rightdl);
				  div.append(right);
				  i+=2;
			    }
			    $("#trainDiv").append(div);
			   
			}
			for(var i=0;i<data.length;i++){
			    setInfo($("#"+data[i].id),data[i].id);
			}
			
		}
	});
    
    $.ajax({
		url:"<%=path%>/webInfo!lastTrain",
		success:function(data){
		    $.each(data, function (i,item) {
			   var a = $("<a />").attr("href","<%=path%>/web/trainDetail.jsp?id="+item.id)
			   				.append(item.title);
				var d =new Date(item.createTime).format('yyyy-MM-dd');
			   var span =$("<span />").append(d);

			   $("#topUL").append(
				  $("<li/>").append(a)
				  			.append(span)
				  			);
		    });
		}
    });
    
});

function setInfo(dl,id){
    $.ajax({
		url:"<%=path%>/webInfo!trainByDictType",
		dataType:"json",
		data:{
		    dictId:id
		},
		success:function(data){
		    $.each(data, function (i,item) {
				var d =new Date(item.createTime).format('yyyy-MM-dd');
			    dl.append("<dd><a href='<%=path%>/web/trainDetail.jsp?id="+item.id+"'>"+item.title+"</a><span>"+d+"</span></dd>  ");
			
		    });

		     
		}
	
    });
}
</script>

</head>

<body>
	<div class='container'>
	 <jsp:include page="header.jsp" flush="true"/>

		<div class="TrainingBox">
			<div class="TrainingImg">
				<img src="pic/Training-img.jpg"/>
			</div>
			<div class="TrainingHotnews">
				<div class="TrainingHotnewsTitle">
					<img src="pic/Training-pic1.jpg"/>
					<p>最新交流培训</p>
					
				</div>
				<div class="TrainingHotnewsCaption" >
					<ul id="topUL">
<!-- 						<li><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></li> -->


					</ul>
				
				</div>
			</div>
			<div class="TrainingHotnewsTitle2 " id="trainDiv">
				<div class="TrainingHotnewsTitle">
					<img src="pic/Training-pic1.jpg"/>
					<p>交流培训</p>
				</div>
<!-- 				<div class="TrainingHotnewsTitle2Top"> -->
<!-- 					<div class="Title2Left "> -->
<!-- 						<dl id="dl1"> -->
<!-- 							<dt id="dt1"></dt> -->
<!--  							<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd>  -->
							
<!-- 						</dl> -->
					
<!-- 					</div> -->
					
<!-- 					<div class="Title2Left noRightBorder"> -->
<!-- 						<dl id="dl2"> -->
<!--  							<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd>  -->
							
<!-- 						</dl> -->
					
<!-- 					</div> -->
				
<!-- 				</div> -->
				
<!-- 				<div class="TrainingHotnewsTitle2Top noBottomBorder"> -->
<!-- 					<div class="Title2Left "> -->
<!-- 						<dl id="dl3"> -->
<!-- 							<dt id="dt3"></dt> -->
<!-- 							<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd>  -->
						
<!-- 						</dl> -->
					
<!-- 					</div> -->
					
<!-- 					<div class="Title2Left noRightBorder"> -->
<!-- 						<dl id="dl4"> -->
<!-- 							<dt id="dt4"></dt> -->
<!-- 						<dd><a>交流培训交流培训交流培训交流培训交流培训交流培训交流培训交流培训</a><span>2014-5-17</span></dd> --> 
							
<!-- 						</dl> -->
					
<!-- 					</div> -->
				
<!-- 				</div> -->
					
			</div>
		</div>
		<jsp:include page="footer.jsp" flush="true"/> 

    </div>
</body>
</html>
