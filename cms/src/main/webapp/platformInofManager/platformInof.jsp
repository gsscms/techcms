<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>平台介绍</title>

   <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/redmond/jquery-ui.css">	
 
<script type="text/javascript">
	$(function(){
	    
	    
	    $("#editTable").hide();
	    $("#editA").attr("style","color:red;text-align:center;padding:5px;font-size:14px;")
	    		   .click(function(){
	    		   	$("#viewP").hide();
	    		   	$("#editTable").show();
	    });
	    if($("#fileFileName").val()!=""){
	    	$("#img1").attr("src","<%=path%>/upload/"+$("#fileFileName").val());
	    	$("#img2").attr("src","<%=path%>/upload/"+$("#fileFileName").val());
	    }

	});
	function cencel(){
	    $("#viewP").show();
		 $("#editTable").hide();
	}
</script>

<style type="text/css">
	.p{
		 font-family: '微软雅黑';
    	 font-size: 14px;
         line-height: 30px;
         margin: 0 auto;
         width: 960px;
	}
</style>
</head>
<body>


	<p class="p" id="viewP"><a id="editA" href="#">[编辑平台介绍]</a>
		
		<img align="left" id="img1" src="<%=path%>/upload/platformImage.jpg">
		
		<s:property value="info.content"/>
	</p>
	

			<table id="editTable" >
					<tr>
						<td align="center">
							<img align="left" id="img2" src="<%=path%>/upload/platformImage.jpg">
						</td>
					<tr>
	
					<tr>
						<td  align="center">
							<s:form id="form1" action="file!uploadImage" enctype="multipart/form-data" method="post">

									<s:hidden id="fileFileName" name="fileFileName"></s:hidden>
										<input type="file" name="file" class="text ui-widget-content ui-corner-all"/>&nbsp;&nbsp;
										<input type="submit" value="上传" class ="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"/>
									<font color="red"><s:fielderror/></font>
						</s:form>
						</td>
					</tr>
				<tr>
					
					<td valign="top" align="center">
				
						
						<form action="info!savaPlatForm" method="post">
								<textarea  rows="20" cols="110"  class="text ui-widget-content ui-corner-all"
									 name="info.content" ><s:property value="info.content"/> </textarea>
								<s:hidden name="info.id"></s:hidden>
								<br/>
								<br/>
								<input type="submit" 
									class ="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
									value="保存"/>
								<input type="button" class ="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" value="取消" onclick="return cencel();"/>
		
						</form>
						
						
					</td>
				</tr>
			</table>				
		
</body>
</html>