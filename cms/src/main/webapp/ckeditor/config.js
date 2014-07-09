/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
       
        var appPath = window.location.pathname;
	appPath = appPath.substring(0,appPath.indexOf("/",1));
	appPath ="";
	config.baseHref = appPath;	

	config.toolbarCanCollapse = true;
	config.filebrowserBrowseUrl = appPath+"/ckfinder/ckfinder.html";
	config.filebrowserImageBrowseUrl = appPath+"/ckfinder/ckfinder.html?type=Images";
	config.filebrowserFlashBrowseUrl = appPath+"/ckfinder/ckfinder.html?type=Flash";
	
	config.filebrowserUploadUrl = appPath+"/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files";
	config.filebrowserImageUploadUrl = appPath+"/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images";
	config.filebrowserFlashUploadUrl = appPath+"/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash";
	// alert(config.filebrowserUploadUrl);
	config.toolbar = "Full";
};
