<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Autocomplete - Combobox</title>
<%-- 	<link rel="stylesheet" href="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery.ui.all.css"> --%>
   <link type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.21/themes/redmond/jquery-ui.css" rel="stylesheet" />
	<script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.core.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.widget.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.button.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.position.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.menu.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.autocomplete.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.tooltip.js"></script>
	
	
	 <script src="<%=path %>/ckeditor/ckeditor.js"></script>
    <script src="<%=path %>/ckfinder/ckfinder.js"></script>
    <script src="<%=path %>/ckeditor/adapters/jquery.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.form.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.validate_cn.min.js"></script>

	<script type="text/javascript">


	$(function() {
	    $( "#addTopic" )
	    .button();
	    $( "#backBtn" )
	    .button(); 
		$( '#editor1' ).ckeditor({
		     uiColor: '#9AB8F3',
		     height: 300 ,toolbar:'Default'
		 } ); 


	});
	
	function forSaveTopic(){
	    document.forms[0].action="<%=path%>/topicAction!saveTopic";
		document.forms[0].submit();
	}
	function forBack(){
	    window.location.href="<%= path%>/topicManager/topicManage.jsp"; 
	}
	</script>
</head>
<body>





<form action=""  method="post">
<div class="ui-widget">
	<table  width="100%">
		<tr><td>
	<table>

		<tr>
			<td><label>请输入消息标题：</label></td>
			<td>
				<input name="info.title"   class="text ui-widget-content ui-corner-all" value='<s:property value="info.title" />'/>
			</td>
		</tr>
		<tr>

			<td colspan="2"></td>
		</tr>

	</table>
	</td></tr>
	<tr>
		<td><textarea cols="80" id="editor1" name="info.content" rows="10"  
			class="text ui-widget-content ui-corner-all"><s:property value="info.content" /></textarea></td>
	</tr>
			<tr>
		<td colspan="2"><p style="overflow: hidden">

			<button onclick="return forSaveTopic();" id="addTopic">保存</button>
			<button id="backBtn"  onclick="return forBack();">返回列表</button>
	</p></td></tr>
		</table>
	<s:hidden name="info.id"></s:hidden>
</div>



	
</form>
</body>
</html>
