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
	<title>交流</title>
<%-- 	<link rel="stylesheet" href="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery.ui.all.css"> --%>
   <link type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.21/themes/redmond/jquery-ui.css" rel="stylesheet" />
   <link type="text/css" href="<%=path %>/css/myCombox.css"> 
   <script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
	

  <script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.core.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.widget.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.button.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.position.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.menu.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.autocomplete.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.tooltip.js"></script>
	
	<script type="text/javascript" src="<%=path %>/js/mySelect.js"></script>
	 <script src="<%=path %>/ckeditor/ckeditor.js"></script>
    <script src="<%=path %>/ckfinder/ckfinder.js"></script>
    <script src="<%=path %>/ckeditor/adapters/jquery.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.form.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.validate_cn.min.js"></script>
    <link type="text/css" href="<%=path %>/css/myCombox.css"  rel="stylesheet"/> 

	<script>
	

	$(function() {
	    
	    $( "#savebtn" )
	    .button();
	   
		$( '#editor1' ).ckeditor({
		     uiColor: '#9AB8F3',
		     height: 300 ,toolbar:'Default'
		 	} );
		$( "#combobox" ).combobox();
		
		$.ajax({ 
		    url: "<%=path %>/publicInfoGridAction!publicDict", 
		    success: function(data){
			    var types=data; 

			   		var $select = $("#combobox").parent().html("<select id=\"select\" />").find("#select");
			   		$select.append($("<option />").attr("value", "").text("---请选择"));
			   		$.each(types, function (i,item) {
			     		var option = $("<option />").attr("value", item.id).text(item.value);
			    		 $select.append(option);
			   		});

			
			 $select.find("option[value='<s:property value="info.dictCode" />']").attr("selected",true);
			 $select.combobox();
			
		}});
		 $( "#back" ).button(); 
	});
	
	function forSave(){
	    if($("#select").find("option:selected").val()==""){
			alert("公告培训没有选择");
			return;
	    }
	    else if($("#titleInput").val()==null||$("#titleInput").val()==""){
			alert("标题不能为空");
			return;
	    }
	    else if($("#editor1").val()==null||$("#editor1").val()==""){
			alert("内容不能为空");
			return;
	    }
	    else{
			//alert("");
		    var dictText = $("#select").find("option:selected").text();
		    $("#dictId").val($("#select").find("option:selected").val());
	    	$("#dictName").val(dictText);
		    $("#content").val($("#editor1").val());
		    document.forms[0].action="<%=path%>/publicInfoGridAction!savePublic";
			document.forms[0].submit();
	    }
	
	}
	
	</script>
</head>
<body>



<form action="" method="post" onsubmit="return false;">
<s:hidden name="info.dictCode" id="dictId"></s:hidden>
	<s:hidden name="info.id"  ></s:hidden>
	<s:hidden  name="info.typeCode"></s:hidden>
	<s:hidden  name="info.flag"></s:hidden>
	<s:hidden  name="info.typeName"></s:hidden>
	<s:hidden  name="info.createTime"></s:hidden>
	<s:hidden  name="info.dictName" id="dictName"></s:hidden>
	<s:hidden name="info.content" id="content"></s:hidden>
<div class="ui-widget">

<table width="100%">
	<tr>
		<td>
		
		<table>
				<tr>
					<td><label>选择报告类型信息类型: </label></td>
					<td>
						<select id="combobox"></select>
					</td>
				</tr>
				<tr>
					<td><label>请输入消息标题：</label></td>
					<td width="400px">
						<input id="titleInput" name="info.title" class="text ui-widget-content ui-corner-all title" value='<s:property value="info.title" />' />
					</td>
				</tr>
		</table>
		
		</td>
	</tr>
	<tr>
		<td>
			<textarea cols="80" id="editor1" name="info.content" rows="10"><s:property value="info.content" /></textarea>
		</td>
	</tr>
</table>

	
</div>


	<p style="overflow: hidden">

			<button id="savebtn" onclick="return forSave();">保存</button>
			<button id="back" onclick="javascript :history.back(-1);">返回</button>
	</p>
</form>
</body>
</html>
