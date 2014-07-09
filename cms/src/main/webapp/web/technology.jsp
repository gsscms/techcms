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
<title>无标题文档</title>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/util.js"></script>
<style>
.banner{width:1000px; height:275px; background:url(pic/banner.png) no-repeat; margin-top:15px;}
.Technology{width:998px;height:320px;border:1px solid #30a270;margin:5px 0px; position:relative;border-top:none;}
.TechnologyTitle{width:100%;height:50px;background:url(pic/Technology-pic1.jpg) repeat-x;}
.TechnologyTitleText{width:92px;height:50px;background:url(pic/Technology-pic5.jpg) no-repeat;position:absolute;top:0;left:10px;}
.TechnologyGxy{width:970px;margin:10px auto;height:260px;}
.TechnologyGxy p,.TechnologyXjt p,.TechnologyTnb p{font-family:'微软雅黑';line-height:22px;}
.TechnologyGxy p .green,.TechnologyXjt .green,.TechnologyTnb .green{color:#45c1a6;font-size:18px;}
.TechnologyGxy img,.TechnologyXjt img{float:left;width:180px;height:250px;}
.TechnologyGxyList{width:780px;height:260px;margin-left:10px;float:left}

.TechnologyXjtList{width:270px;height:260px;margin-left:10px;float:left}
.list{height:110px;font-family:'微软雅黑';line-height:30px;font-size:14px;}
.dotted{border-bottom:1px #ccc dotted;height:10px;}
.TechnologyGxyList a,.TechnologyXjt a,.TechnologyTnb a{color:#012bb1;float:right;}
.TechnologyGxyListTitle{width:780px;}
.TechnologyGxyListDate{float:right;}
.TechnologyGather{width:970px;margin:0 auto;}
.TechnologyXjt{width:475px;margin:10px auto;float:left;margin-right:10px;}
.TechnologyTnb{width:480px;margin:10px auto;float:left;}
.TechnologyTnb img{float:left;width:180px;height:250px;}
.TechnologyTnbList{width:270px;height:260px;margin-left:10px;float:left}
</style>

<script type="text/javascript">
function setFirstType(obj){
    var content = $("<div/>").addClass("TechnologyGxyList")
    						 .append('<p><span class="green">'+obj.value+'</span></p>')
    						 .attr("id",obj.id);
   var top = $("<div/>").addClass("TechnologyGxy")
    			.append($("<img/>").attr("src","<%=path%>"+obj.path))
    			.append(content);
   $("#tech").append(top);
   $.ajax({
	 	url:"<%=path%>/webSkill!forDisplaySkillInfo",
	 	dataType:"json",
	 	data:{
	 		dictId:obj.id 	    
	 	},
	 	success:function(items){
	 	   $.each(items, function (i,item) {
	 	      var d =new Date(item.createTime).format('yyyy-MM-dd');
	 	       var list=$("<div>").addClass("list")
	 	       						.append('<span class="TechnologyGxyListTitle">'+item.name+'<em class="TechnologyGxyListDate">发布时间：'+d+'</em></span>')
	 	       						.append("<p>"+item.composition.substr(0,150)+"<a href='<%=path%>/web/skillDetail.jsp?id="+item.id+"'>[详细]</a><p/>")
	 	       						.append('<div class="dotted"></div>');
	 	       $("#"+obj.id).append(list);
	 	   });
			
	 	}
   });
}


$(document).ready(function(){
    
    $.ajax({ 
		url:"<%=path %>/webSkill!forDisplaySkillType",
		success:function(data){
		   if(data!=null&&data.length>1){
		       setFirstType(data[0]);
		       //循环开始
		       for(var i=1;i<data.length;){
			   		//设置左边
			   		var leftContent=$("<div/>").addClass("TechnologyXjtList")
			   								   .append('<p><span class="green">'+data[i].value+'</span></p>')
			   								   .append($("<div/>").addClass("list").attr("id",data[i].id));
			   		var left=$("<div/>").addClass("TechnologyXjt")
			   							.append('<img src="'+"<%=path%>"+data[i].path+'"/>')
			   							.append(leftContent);
			   		var divC= $("<div/>").addClass("TechnologyGather")
						 .append(left);
			 		//设置右边
			  		 if(i+1<data.length){
			  		    var rightContent=$("<div/>").addClass("TechnologyTnbList")
						   							.append('<p><span class="green">'+data[i+1].value+'</span></p>')
						   							.append($("<div/>").addClass("list").attr("id",data[i+1].id)); 
			  		     
			  		     var right=$("<div/>").addClass("TechnologyTnb")
									.append('<img src="'+data[i+1].path+'"/>')
									.append(rightContent);
				  		divC.append(right);
			  		 }
			  		
			  		setLeft(data[i]);
			  		if(i+1<data.length){
			  		  setLeft(data[i+1]);
			  		}
			   		$("#tech").append(divC)
			   				  .height($("#tech").height()+300);
			   		
			  		i+=2;
			   
		       }
		       //循环结束 
		   }		
  
		}
    });
    
});

function setLeft(obj){
    $.ajax({
 	url:"<%=path%>/webSkill!forDisplaySkillInfo",
 	dataType:"json",
 	data:{
 		dictId:obj.id 	    
 	},
 	success:function(items){
 	   $.each(items, function (i,item) {
 	      var d =new Date(item.createTime).format('yyyy-MM-dd');
 	       $("#"+obj.id).append('<span class="TechnologyGxyListTitle">'+item.name+'<em class="TechnologyGxyListDate">发布时间：'+d+'</em></span>')
 	       						.append("<p>"+item.composition.substr(0,45)+"<a href='<%=path%>/web/skillDetail.jsp?id="+item.id+"'>[详细]</a><p/>")
 	       						.append('<div class="dotted"></div>');

 	   });
		
 	}
});
}

</script>
</head>

<body>
	<div class='container'>
			 <jsp:include page="header.jsp" flush="true"/> 

<!-- 		<div class="banner"></div>  -->
	<div class="Technology" id="tech">
			<!-- 标题 start-->
			<div class="TechnologyTitle">
				<div class="TechnologyTitleText"></div>
			</div>
			<!-- 标题 end-->
			<!-- start -->
<!-- 			<div class="TechnologyGxy"> -->
<!-- 				<img src="pic/Technology-pic2.jpg"/> -->
<!-- 				<div class="TechnologyGxyList"> -->
<!-- 					<p><span class="green">高血压</span></p> -->
<!-- 					<div class="list">						 -->
<!-- 						<span class="TechnologyGxyListTitle">肥胖症针灸疗法<em class="TechnologyGxyListDate">发布时间：2014-5-17</em></span> -->
<!-- 						<p>正常人的血压随内外环境变化在一定范围内波动。在整医生面对患者时在参考标准的基础上，体人群，血压水平随年龄逐渐升高，以收缩压更为明显，但50岁后舒张压呈现下降趋势，脉压也随之加大。近年来，人们对心血管病多重危险因素作用以及心、脑、肾靶器官保护的认识不断深入，高血压的诊断标准也在不断调整，目前认为同一血压水平<a>[详细]</a></p> -->
<!-- 						<div class="dotted"></div> -->
<!-- 					</div> -->
					
<!-- 					<div class="list">						 -->
<!-- 						<span class="TechnologyGxyListTitle">肥胖症针灸疗法<em class="TechnologyGxyListDate">发布时间：2014-5-17</em></span> -->
<!-- 						<p>正常人的血压随内外环境变化在一定范围内波动。在整医生面对患者时在参考标准的基础上，体人群，血压水平随年龄逐渐升高，以收缩压更为明显，但50岁后舒张压呈现下降趋势，脉压也随之加大。近年来，人们对心血管病多重危险因素作用以及心、脑、肾靶器官保护的认识不断深入，高血压的诊断标准也在不断调整，目前认为同一血压水平的患者发生心血管病的危险不同，因此有了血压分层的概念，即发生心血管病危险度不同的患者<a>[详细]</a></p> -->
<!-- 						<div class="dotted"></div> -->
<!-- 					</div> -->
<!-- 				</div>			 -->
<!-- 			</div> -->
			<!-- end -->
<!-- 			<div class="TechnologyGather"> -->
<!-- 				left start -->
<!-- 				<div class="TechnologyXjt"> -->
<!-- 					<img src="pic/Technology-pic3.jpg"/> -->
<!-- 					<div class="TechnologyXjtList">	 -->
<!-- 						<p><span class="green">高血压</span></p> -->
<!-- 						<div class="list"> -->
<!-- 							<span class="TechnologyGxyListTitle">肥胖症针灸疗法<em class="TechnologyGxyListDate">发布时间：2014-5-17</em></span> -->
<!-- 							<p>正常人的血压随内外环境变化在一定范围内波动。在整医生面对患者时在参考标准的基础上，体人群，血压水平<a>[详细]</a></p> -->
<!-- 							<div class="dotted"></div> -->
<!-- 							<span class="TechnologyGxyListTitle">肥胖症针灸疗法<em class="TechnologyGxyListDate">发布时间：2014-5-17</em></span> -->
<!-- 							<p>正常人的血压随内外环境变化在一定范围内波动。在整医生面对变化在一定范围内患者时在参考标准的基础上，体人群，血压水平血压分层的概念<a>[详细]</a></p> -->
<!-- 							<div class="dotted"></div> -->
						
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				left end -->
<!-- 				right start -->
<!-- 				<div class="TechnologyTnb"> -->
<!-- 					<img src="pic/Technology-pic4.jpg"/> -->
<!-- 					<div class="TechnologyTnbList"> -->
<!-- 						<p><span class="green">高血压</span></p> -->
<!-- 						<div class="list"> -->
<!-- 							<span class="TechnologyGxyListTitle">肥胖症针灸疗法<em class="TechnologyGxyListDate">发布时间：2014-5-17</em></span> -->
<!-- 							<p>正常人的血压随内外环境变化在一定范围内波动。在整医生面对患者时在参考标准的基础上，体人群，血压水平<a>[详细]</a></p> -->
<!-- 							<div class="dotted"></div> -->
<!-- 							<span class="TechnologyGxyListTitle">肥胖症针灸疗法<em class="TechnologyGxyListDate">发布时间：2014-5-17</em></span> -->
<!-- 							<p>正常人的血压随内外环境变化在一定范围内波动。在整医生面对变化在一定范围内患者时在参考标准的基础上，体人群，血压水平血压分层的概念<a>[详细]</a></p> -->
<!-- 							<div class="dotted"></div> -->
						
<!-- 						</div> -->
					
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				right end -->
<!-- 			</div> -->
		</div>
		
   <jsp:include page="footer.jsp" flush="true"/> 

    </div>
</body>
</html>
