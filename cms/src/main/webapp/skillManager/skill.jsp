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
<title>Insert title here</title>
  <link rel="stylesheet" href="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/themes/redmond/jquery-ui.css">
  <script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
  <script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.js"></script>
   
   <link rel="stylesheet" type="text/css" href="<%=path %>/jqGrid/css/ui.jqgrid.css" />    
   <script src="<%=path %>/jqGrid/js/jquery.jqGrid.min.js"></script>
   <script src="<%=path %>/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script> 
   <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/redmond/jquery-ui.css">	
   <script type="text/javascript">
   $(function() {
       
       $( "#pass" )
       		.button()
       		.click(function(){
       		    document.forms[0].action="<%=path%>/skillAction!doPass";
  				document.forms[0].submit();
       		});
       $( "#noPass" )
		.button()
		.click(function(){
		    document.forms[0].action="<%=path%>/skillAction!doNoPass";
			document.forms[0].submit();
			});
       
       $( "#back" ).button();
       
       $( "#skillDispayBtn" ).button()
       						.click(function(){
       						 	//var id=$("#techId").val();
       					      	document.forms[0].action="<%=path %>/skillAction!doSkillDisplay";
       						  	document.forms[0].submit();
       							}	 
       						 );
       
       $( "#displayBtn" ).button()
		  .click(function(){
		     // var id=$("#techId").val();
		      document.forms[0].action="<%=path %>/skillAction!setDisplay";
			  document.forms[0].submit();
		      
		  });
       
   });
   </script>
   <style type="text/css">
   		.detailTable{
   			height: 460px;
   			width:100%;
   			display: block;
   			padding-bottom: 13.2px;
    		padding-top: 13.2px;
   		}
   		.detailTr{
   			padding-bottom: 13.2px;
    		padding-top: 13.2px;
   		}
   </style>
</head>
<body>
	<div class="ui-widget ui-widget-content ui-corner-all">
		<form onsubmit="return false;" >
		<table class="ui-accordion ui-accordion-content detailTable">
			<tr class="detailTr">
				<td align="right" width="100px"><label>技术名词:</label></td>
				<td><label><s:property value="tech.name"/></label></td>
				<td align="right"  width="100px"><label>技术来源:</label></td>
				<td><label><s:property value="tech.sourceText"/></label></td>
			</tr>
			<tr  class="detailTr">
				<td align="right"  width="100px"><label>针对病症:</label></td>
				<td><label><s:property value="tech.disease"/></label></td>
				<td align="right"  width="100px"><label>技术类型:</label></td>
				<td><label><s:property value="tech.typeText"/></label></td>
			</tr>
			<tr  class="detailTr">
				<td align="right"  width="100px"><label>技术构成:</label></td>
				<td colspan="3"  height="100px"><label><s:property value="tech.composition"/></label></td>
			</tr>
			<tr  class="detailTr">
				<td  width="150px" align="right"> <label >前期应用状况:</label></td>
				<td  colspan="3" height="100px"><label><s:property value="tech.preApp"/></label></td>
			</tr>
			<tr  class="detailTr">
				<td align="right"  width="100px"><label>附件:</label></td>
				<td colspan="3"><label><s:property value="tech.name"/></label></td>
			</tr>
			<tr  class="detailTr">
				<td align="right"  width="100px"><label>审核意见:</label></td>
				<td colspan="3">
					<textarea rows="3" cols="60"  class="text ui-widget-content ui-corner-all" name="tech.advice"><s:property value="tech.advice"/></textarea>
				</td>
			</tr>
		</table>
		<s:hidden name="tech.id" id="techId"></s:hidden>
		<div align="center">
				<s:if test="%{tech.status=='01'}">
					<button id="pass">审核通过</button>
					<button id="noPass">审核不通过</button>
				</s:if>
				<s:if test="%{tech.status=='02'}">
					<button id="displayBtn">设置为首页显示</button>
					<button id="skillDispayBtn">技术展示显示</button>
				</s:if>
				
				<button id="back" onclick="javascript :history.back(-1);">返回</button>
		</div>
		</form>
	</div>
</body>
</html>