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
	<title></title>
   <link type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.21/themes/redmond/jquery-ui.css" rel="stylesheet" />
	<script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.core.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.widget.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.button.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.position.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.menu.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.autocomplete.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.tooltip.js"></script>
	
	
    <script type="text/javascript" src="<%=path %>/js/jquery.form.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.validate_cn.min.js"></script>
	<style>
	.Inputtext{
		height: 1.7em;
		top: 0.1em;
		width:15em;
	}
	.addressText{
		width:25em;
	}
	</style>
	<script>
	

	$(function() {
	    $("#editDiv").hide();
	    $( "#saveBtn" ).button();
	    
	 
	    $("#editA").attr("style","color:red;text-align:center;padding:5px;font-size:14px;")
		   .click(function(){
		       $("#viewDiv").hide();
  			 $("#editDiv").show();
		   });
	    $( "#cancelBtn" ).button()
	    	.click(function(){
		    	 $("#viewDiv").show();
				 $("#editDiv").hide();
	    	});
	    
		$.ajax({ 
			url: "<%=path %>/contactAction!initContact",
			success:function(data){
			    if(data!=null){
					//alert(data.tel+"--"+data.email);
					$("#telInput").val(data.tel);$("#telSpan").append(data.tel);
					$("#emailInput").val(data.email);$("#emailSpan").append(data.email);
					$("#addressInput").val(data.address);$("#addressSpan").append(data.address);
					$("idInput").val(data.id);
				
			    }
			     	
			}
		});	


	});
	
	function forSave(){
	    
	    document.forms[0].action="<%=path%>/contactAction!saveContact";
		document.forms[0].submit();
	    
	    
	}
	
	</script>
</head>
<body>


<div id="viewDiv">
	
	<table>	
		<tr>
			<td><label>联系电话：</label></td>
			<td><span id="telSpan"></span></td>
		</tr>
		<tr>
			<td><label>联系邮箱：</label></td>
			<td><span id="emailSpan"></span></td>
		</tr>
		<tr>
			<td><label>联系地址：</label></td>
			<td><span id="addressSpan"></span></td>
		</tr>
	</table>	
	<a id="editA" href="#">[编辑联系信息]</a>
</div>


<form action=""  method="post" onsubmit="return false;">

<div class="ui-widget" id="editDiv">
	<table>
		<tr>
			<td><label>请输入联系电话：</label></td>
			<td>
				<input id="telInput"  class="text ui-widget-content ui-corner-all Inputtext"  name="contact.tel" />
			</td>
		</tr>
		<tr>
			<td>请输入联系邮箱：</td>
			<td><input id="emailInput"   class="text ui-widget-content ui-corner-all Inputtext"  name="contact.email" /></td>
		</tr>
		<tr>
			<td>请输入联系地址：</td>
			<td><input id="addressInput"  class="text ui-widget-content ui-corner-all Inputtext addressText"   name="contact.address"/></td>
		</tr>
		<tr>
		<td colspan="2"><p style="overflow: hidden">

			<button onclick="return forSave();" id="saveBtn">保存</button>
			<button id="cancelBtn">取消</button>
	</p></td>
	</table>
	<s:hidden name="contact.id" id="idInput"></s:hidden>
</div>



	
</form>
</body>
</html>
