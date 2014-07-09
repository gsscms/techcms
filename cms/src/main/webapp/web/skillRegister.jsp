<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中医独特技术研究平台-技术资料登记</title>
<link type='text/css' rel="stylesheet" href="head foot.css"/>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
<script src="<%=path %>/formvalidator/formValidator-4.1.3.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path %>/formvalidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<style>


.container .main .register{position:relative;padding-bottom:180px;background:url(pic/pic08.png) no-repeat bottom;width:997px;border-width:1px 1px 0px 1px;border-style:solid;border-color:#e6e6e6;}
.container .main .register h3{width:645px;height:74px;background:url(pic/pic07.png) -75px -126px no-repeat;margin-top:28px;}
.container .main .register .content{height:480px;margin:100px auto;position:relative;top:-203px}
 
.container .main .register ul li{position:absolute;margin-bottom:20px;color:#666666;font-size:14px;} 
.container .main .register ul .li1{left:92px;top:210px;}
.container .main .register ul .li2{left:92px;top:266px;}
.container .main .register ul .li3{left:450px;top:210px;}
.container .main .register ul .li4{left:450px;top:266px;}
.container .main .register ul .li5{left:92px;top:754px;}
.container .main .register ul .li6{left:92px;top:312px;}
.container .main .register ul .li7{left:92px;top:536px;}

.container .main .register ul select{width:190px;height:28px;_height:600000px;}


 .container .main .register ul .li6 .testAreaSpan,
 .container .main .register ul .li7 .testAreaSpan{left:0px;top:0px;position:absolute;width:200px;} 
.container .main .register ul .li6 textarea,.container .main .register ul .li7 textarea{left:0px;top:28px;position:absolute;width:624px;height:120px;}



.container .main .register ul li span{height:28px;display:inline-block;line-height:28px;vertical-align: bottom;}
.container .main .register ul li .input{margin-left:20px;width:190px;height:28px;border:0px solid #e6e6e6;display:inline-block}
.container .main .register ul li .radio{border:none;margin-top:-25px;}
.container .main .register ul li .radio input{margin-left:11px;width:auto;height:auto;}


.container .main .register ul li input{margin-top:4px;margin-top:6px\9;width:180px;height:20px;outline:none;padding-left:8px;}
.container .main .register .ul2{position:absolute;left:400px;width:400px;top:0;}
.container .main .register .button{position:absolute;left:600px;width:120px;height:40px;background:url(pic/pic07.png) right 0 no-repeat;top:800px;text-align:center;font-weight:bold;line-height:40px;color:white;font-size:13px;}
.container .main .register .button2{position:absolute;left:370px;width:87px;height:32px;background:url(pic/pic07.png) -590px 0px no-repeat;top:750px;text-align:center;font-weight:bold;line-height:40px;color:white;font-size:13px;}


.container .main .register .shadowleft{position:absolute;left:-2px;top:0;width:1px;height:100%;background:#f6f6f6;}
.container .main .register .shadowright{position:absolute;left:998px;top:0;width:1px;height:100%;background:#f6f6f6;}

.ls6Validator{left:92px;top:465px;}
.ls7Validator{left:92px;top:696px;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
	    $.formValidator.initConfig({formID:"form1",theme:"126",submitOnce:true,
			onError:function(msg,obj,errorlist){
				$("#errorlist").empty();
				$.map(errorlist,function(msg){
					$("#errorlist").append("<li>" + msg + "</li>");
				});
				alert(msg);
			},
			ajaxPrompt : '有数据正在异步验证，请稍等...'
		});
		
	    $("#skillname").formValidator({onShowText:"请输入技术名称",onShow:"请输入技术名称",onFocus:"技术名称至少2个字符,最多50个字符"})
	    			.inputValidator({min:2,max:50,empty:{emptyError:"技术名称不能为空"},onError:"技术名词应该在50个字符以内。"});
	    $("#disease").formValidator({onShowText:"请输入针对病症",onShow:"请输入针对病症",onFocus:"针对病症至少2个字符,最多50个字符"})
	    			.inputValidator({min:2,max:50,empty:{emptyError:"针对病症不能为空"},onError:"针对病症应该在50个字符以内。"});
	    $("#composition").formValidator({onShowText:"请输入技术构件。",onShow:"请输入技术构件",onFocus:"描述至少要输入10个汉字或20个字符",onCorrect:"恭喜你,你输对了",defaultValue:"请输入技术构件。"}).inputValidator({min:20,onError:"你输入的技术架构长度不正确,请确认"});
	    $("#preApp").formValidator({onShowText:"请输入前期应用情况。",onShow:"请输入前期应用情况",onFocus:"描述至少要输入10个汉字或20个字符",onCorrect:"恭喜你,你输对了",defaultValue:"请输入前期应用情况。"}).inputValidator({min:20,onError:"你输入的前期应用情况长度不正确,请确认"});
		
	    
		$("#source").formValidator({onShow:"请选择你的技术来源",onFocus:"技术来源必须选择",onCorrect:"谢谢你的配合",defaultValue:""}).inputValidator({min:1,onError: "你是不是忘记选择技术来源了!"}).defaultPassed();
		$("#type").formValidator({onShow:"请选择你的技术来源",onFocus:"技术来源必须选择",onCorrect:"谢谢你的配合",defaultValue:""}).inputValidator({min:1,onError: "你是不是忘记选择技术类别了!"}).defaultPassed();

	
		$.ajax({ 
		    url: "<%=path %>/webSkill!initSkillTypeDict", 
		    success: function(data){
			    var types=data; 
			   $.each(types, function (i,item) {
			       $("#type").append($("<option />").attr("value", item.id).text(item.value));
			   });
			
		}});
		
		
		$.ajax({ 
		    url: "<%=path %>/webSkill!initSourceDict", 
		    success: function(data){
			    var types=data; 
			   $.each(types, function (i,item) {
			       $("#source").append($("<option />").attr("value", item.id).text(item.value));
			   });
		}});
	
		
	});
	

	function sourceOnclick(){
    	var sourceText = $("#source").find("option:selected").text();
    	$("#sourceText").val(sourceText);
	}
	function typeOnclick(){
	    var typeText = $("#type").find("option:selected").text();
	    $("#typeText").val(typeText);;
	}
	
</script>
</head>

<body>
	<div class="container">
	<jsp:include page="header.jsp" flush="true"/> 

        <div class="main">
        	<div class="register">
            	<h3></h3>
                <div class='content'>
               		 <form action="webSkill!registSkill" method="post" name="form1" id="form1" enctype="multipart/form-data">
                    <ul>
                    	
                        <li class="li1">                        
                        		<span class="information">技术名称：</span><span class='input'><input type="text" id="skillname" name="skill.name"></input></span>
                        		<br /><span id="skillnameTip" style="width:280px"></span>
                        </li>
                        <li class="li2">
                        		<span class="information">针对病症：</span><span class='input'><input type="text" id="disease" name="skill.disease"></input></span>
                        		<br /><span id="diseaseTip" style="width:280px"></span>
                        </li>
                        <li class="li3">
                        	<span class="information">技术来源：</span>
                        	<span class='input'><select id="source" name="skill.source" onchange="sourceOnclick()"><option value="">---请选择</option></select></span>
                        	<input type="hidden" name="skill.sourceText" id="sourceText"/>
                        </li>
                        <li class="li4">
                        	<span class="information">技术类别：</span>
                        	<span class='input'><select id="type" name="skill.type" onchange="typeOnclick()"><option value="">---请选择</option></select></span>
                        	<input type="hidden" name="skill.typeText" id="typeText"/>
                        </li>
                       
                     	<li class="li6">
                     			<span class="testAreaSpan">技术构成：</span>
                     			<textarea id="composition" name="skill.composition" rows='10' cols='20'></textarea>
                     			      			
                     	</li>
                     	<li class="ls6Validator">
                     		<div id="compositionTip"></div>	
                     	</li>
                     	<li class="li7">
                     		<span class="testAreaSpan">前期应用情况：</span>
                     		<textarea id="preApp" name="skill.preApp" cols="20" rows="10"></textarea> 
                     	
                     	</li>
                     	<li class="ls7Validator">
                     		<div id="preAppTip"></div>	
                     	</li>
                     	
                     	
                     </ul>                 
<!--                     <span class='button' onclick="return doSave();">保存</span>    -->
					<input type="submit" class='button'/>
					
                    <span class='button2'></span>  
                   		  <div class="shadowleft"></div>
                    
                     <ul>
                    	 <li class="li5">
                        	<span class="information">选择附件：</span>
                        	<span class='input'>                       		  
     								<input type="file" id="dofile" name="file"/>
     							
                        	</span>
                        </li>
                    </ul>
                    </form> 
                     	<div class="shadowright"></div> 

                </div> 
             
            </div>
        </div>
         <jsp:include page="footer.jsp" flush="true"/>

    </div>
</body>
</html>
