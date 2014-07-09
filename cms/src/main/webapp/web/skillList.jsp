<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>无标题文档</title>
<style>
.addNewTech{height:222px;position:relative;}
.addNewTech .good{width:73px;height:82px;background:url(pic/pic07.png) 0px -126px no-repeat;position:absolute;top:64px;left:68px;}
.addNewTech p{color:#666666;font-size:12px;width:548px;height:100px;line-height:47px;position:absolute;top:57px;left:173px;}
.addNewTech p span{color:red;}
.addNewTech .button{position:absolute;left:750px;width:120px;height:40px;background:url(pic/pic07.png) right 0 no-repeat;top:140px;text-align:center;font-weight:bold;line-height:40px;color:white;font-size:13px;cursor:pointer;}
.addNewTech a:hover{background:url(pic/pic4-hover.png);text-decoration:none;}/*hover******************************/

.addNewTech .line{position:absolute;left:0px;top:22px;_top:0px;width:100%;height:1px;border-bottom:1px solid #e6e6e6} 
.addNewTech .dashline{position:absolute;left:0px;top:190px;_top:170px;width:100%;height:1px;border-bottom:1px dashed #e6e6e6} 

.page .topBar{height:27px;background:url(pic/pic09.png) repeat-x;}
.page h3{height:39px;background:#009966;line-height:38px;color:white;font-size:14px;text-indent:26px;}

.page .footBar{height:39px;background:url(pic/pic10.png) repeat-x;}
.page table td{height:54px;}
.page table td{text-align:center;}
.page table th{text-align:center;_text-align:inherit;}/*th******************** */
.page table .gray{background:#f9f9f9;}
.page .page{height:58px;position:relative;}
.page .page ul{position:absolute;top:13px;left:587px;}

.page .page li{float:left;line-height:28px;text-align:center;font-size:14px;font-weight:bold;}
.page .page li a{color:#6e6e6e;text-decoration:none;}
.page .page li .active{color:white;background:#1080c0;}
.page .page .pre,.page .page .next{width:65px;height:28px;border:1px solid #cccccc;display:block;font-size:12px;}
.page .page .pre{margin-right:10px;background:url(pic/pic07.png) -787px -48px no-repeat}
.page .page .next{margin-left:10px;background:url(pic/pic07.png) right -70px no-repeat}
.page .page .end{color:#cccccc}

.page .page .pageNum{width:26px;height:28px;border:1px solid #cccccc;display:block;border-right:0px;}
.page .page .noborder{border:none;font-weight:bold;}
.page .page .rightborder{border-right:1px solid #cccccc}
</style>
<script type="">
	$(document).ready(function(){

		$.ajax({ 
		    url: "<%=path %>/webSkill!initTechList", 
		    success: function(data){
			    var types=data; 
			   $.each(types, function (i,item) {
				   var trText = "<tr>"
						+"<td>"+item.name+"</td>"
						+"<td>"+item.typeText+"</td>"
						+"<td>"+item.disease+"</td>"
						+"<td>"+item.createTime+"</td>"
						+"<td>"+item.status+"</td>"
						+"<td>"+item.sourceText+"</td>"
						+"<td>"+item.advice+"</td>"
						+"</tr>";
			       $("#skillTable").append(trText);
			   });
		}});		

	});
</script>
</head>

<body>
	<div class='container'>
         <jsp:include page="header.jsp" flush="true"/> 
        <div class="addNewTech">
        	<span class="line"></span>
        	<span class="good"></span>
        	<p><span>*</span> 您关于“XXXX”中医独特技术登记成功，我们后续将针对您的技术进行论证，论证通过后发布。<br/>
您可以点击添加新技术按钮继续发布新技术，感谢您的参与。</p>
            <a href="<%=path %>/web/skillRegister.jsp" class="button">添加新技术</a>
            <span class="dashline"></span>
        </div>    
        <div class="page">
        	<div class="topBar"></div>
            <h3>已登记技术列表</h3>
            <table  border="1" width="1000" id="skillTable">
            	<tr class="gray">
                	<th width='114' height='58'>技术名称</th>
                	<th width='114' height='58'>技术类别</th>
                    <th width='114' height='58'>针对病症</th>
                    <th width='114' height='58'>登记时间</th>
                    <th width='114' height='58'>当前状态</th>
                    <th width='114' height='58'>技术来源</th>
                    <th width='114' height='58'>审核意见</th>
                </tr>
             
                <tr>
                	<td>技术名称</td>
                    <td>技术名称</td>
                    <td>技术名称</td>
                    <td>技术名称</td>
                    <td>技术名称</td>
                    <td>技术名称</td>
                    <td>技术名称</td>
                </tr>
<!--                 <tr class="gray"> -->
<!--                 	<td>技术名称</td> -->
<!--                     <td>技术名称</td> -->
<!--                     <td>技术名称</td> -->
<!--                     <td>技术名称</td> -->
<!--                     <td>技术名称</td> -->
<!--                     <td>技术名称</td> -->
<!--                     <td>技术名称</td> -->
<!--                 </tr> -->
          
          
               
            </table>
            <div class="page">
            	<ul>
                	<li><a class="pre end" href="javascript:;">上一页</a></li>
                    <li><a class="pageNum active" href="javascript:;">1</a></li>
                    <li><a class="pageNum" href="javascript:;">2</a></li>
                    <li><a class="pageNum" href="javascript:;">3</a></li>
                    <li><a class="pageNum" href="javascript:;">4</a></li>
                    <li><a class="pageNum" href="javascript:;">5</a></li>
                    <li><a class="pageNum" href="javascript:;">6</a></li>
                    <li><a class="pageNum" href="javascript:;">7</a></li>
                    <li><a class="pageNum rightborder" href="javascript:;">8</a></li>
                    <li><a class="pageNum noborder" href="javascript:;">...</a></li>
                    <li><a class="next" href="javascript:;">下一页</a></li>
                </ul>
            </div>
            <div class="footBar"></div>
            
        </div>    
            
        <jsp:include page="footer.jsp" flush="true"/>
    </div>
</body>
</html>

