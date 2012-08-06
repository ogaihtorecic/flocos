
<%@ page import="flocos.MoafMc" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moafMc.label', default: 'MoafMc')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <link href="${createLinkTo(dir:'css',file:'jquery.custom.css')}" rel="stylesheet" type="text/css" />
        <g:javascript src="jquery/jquery.min.js" />
        <g:javascript src="jquery/jquery.custom.min.js" />
        <g:javascript src="jquery/moafmc.js" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
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
                                    <input readonly="readonly" type="text" maxlength="255" id="dadosGeraisMc.title" name="dadosGeraisMc.title" value="${moafMc?.dadosGerais?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosGeraisMc.initialConcept">Initial concept</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosGerais', 'errors')}">
                                    <input readonly="readonly" type="text" maxlength="255" id="dadosGeraisMc.initialConcept" name="dadosGeraisMc.initialConcept" value="${moafMc?.dadosGerais?.initialConcept}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosGeraisMc.description">Description of use</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosGerais', 'errors')}">
                                    <g:textArea readonly="readonly" maxlength="255" name="dadosGeraisMc.description" value="${moafMc?.dadosGerais?.description}" rows="5" cols="40"/>
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
                                        <g:select style="width: 50px" name="dadosGeraisMc.language" from="${moafMc?.dadosGerais?.language}" multiple="yes" optionKey="id" size="10" />
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
                                  <gif test="${moafMc.dadosTecnicos.size > 0}">
                                    <a href="${createLink(controller: 'moafMc', action: 'getArq', id: moafMc.id)}">${moafMc.dadosGerais.fileName}</a>
                                    <p>${moafMc.dadosTecnicos.size} bytes</p>
                                  </gif>                                  
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
                                    <input readonly="readonly" type="text" maxlength="255" value="${formatDate(date: moafMc?.dadosCriacao?.updated, format: 'dd/MM/yyyy')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosCriacaoMc.responsaveis">Author</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosCriacao', 'errors')}">
                                    <g:select style="width: 150px" id="authors" name="dadosCriacaoMc.responsaveis" from="${moafMc?.dadosCriacao?.responsaveis}" value="" multiple="true" size="10" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosCriacaoMc.typeConceptMap">Type of concept map</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosCriacao', 'errors')}">
                                    <input readonly="readonly" type="text" maxlength="255" value="${moafMc?.dadosCriacao?.typeConceptMap}" />
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
                                    <g:textArea readonly="readonly" maxlength="255" name="dadosTecnicosMc.location" value="${moafMc?.dadosTecnicos?.location}" rows="5" cols="40"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosTecnicosMc.software">Software</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosTecnicos', 'errors')}">
                                    <g:textArea readonly="readonly" maxlength="255" name="dadosTecnicosMc.software" value="${moafMc?.dadosTecnicos?.software}" rows="5" cols="40"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosTecnicosMc.mediaResource">Media Resource</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosTecnicos', 'errors')}">
                                    <g:textArea readonly="readonly" maxlength="255" name="dadosTecnicosMc.mediaResource" value="${moafMc?.dadosTecnicos?.mediaResource}" rows="5" cols="40"/>
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
                                        <g:select style="width: 150px" name="dadosEducacionaisMc.purpose" from="${moafMc?.dadosEducacionais?.purpose}" multiple="yes" optionKey="id" size="10" />
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
                                        <g:select style="width: 150px" name="dadosEducacionaisMc.proposedDomain" from="${moafMc?.dadosEducacionais?.proposedDomain}" multiple="yes" optionKey="id" size="10" />
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
                                        <g:select style="width: 150px" name="dadosEducacionaisMc.levelOfEducation" from="${moafMc?.dadosEducacionais?.levelOfEducation}" multiple="yes" optionKey="id" size="10" />
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
                                    <input readonly="readonly" type="text" maxlength="255" id="dadosEducacionaisMc.age" name="dadosEducacionaisMc.age" value="${moafMc?.dadosEducacionais?.age}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosEducacionaisMc.semanticAnnotation">Semantic annotation</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosEducacionais', 'errors')}">
                                  <g:each in="${moafMc?.dadosEducacionais?.semanticAnnotation}" var="sa">
                                    <p>${sa.localAnotacao}</p>
                                  </g:each>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosEducacionaisMc.complement">Complement</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosEducacionais', 'errors')}">
                                    <g:textArea readonly="readonly" maxlength="255" name="dadosEducacionaisMc.complement" value="${moafMc?.dadosEducacionais?.complement}" rows="5" cols="40"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dadosEducacionaisMc.structureConceptualMap">Structure of the conceptual map</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moafMc, field: 'dadosEducacionais', 'errors')}">
                                    <input readonly="readonly" type="text" maxlength="255" value="${moafMc?.dadosEducacionais?.structureConceptualMap}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                  </div>
              </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${moafMc?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
