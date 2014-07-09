$(function() {
        $.ajaxSetup({cache:false});
    
	$("#sl-accordion").accordion();
        $(".sl-selectable").selectable({
            selected:function(){
                        $(".ui-selected", this).each(function(){
                            link=$(this).attr('link');
                            renewTab(link);
                        });
            }//刷新tabs
        });
        $("#sl-tabs").tabs({
            load:function(event,ui){
                isError=0;
                try{
                    panelId =   '#'+ui.panel.id;
                }catch(err){
                   isError=1;
                }
                if(!isError){
                    formSize=   $(panelId+' form').size();
                    if(formSize>0){
                        bindForm(panelId);
                        //$(panelId).load(function(){bindForm(panelId)});
                    }
                }
            }
        });
        renewTab('display-module');
});

//刷新tabs
function renewTab(link){
    $("#sl-tabs ul li").each(function(){
       $("#sl-tabs").tabs('remove',0);
    });
    $.getJSON('menu.json', function(json){   
    	
        max=json[link].length;       
        for(var i=0;i<max;i++){
            url     =   json[link][i]['url'];
            tabName =   json[link][i]['tabName'];
            $("#sl-tabs").tabs('add',url,tabName);
        }
    });
}

function bindForm(targetId){
    var options={
        target:targetId,
        success:function(){
            bindForm(targetId);
        }
    };
    formObj=$(targetId+' form');
    formSize=$(targetId+' form').size();
    for(var i=0;i<formSize;i++){
        formId='#'+formObj[i].id;
        $(formId).validate({
            submitHandler: function(form){
                $(form).ajaxSubmit(options);
            }
        });
    }   
}