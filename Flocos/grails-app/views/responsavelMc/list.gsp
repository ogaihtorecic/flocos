<%@ page import="flocos.ResponsavelMc" %>
<html>
    <head>
        <g:set var="entityName" value="${message(code: 'responsavelMc.label', default: 'ResponsavelMc')}" />        
        <g:javascript src="jquery/moafmc.js" />
        <g:javascript>
          jQuery(document).ready(function(){
            jQuery("#createRes").click(function() 
            {
                carregando("responsavel", "${resource(dir:'images', file: 'ajax-loader.gif')}")
                load("responsavel", "${createLink(controller:'responsavelMc', action:'create')}", "")
            });                        
          });
          
          function insere(id, name)
          {
            var achou = false;
            jQuery('#authors option').each(function(index) 
            {
                if (id == $(this).val())
                {
                  achou = true;
                }
            });
            
            if (achou != true)
            {
              jQuery('#resMessage').addClass('message');
              jQuery('#resMessage').append('Adicionado!<br />');
              jQuery('#authors').append('<option value=\"' + id + '\">' + name + '</option>');
            }else
            {
              jQuery('#resMessage').removeClass('message');
              jQuery('#resMessage').html('');
            }            
          }
        </g:javascript>
    </head>
    <body>      
        <div class="nav">
            <span class="menuButton"><a id="createRes" href="#" class="create">New author</a></span>
        </div>
        <div class="body">
            <h1>Author list</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div id="resMessage"></div>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Author</th>
                            <th>email</th>
                            <th>Add</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${responsavelMcInstanceList}" status="i" var="responsavelMcInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><a href="#" onclick="carregando('responsavel', '${resource(dir:'images', file: 'ajax-loader.gif')}'); load('responsavel', '${createLink(controller:'responsavelMc', action:'show')}', {id: ${responsavelMcInstance.id}});">${fieldValue(bean: responsavelMcInstance, field: "id")}</a></td>
                        
                            <td>${fieldValue(bean: responsavelMcInstance, field: "author")}</td>
                        
                            <td>${fieldValue(bean: responsavelMcInstance, field: "email")}</td>
                            
                            <td><a href="#" onclick="insere(${responsavelMcInstance.id}, '${responsavelMcInstance.author}');return false;">[+]</a></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>            
        </div>
    </body>
</html>
