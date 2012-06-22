$(document).ready(function(){
	$(function() 
        {
            $( "#tabs" ).tabs();
	});

        $("#languageISO").click(function() 
        {
            selectAdd("languageISO", "language")            
        });
        
        $("#language").click(function() 
        {
            selectRm("language")
        });
        
        $("#purposeAvailable").click(function() 
        {
            selectAdd("purposeAvailable", "purpose")            
        });
        
        $("#purpose").click(function() 
        {
            selectRm("purpose")
        });
        
        $("#levelEducationAvailable").click(function() 
        {
            selectAdd("levelEducationAvailable", "levelEducation")            
        });
        
        $("#levelEducation").click(function() 
        {
            selectRm("levelEducation")
        });
        
        $("#proposedDomainAvailable").click(function() 
        {
            selectAdd("proposedDomainAvailable", "proposedDomain")            
        });
        
        $("#proposedDomain").click(function() 
        {
            selectRm("proposedDomain")
        });

        $("#responsavel").dialog({
		autoOpen: false,
		bgiframe: true,
		modal: true,
		width:600,
		height:500
	});
        
        $("#rmAuthor").click(function()
        {
            event.preventDefault();
            $("#authors option:selected").remove()
        });
        
        $("form").submit(function() 
        {
            $('#language').append('<option value=""></option>');
            $('#purpose').append('<option value=""></option>');
            $('#proposedDomain').append('<option value=""></option>');
            $('#levelEducation').append('<option value=""></option>');
            $('#authors').append('<option value=""></option>');
            
            $('#language option').prop('selected',true);
            $('#purpose option').prop('selected',true);
            $('#proposedDomain option').prop('selected',true);
            $('#levelEducation option').prop('selected',true);
            $('#authors option').prop('selected',true);
        });
        
});

function getDomains(url)
{
    $.ajax({
        type: 'post',
        url: url,
        data: [],
        beforeSend: function(){},
        success: function(data)
        {
            if(data.length == 0)
            {
                $("#proposedDomainAvailable").html('<option value=""></option>');
                return false;
            }
            
            var option = '';
            $(data).each(function()
            {
                option += '<option value="' + this.id+ '">' + this.titulo + '</option>';
            });
            $("#proposedDomainAvailable").html(option);
        }
    });
}

function carregando(divId, file){
    var elemento = document.getElementById(divId);
    elemento.innerHTML = '<p style="margin-top: 9px;"><img src="' + file + '" /></p>';
    elemento.style.display = 'block';
}

function selectAdd(sel1Id, sel2Id)
{
    var id = $("#" + sel1Id + " option:selected").val()
    var value = $("#" + sel1Id + " option:selected").text()
    
    var achou = false;
    jQuery('#' + sel2Id + ' option').each(function(index) 
    {
        if (id == $(this).val())
        {
          achou = true;
        }
    });
            
    if (achou != true)
    {        
        if (id != "" && value != "")
        {
            $("#" + sel2Id).append("<option value=\"" + id + "\">" + value + "</option>")
        }    
    }
    
}

function selectRm(selId)
{
    $("#" + selId + " option:selected").remove()
}

function load(divId, link, map)
{
    $("#" + divId).load(link, map)
}
