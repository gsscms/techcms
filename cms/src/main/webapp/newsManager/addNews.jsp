<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<style>
	.custom-combobox {
		position: relative;
		display: inline-block;
	}
	.custom-combobox-toggle {
		position: absolute;
		top: 0;
		bottom: 0;
		margin-left: -1px;
		padding: 0;
		/* support: IE7 */
		*height: 1.7em;
		*top: 0.1em;
	}
	.custom-combobox-input {
		margin: 0;
		padding: 0.3em;
	}
	</style>
	<script>
	(function( $ ) {
	  
		$.widget( "custom.combobox", {
			_create: function() {
			  
				this.wrapper = $( "<span>" )
					.addClass( "custom-combobox" )
					.insertAfter( this.element );

				this.element.hide();
				this._createAutocomplete();
				this._createShowAllButton();
			},

			_createAutocomplete: function() {
				var selected = this.element.children( ":selected" ),
					value = selected.val() ? selected.text() : "";

				this.input = $( "<input>" )
					.appendTo( this.wrapper )
					.val( value )
					.attr( "title", "" )
					.addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
					.autocomplete({
						delay: 0,
						minLength: 0,
						source: $.proxy( this, "_source" )
					})
					.tooltip({
						tooltipClass: "ui-state-highlight"
					});

				this._on( this.input, {
					autocompleteselect: function( event, ui ) {
						ui.item.option.selected = true;
						this._trigger( "select", event, {
							item: ui.item.option
						});
					},

					autocompletechange: "_removeIfInvalid"
				});
			},

			_createShowAllButton: function() {
				var input = this.input,
					wasOpen = false;

				$( "<a>" )
					.attr( "tabIndex", -1 )
					.attr( "title", "Show All Items" )
					.tooltip()
					.appendTo( this.wrapper )
					.button({
						icons: {
							primary: "ui-icon-triangle-1-s"
						},
						text: false
					})
					.removeClass( "ui-corner-all" )
					.addClass( "custom-combobox-toggle ui-corner-right" )
					.mousedown(function() {
						wasOpen = input.autocomplete( "widget" ).is( ":visible" );
					})
					.click(function() {
						input.focus();

						// Close if already visible
						if ( wasOpen ) {
							return;
						}

						// Pass empty string as value to search for, displaying all results
						input.autocomplete( "search", "" );
					});
			},

			_source: function( request, response ) {
			 
				var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
				response( this.element.children( "option" ).map(function() {
					var text = $( this ).text();
					if ( this.value && ( !request.term || matcher.test(text) ) )
						return {
							label: text,
							value: text,
							option: this
						};
				}) );
			},

			_removeIfInvalid: function( event, ui ) {

				// Selected an item, nothing to do
				if ( ui.item ) {
					return;
				}

				// Search for a match (case-insensitive)
				var value = this.input.val(),
					valueLowerCase = value.toLowerCase(),
					valid = false;
				this.element.children( "option" ).each(function() {
					if ( $( this ).text().toLowerCase() === valueLowerCase ) {
						this.selected = valid = true;
						return false;
					}
				});

				// Found a match, nothing to do
				if ( valid ) {
					return;
				}

				// Remove invalid value
				this.input
					.val( "" )
					.attr( "title", value + " didn't match any item" )
					.tooltip( "open" );
				this.element.val( "" );
				this._delay(function() {
					this.input.tooltip( "close" ).attr( "title", "" );
				}, 2500 );
				this.input.data( "ui-autocomplete" ).term = "";
			},

			_destroy: function() {
				this.wrapper.remove();
				this.element.show();
			}
		});
	})( jQuery );

	$(function() {
	    
		$( '#editor1' ).ckeditor({
		     uiColor: '#9AB8F3',
		     height: 300 ,toolbar:'Default'
		 } ); 
		$( "#combobox" ).combobox();
		
		$.ajax({ 
		    url: "<%=path %>/info!allInfoType", 
		    success: function(data){
			    var types=data;  
			   var $select = $("#combobox").parent().html("<select id=\"select\" />").find("#select");
			   $.each(types, function (i,item) {
			     $select.append($("<option />").attr("value", item.code).text(item.name));
			   });
			   $select.combobox();
		}});

	});
	
	function forPublic(){
	    document.forms[0].action="<%=path%>/info!publicInfo";
		document.forms[0].submit();
	}
	
	</script>
</head>
<body>





<form action="">
<div class="ui-widget">
	<table>
		<tr>
			<td><label>选择消息类型: </label></td>
			<td>
				<select id="combobox" name="info.typeCode"><option value="">请选择...</option></select>
			</td>
		</tr>
		<tr>
			<td><label>请输入消息标题：</label></td>
			<td>
				<input name="info.title"/>
			</td>
		</tr>
	</table>
	
	
</div>
<textarea cols="80" id="editor1" name="info.content" rows="10">

</textarea>
	<p style="overflow: hidden">
<!-- 				<input style="float: left" type="submit" value="保存">			 -->
			<button onclick="return forPublic();">发布新消息</button>
	</p>
</form>
</body>
</html>
