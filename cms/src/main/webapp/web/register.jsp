<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中医独特技术研究平台-个人信息注册</title>
<link type='text/css' rel="stylesheet" href="head foot.css"/>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
<script src="<%=path %>/formvalidator/formValidator-4.1.3.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path %>/formvalidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<style>

.container .main .register{position:relative;padding-bottom:180px;background:url(pic/pic08.png) no-repeat bottom;width:997px;border-width:1px 1px 0px 1px;border-style:solid;border-color:#e6e6e6;}
.container .main .register h3{width:645px;height:74px;background:url(pic/pic07.png) -30px -50px no-repeat;margin-top:28px;}
.container .main .register .content{width:660px;height:480px;margin:100px auto;position:relative;}
 
.container .main .register ul li{margin-bottom:20px;color:#666666;font-size:14px;} 
/*.container .main .register ul li .input{margin-left:20px;width:180px;height:28px;border:1px solid #e6e6e6;display:inline-block}
.container .main .register ul li .information{line-height:28px;height:28px;display:inline-block}
*/
.container .main .register ul li span{height:28px;display:inline-block;line-height:28px;vertical-align: bottom;}
.container .main .register ul li .input{margin-left:20px;width:190px;height:28px;border:0px solid #e6e6e6;display:inline-block}
.container .main .register ul li .radio{border:none;margin-top:-25px;}
.container .main .register ul li .radio input{margin-left:11px;width:auto;height:auto;}


.container .main .register ul li input{margin-top:4px;margin-top:6px\9;width:180px;height:20px;outline:none;padding-left:8px;}
.container .main .register .ul2{position:absolute;left:400px;width:400px;top:0;}
.container .main .register .button{left:280px;width:120px;height:40px;background:url(pic/pic07.png) right 0 no-repeat;top:410px;text-align:center;font-weight:bold;line-height:40px;color:white;font-size:13px;}

.container .main .register .shadowleft{position:absolute;left:-2px;top:0;width:1px;height:100%;background:#f6f6f6;}
.container .main .register .shadowright{position:absolute;left:998px;top:0;width:1px;height:100%;background:#f6f6f6;}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({formID:"form1",theme:"126",submitOnce:true,
	    buttons:$("#button"),
		onError:function(msg,obj,errorlist){
			$("#errorlist").empty();
			$.map(errorlist,function(msg){
				$("#errorlist").append("<li>" + msg + "</li>");
			});
			alert(msg);
		},
		onSuccess:function(){
		    document.forms[0].action = "<%=path%>/user!register";
		    document.forms[0].submit();
		},
		ajaxPrompt : '有数据正在异步验证，请稍等...'
	});
	//姓名
	$("#us").formValidator({onShow:"请输入用户名,只有输入\"maodong\"才是对的",onFocus:"用户名至少2个字符,最多10个字符",onCorrect:"该姓名可以注册"})
			.inputValidator({min:5,max:10,onError:"你输入的用户名非法,请确认"});
	
	//身份证
	$("#sfzh").formValidator({ajax:true,onShow:"请输入15或18位的身份证",onFocus:"输入15或18位的身份证",onCorrect:"身份证号码输入正确"})
			  .functionValidator({fun:isCardID})
			  .ajaxValidator({
					dataType : "json",
					async : true,
					url : "<%=path %>/user!validateCardId",
					success : function(data){
					    alert(data);
			            if( data ) 
			        		return true;
						return "该身份证已经注册过。";
					},
					buttons: $("#button"),
					error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
					onError : "该身份证号不可用，请更换身份证号",
					onWait : "正在对身份证进行合法性校验，请稍候..."
				}).defaultPassed();
	//手机号吗
	$("#shouji").formValidator({empty:true,onShow:"请输入你的手机号码，可以为空哦",onFocus:"你要是输入了，必须输入正确",onCorrect:"谢谢你的合作",onEmpty:"你真的不想留手机号码啊？"})
		.inputValidator({min:11,max:11,onError:"手机号码必须是11位的,请确认"})
		.regexValidator({regExp:"mobile",dataType:"enum",onError:"你输入的手机号码格式不正确"})
		.ajaxValidator({
		dataType : "json",
		async : true,
		url : "<%=path %>/user!validatePhone",
		success : function(data){
            if( data ) 
        		return true;
			return "该手机号码已经注册过。";
		},
		buttons: $("#button"),
		error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
		onError : "该手机号码不可用，请更换手机号码",
		onWait : "正在对手机号码进行合法性校验，请稍候..."
	}).defaultPassed();
	$("#password1").formValidator({onShow:"请输入密码",onFocus:"至少1个长度",onCorrect:"密码合法"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两边不能有空符号"},onError:"密码不能为空,请确认"});
	$("#password2").formValidator({onShow:"输再次输入密码",onFocus:"至少1个长度",onCorrect:"密码一致"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},onError:"重复密码不能为空,请确认"}).compareValidator({desID:"password1",operateor:"=",onError:"2次密码不一致,请确认"});
	$(":radio[name='xb_one']").formValidator({tipID:"sexTip",onShow:"请选择你的性别",onFocus:"没有第三种性别了，你选一个吧",onCorrect:"输入正确",defaultValue:["1"]}).inputValidator({min:1,max:1,onError:"性别忘记选了,请确认"});//.defaultPassed();
	
	$("#nl").formValidator({onShow:"请输入的年龄（1-99岁之间）",onFocus:"只能输入1-99之间的数字哦",onCorrect:"恭喜你,你输对了"}).inputValidator({min:1,max:99,type:"value",onErrorMin:"你输入的值必须大于等于1",onError:"年龄必须在1-99之间，请确认"}).defaultPassed();
	
	$("#account").formValidator({onShowText:"请输入用户名",onFocus:"用户名至少5个字符,最多10个字符"}).inputValidator({min:5,max:10,onError:"用户名不能为空"})
	.ajaxValidator({
		dataType : "json",
		async : true,
		url : "<%=path %>/user!validateAccoount",
		success : function(data){
        if( data ) 
    		return true;
			return "该用户名已经注册过。";
		},
		buttons: $("#button"),
		error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
		onError : "该用户名不可用，请更换手机号码",
		onWait : "正在对用户名进行合法性校验，请稍候..."
	}).defaultPassed();

});
	function registeClick(){
	    document.forms[0].submit();
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
                	<form  method="post" name="form1" id="form1">
                    <ul>
                        <li>
                        	<span class="information">姓　　名</span>
                        	<span class='input'>
                        		<input type="text" id="us" name="userInfo.name"/>
                        	</span>
                        	<span id="usTip" style="width:280px"></span>	
                        </li>
                        <li>
                        	<span class="information">身份证号</span>
                        	<span class='input'><input name="userInfo.cardId" type="text" id="sfzh" /></span>
                        	<span id="sfzhTip" style="width:280px"></span>
                        </li>
                        <li>
                        	<span class="information">工作单位</span>
                        	<span class='input'><input name="userInfo.weekUnit" type="text" id="weekUnit" /></span>
                        </li>
                        <li>
                        	<span class="information">手　　机</span>
                        	<span class='input'><input type="text" id="shouji" name="userInfo.phone"/></span>
                        	<span id="shoujiTip" style="width:280px"></span>
                        </li>
                        <li>
                        	<span class="information">帐　　号</span>
                        	<span class='input'><input type="text" id="account" name="userInfo.account"/></span>
                        	<span id="accountTip" style="width:280px"></span>
                        </li>
                        <li>
                        	<span class="information">密　　码</span>
                        	<span class='input'><input type="password" id="password1" name="userInfo.password" /></span>
                        	<span id="password1Tip" style="width:280px"></span>
                        </li>
                        <li>
                        	<span class="information">密码确认</span>
                        	<span class='input'><input type="password" id="password2" name="userInfo.password" /></span>
                        	<span id="password2Tip" style="width:280px"></span>
                        </li>
                        <li>
                        	<span class="information">姓　　别</span>
                        	<span class='input radio'><input type="radio" id="sex" value="1" name="userInfo.gender" />
        							男&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="sex1" value="2" name="userInfo.gender" />
   								     女</span>
   						   <span id="sexTip" style="width:280px"></span>
                        </li>
                        <li>	
                       		<span class="information">年　　龄</span>
                       		<span class='input'><input type="text" id="nl" name="userInfo.age" class="fv_input_text_default" /></span>
                       		<span id="nlTip" style="width:280px"></span>
                       	</li>
                        <li>
                        	<span class="information">单位地址</span>
                       		<span class='input'>
                       			<input name="userInfo.wordAddress" type="text" id="wordAddress" />
                       		</span>
                        </li>
                 		<li> 
<%--                  				<span class='button' id="button" onclick="return registeClick();">注册</span>  --%>
                 		     	<input type="submit" value="注册"  class='button'/>
                 		</li>
                    </ul>                 
						
                 		
                    </form>
                </div> 
                <div class="shadowleft"></div>
                <div class="shadowright"></div> 
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </div>
</body>
</html>
