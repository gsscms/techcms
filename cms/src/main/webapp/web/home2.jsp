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

<script type="text/javascript" src="<%=path %>/js/jquery.jcarousel.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path %>/tango/skin.css" />

<link href="style.css" type="text/css" rel="stylesheet"/>

<script src="focus.js" type="text/javascript"></script>	
<title>无标题文档</title>
<style>
/* .banner{width:1000px; height:275px; background:url(pic/banner.png) no-repeat; margin-top:15px;} */
.show{width:1000px;height:125px;}
.show div{width:299px;height:109px;float:left;}
.contentUp span{width:1000px;height:60px;line-height:60px;display:block;text-align:center;color:#728000;font-size:24px;font-family:'微软雅黑';}
.show .leftbtn,.show .rightbtn{width:22px;margin-top:20px;}
.show .leftbtn{background:url(pic/left_btn.png)no-repeat;}
.show .rightbtn{background:url(pic/right_btn.png)no-repeat;}
.show .img1{background:url(pic/pic14.png) no-repeat;margin-right:15px;margin-left:13px;}
.show .img2{background:url(pic/pic15.png) no-repeat;margin-right:15px;}
.show .img3{background:url(pic/pic16.png) no-repeat;margin-right:15px;}
.topLi {background:url(pic/pic20.png) no-repeat;align:center}
.topLiSelect {background:url(pic/pic19.png) no-repeat;align:center}
.topLiSelect span{color: #FFFFFF;padding: 0 8px;text-decoration: none;font-size: 20px;position: absolute;top: 35px;float:center;}
.topLi span{color: #FFFFFF;padding: 0 8px;text-decoration: none;font-size: 20px;position: absolute;top: 35px;float:center;}
.contentUp{width:1000px;border:1px solid #d2d2d2;padding:5px 0px;}
.contentUp p,.contentDown p{font-family:'微软雅黑';font-size:14px;line-height:30px;width:98%;margin:0 auto;}
.contentDown{width:1000px;height:370px;border:1px solid #d2d2d2;padding:10px 0px;position:relative;margin-top:20px;margin-bottom:20px;}
.contentDownTitle{width:910px;height:40px;line-height:40px;background-color:#f6f6f6;font-family:'黑体';font-size:20px;color:#0ba382;padding-left:80px;margin-bottom:20px;}
.contentDownImgL{position:absolute;left:0;top:0;background:url(pic/pic17.png) no-repeat;width:98px;height:87px;}
no-repeat;width:124px;height:182px;}


</style>

<script type="text/javascript">

jQuery(document).ready(function() {
    
	$.ajax({ 
		url: "<%=path %>/webSkill!homeDisplaySkill",
		success:function(data){
		   if(data!=null)
		    $.each(data, function (i,item) {
				$("#imgUl").append('<li class="jcarousel-item-1" onclick=liclick("'+item.id+'")><div class="topLi" id="'+item.id+'"><span>&nbsp;&nbsp;&nbsp;&nbsp;'+item.name+'</span></div>'
					+'<input type="hidden" value="'+item.name+'" id="'+item.id+'inputName"/>'
					+'<input type="hidden" value="'+item.composition+'" id="'+item.id+'Cons"/>'
					+'</li>');				
			});
		   liclick(data[0].id);
			   jQuery('#mycarousel').jcarousel({
			    	wrap: 'circular',
					scroll: 1,
					animation:'slow'
			    });
		}
	});	
	
	
	$.ajax({ 
	    url: "<%=path %>/topicAction!getHomeDisplay", 
	    success: function(data){
		  if(data!=null){
// 		      $("#topicP")
			$("#topicP").append(data.content);	
		  }
		   
			
		  
	}});	
 
});

function liclick(id){
	if(id==$("#displayId").val())
	    return;
    var black="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    $("#techSpan").html("");
    $("#techSpan").append($("#"+id+"inputName").val());
    $("#techP").html("");
    $("#techP").append(black+$("#"+id+"Cons").val());
    
    $("#"+id).removeClass("topLi"); 
    $("#"+id).addClass("topLiSelect"); 
    $("#"+$("#displayId").val()).removeClass("topLiSelect"); 
    $("#"+$("#displayId").val()).addClass("topLi"); 
    $("#displayId").val(id);
}
</script>
</head>

<body>
    <input type="hidden" id="displayId"/>
	<div class='container'>
        <jsp:include page="header.jsp" flush="true"/> 
		
<!-- 		<div class="banner"> -->
			<div class="sub_box">
	
	<div id="p-select" class="sub_nav">

		<div class="sub_no" id="bd1lfsj">
			<ul>
				<li class="show">1</li>
				<li>2</li>
<!-- 				<li>3</li> -->
			</ul>
		</div>
	</div>
	
	<div id="bd1lfimg">
		<div>
			<dl class="show">
				<dt>
					<img src="pic/banner.png"/></dt>

			</dl>
			<dl>
				<dt>
					<img src="images/2.jpg"/></dt>

			</dl>
<!-- 			<dl> -->
<!-- 				<dt> -->
<!-- 					<img src="images/3.jpg" /></dt> -->

<!-- 			</dl> -->
			
		</div>
	</div>
</div>

<script type="text/javascript">movec();</script>

		
<!-- 		</div>   -->

	<div class="show jcarousel-skin-tango" id="mycarousel">
	<div class="jcarousel-container">
		<div class="jcarousel-clip">
			<ul id="imgUl" >
					
			</ul>
		</div>
		<div disabled="disabled" class="jcarousel-prev jcarousel-prev-disabled">
			<img id="showcase_thumb_prev" src="<%=path %>/web/pic/left_btn.png" style="cursor:pointer;"/>
		</div>
		<div class="jcarousel-next">
			<img id="showcase_thumb_next" src="<%=path %>/web/pic/right_btn.png" style="cursor:pointer;"/>
		</div>
	</div>
</div>
		<div class="contentUp">
			<span id="techSpan"></span>
			<p id="techP"></p>
<!-- 			 <p>经筋微创疗法”是以源于《黄帝内经》、经薛立功老师二十余年挖掘整理出的“经筋理论”为理论基础，运用仿古长圆针，选取相关结筋病灶点，施以“解结”法，以治疗顽固疼痛（深邪远痹）及筋性经络内脏病的疗法。该疗法擅长改善疼痛症状，属于一种类似于小针刀的微创疗法（需局部麻醉）。该技术对疼痛症状改善明显，具有一定优势。</p> -->
<!-- 			<p>  微创针刀镜技术“微创针刀镜技术”是在中医经筋理论和经络水通道学说的指导下，在《灵枢》“九针”以及现代小针刀的基础上，融入现代医学的解剖学理论和内窥镜技术，所形成的一种微创、可视的手术（需局部麻醉）。其擅长治疗类风湿性关节炎和膝骨性关节。该技术较一般手术操作简单、创伤小、康复快、副作用小、症状改善明显，具有一定的优势。特地来找李政主任看病的。凭借专业专注，赢得了“泉州男性守护者”的称号。</p> -->
			
		</div>
		<div class="contentDown">
			<div class="contentDownTitle">中医独特技术的规范与评价研究</div>
			<div class="contentDownImgL"></div>
			<p><img src="pic/pic18.png" align ="right" id="topicP">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<!-- 			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我国基层和民间蕴含着丰富的中医独特技术，长期以来以其简便效廉、效果独特为广大群众所接受。但目前许多被大众推崇的或者具有传承性质的中医独特技术，由于缺乏科学、客观、准确的有效性和安全性研究证据而难以被广泛承认，同时一些虚假的技术不辨真伪，也会给民众带来危害。本项目拟通过建立独立的评价研究团队，以循证医学的理念，临床流行病学的方法，结合具体中医独特技术的特点，开展观察与验证性相结合的研究，建立适用于中医独特诊疗技术的评价方法体系，为中医独特诊疗技术提供有说服力的临床研究证据，进而为今后我国挖掘推广中医药特色强，疗效好，解决重大疑难问题的诊疗技术奠定基础。</p> -->
<!-- 			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基于此，本项目将开展中医独特诊疗技术的评价工作，为其提供疗效与安全性评价的科学证据，为下一步的推广工作奠定基础。评价工作的成果中，中医特定技术或方法仍归持有人或传承人所有，由此产生的知识产权归技术持有人所有。</p> -->
<!-- 			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本项目欢迎各类中医独特诊疗技术持有人前来合作。</p> -->
			
		</div> 
   
       <jsp:include page="footer.jsp" flush="true"/> 
    </div>
</body>
</html>
    