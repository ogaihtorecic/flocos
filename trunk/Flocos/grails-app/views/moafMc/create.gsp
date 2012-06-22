

<%@ page import="flocos.MoafMc" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moafMc.label', default: 'MoafMc')}" />
        <link href="${createLinkTo(dir:'css',file:'jquery.custom.css')}" rel="stylesheet" type="text/css" />
        <g:javascript src="jquery/jquery.min.js" />
        <g:javascript src="jquery/jquery.custom.min.js" />
        <g:javascript src="jquery/moafmc.js" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <g:javascript>
          jQuery(document).ready(function(){
            jQuery("#addAuthor").click(function() 
            {
                event.preventDefault();
                carregando("responsavel", "${resource(resource(dir:'images', file: 'ajax-loader.gif'))}")
                load("responsavel", "${createLink(controller:'responsavelMc', action:'list')}", "")
                jQuery("#responsavel").dialog("open");
            });
            
            jQuery("#updateDomain").click(function() 
            {
                event.preventDefault();
                jQuery("#proposedDomain option").remove();
                jQuery("#proposedDomainAvailable option").remove();
                getDomains("${createLink(controller: 'moafMc', action: 'loadDomain')}");
            });
          });
        </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <g:hasErrors bean="${moafMc.dadosGerais}">
            <div class="errors">
                <g:renderErrors bean="${moafMc.dadosGerais}" as="list" />
            </div>
            </g:hasErrors>
            
            <g:hasErrors bean="${moafMc.dadosCriacao}">
            <div class="errors">
                <g:renderErrors bean="${moafMc.dadosCriacao}" as="list" />
            </div>
            </g:hasErrors>
            
            <g:hasErrors bean="${moafMc.dadosTecnicos}">
            <div class="errors">
                <g:renderErrors bean="${moafMc.dadosTecnicos}" as="list" />
            </div>
            </g:hasErrors>
            
            <g:hasErrors bean="${moafMc.dadosEducacionais}">
            <div class="errors">
                <g:renderErrors bean="${moafMc.dadosEducacionais}" as="list" />
            </div>
            </g:hasErrors>
            
            <g:form id="moafMcForm" action="save" method="post" enctype="multipart/form-data">
              <div id="tabs">
                  <ul>
                          <li><a href="#tabs-1">Dados gerais</a></li>
                          <li><a href="#tabs-2">Dados de criação e distribuição</a></li>
                          <li><a href="#tabs-3">Dados técnicos</a></li>
                          <li><a href="#tabs-4">Dados educacionais</a></li>
                  </ul>
                
                  <div id="tabs-1">
                      <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosGeraisMc.title">Title</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosGerais', 'errors')}">
                                    <input type="text" maxlength="255" id="dadosGeraisMc.title" name="dadosGeraisMc.title" value="${moafMc?.dadosGerais?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosGeraisMc.initialConcept">Initial concept</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosGerais', 'errors')}">
                                    <input type="text" maxlength="255" id="dadosGeraisMc.initialConcept" name="dadosGeraisMc.initialConcept" value="${moafMc?.dadosGerais?.initialConcept}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosGeraisMc.description">Description of use</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosGerais', 'errors')}">
                                    <g:textArea maxlength="255" name="dadosGeraisMc.description" value="${moafMc?.dadosGerais?.description}" rows="5" cols="40"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosGeraisMc.language">Languages</label>
                                    <p style="color: gray; font-size: 80%;">Click on the lists to add or remove</p>
                                </td>
                                <td valign="top" class="name">  
                                  <table style="border: 0px">
                                    <tr>
                                      <td>
                                        <label>languages ​​chosen</label>
                                        <br />
                                        <g:select style="width: 50px" id="language" name="dadosGeraisMc.language" from="${moafMc?.dadosGerais?.language}" multiple="yes" optionKey="id" size="10" />
                                      </td>
                                      <td>
                                        <label>languages ​to ​choose</label>
                                        <br />
                                        <g:select style="width: 50px" id="languageISO" name="languageISO" optionKey="id" optionValue="idioma" from="${flocos.Idioma.list()}" size="10" />
                                      </td>
                                    </tr>
                                  </table>
                                </td>    
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="arquivo">File:</label>
                                </td>
                                <td valign="top" class="name">                                  
                                    <input id="arquivo" name="arquivo" type="file" value="" />
                                </td>                                
                            </tr>
                        </tbody>
                    </table>
                  </div>
                  <div id="tabs-2">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosCriacaoMc.updated">Date created or date updated</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosCriacao', 'errors')}">
                                    <g:datePicker name="dadosCriacaoMc.updated" precision="day" value="${moafMc?.dadosCriacao?.updated}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosCriacaoMc.responsaveis">Author</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosCriacao', 'errors')}">
                                    <g:select style="width: 150px" id="authors" name="dadosCriacaoMc.responsaveis" from="${moafMc?.dadosCriacao?.responsaveis}" value="" multiple="true" size="5" />
                                    <a id="addAuthor" href="#">[+]</a>
                                    <a id="rmAuthor" href="#">[-]</a>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosCriacaoMc.typeConceptMap">Type of concept map</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosCriacao', 'errors')}">
                                    <g:select name="dadosCriacaoMc.typeConceptMap" from="${moafMc?.dadosCriacao?.constraints?.typeConceptMap?.inList}" value="${moafMc?.dadosCriacao?.typeConceptMap}" valueMessagePrefix="dadosCriacao.typeConceptMap"  />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                  </div>
                  <div id="tabs-3">
                    <table>
                        <tbody>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosTecnicosMc.location">Location</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosTecnicos', 'errors')}">
                                    <g:textArea maxlength="255" name="dadosTecnicosMc.location" value="${moafMc?.dadosTecnicos?.location}" rows="5" cols="40"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosTecnicosMc.software">Software</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosTecnicos', 'errors')}">
                                    <g:textArea maxlength="255" name="dadosTecnicosMc.software" value="${moafMc?.dadosTecnicos?.software}" rows="5" cols="40"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosTecnicosMc.mediaResource">Media Resource</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosTecnicos', 'errors')}">
                                    <g:textArea maxlength="255" name="dadosTecnicosMc.mediaResource" value="${moafMc?.dadosTecnicos?.mediaResource}" rows="5" cols="40"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                  </div>
                  <div id="tabs-4">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosEducacionaisMc.purpose">Purpose</label>
                                    <p style="color: gray; font-size: 80%;">Click on the lists to add or remove</p>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosEducacionais', 'errors')}">                                    
                                    <table style="border: 0px">
                                    <tr>
                                      <td>
                                        <label>purpose ​​chosen</label>
                                        <br />
                                        <g:select style="width: 150px" id="purpose" name="dadosEducacionaisMc.purpose" from="${moafMc?.dadosEducacionais?.purpose}" multiple="yes" optionKey="id" size="10" />
                                      </td>
                                      <td>
                                        <label>purpose ​to ​choose</label>
                                        <br />
                                        <g:select style="width: 150px" id="purposeAvailable" name="purposeAvailable" optionKey="id" optionValue="area" from="${flocos.Area.list()}" size="10" />
                                      </td>
                                    </tr>
                                  </table>
                                    
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosEducacionaisMc.proposedDomain">Proposed domain</label>
                                    <p style="color: gray; font-size: 80%;">Click on the lists to add or remove</p>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosEducacionais', 'errors')}">                                    
                                    
                                    <table style="border: 0px">
                                    <tr>
                                      <td>
                                        <label>domain ​​chosen</label>
                                        <br />
                                        <g:select style="width: 150px" id="proposedDomain" name="dadosEducacionaisMc.proposedDomain" from="${moafMc?.dadosEducacionais?.proposedDomain}" multiple="yes" optionKey="id" size="10" />
                                      </td>
                                      <td>
                                        <label>domain ​to ​choose</label>
                                        <br />
                                        <g:select style="width: 150px" id="proposedDomainAvailable" name="proposedDomainAvailable" optionKey="id" optionValue="titulo" from="${flocos.DadosDominios.list()}" size="10" />
                                        <a id="updateDomain" href="#">[Atualizar]</a>
                                        <a href="${createLink(controller: 'dadosDominios', action: 'createWithoutMoaf')}" target="_blank">[+]</a>                                        
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosEducacionaisMc.levelOfEducation">Level of education</label>
                                    <p style="color: gray; font-size: 80%;">Click on the lists to add or remove</p>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosEducacionais', 'errors')}">                                    
                                    
                                    <table style="border: 0px">
                                    <tr>
                                      <td>
                                        <label>level ​​chosen</label>
                                        <br />
                                        <g:select style="width: 150px" id="levelEducation" name="dadosEducacionaisMc.levelOfEducation" from="${moafMc?.dadosEducacionais?.levelOfEducation}" multiple="yes" optionKey="id" size="10" />
                                      </td>
                                      <td>
                                        <label>level ​to ​choose</label>
                                        <br />
                                        <g:select style="width: 150px" id="levelEducationAvailable" name="levelEducationAvailable" optionKey="id" optionValue="nivelEscolaridade" from="${flocos.NivelEscolaridade.list()}" size="10" />
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosEducacionaisMc.age">Age</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosEducacionais', 'errors')}">
                                    <input type="text" maxlength="255" id="dadosEducacionaisMc.age" name="dadosEducacionaisMc.age" value="${moafMc?.dadosEducacionais?.age}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosEducacionaisMc.complement">Complement</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosEducacionais', 'errors')}">
                                    <g:textArea maxlength="255" name="dadosEducacionaisMc.complement" value="${moafMc?.dadosEducacionais?.complement}" rows="5" cols="40"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosEducacionaisMc.structureConceptualMap">Structure of the conceptual map</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosEducacionais', 'errors')}">
                                    <g:select name="dadosEducacionaisMc.structureConceptualMap" from="${moafMc.dadosEducacionais.constraints.structureConceptualMap.inList}" value="${moafMc?.dadosEducacionais?.structureConceptualMap}" valueMessagePrefix="dadosEducacionais.structureConceptualMap"  />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                  </div>
              </div>
              <div class="buttons">
                  <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
              </div>
            </g:form>
        </div>
        <div id="responsavel"></div>
    </body>
</html>
