<%@page import="java.util.List"%>
<%@page import="br.edu.ufam.sw.startup.Component"%>
<%@page import="br.edu.ufam.sw.util.FWUtil"%>
<%@page import="java.io.IOException"%>

<html>
<head>
<title>UFAM - Universidade Federal do Amazonas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!--<LINK href="inc/estilo.css" type=text/css rel=STYLESHEET>-->
</head>
<script type="text/javascript" src="inc/inc.js"></script>
<script type="text/javascript">
var <%=FWUtil.PARAM_ONTOLOGY_FILE%>Old;

function isURL(str){
	return (str.indexOf('http') == 0 ? true : false);
}

function isUserDefinedOntology(useDefaultOntologyField){
	return (useDefaultOntologyField.value == 'User Defined');
}

function validate(){
	var form = document.forms['mainForm'];
	if (form.<%=FWUtil.PARAM_WEB_RESOURCE%>.value == ''){
		alert("Please execute this application informing the Web Resource!");
		return false;
	}else if (!isURL(form.<%=FWUtil.PARAM_WEB_RESOURCE%>.value)){
		alert("The Web Resource field must be an URL (starting with 'http')!");
		return false;
	}
	if (isUserDefinedOntology(form.useDefaultOntology.value)){ // the ontology must be defined
		if (form.<%=FWUtil.PARAM_ONTOLOGY_FILE%>.value == ''){
			alert("Please execute this application informing the Ontology URL (or use the default)!");
			return false;
		}else if (!isURL(form.<%=FWUtil.PARAM_ONTOLOGY_FILE%>.value)){
			alert("The Ontology must be an URL (starting with 'http')!");
			return false;
		}
	}
	form.<%=FWUtil.PARAM_ONTOLOGY_FILE%>.disabled = false;
	form.generate.disabled = true;
	return true;
}

function validateOntologyField(){
	//alert(1);
	var form = document.forms['mainForm'];
	var useDefaultOntology = form.useDefaultOntology;
	var ontologyField = form.<%=FWUtil.PARAM_ONTOLOGY_FILE%>;
	//alert(2);
	if (isUserDefinedOntology(useDefaultOntology)){ // the user can set the ontology
		//alert("isUserDefinedOntology");
		if (<%=FWUtil.PARAM_ONTOLOGY_FILE%>Old != null){
			ontologyField.value = <%=FWUtil.PARAM_ONTOLOGY_FILE%>Old;
		}
		//alert(3 + ontologyField.disabled);
		ontologyField.disabled = false;
		ontologyField.focus();
		//alert();
	} else {	// default ontology (Autos or SUMO)
		<%=FWUtil.PARAM_ONTOLOGY_FILE%>Old = ontologyField.value;
		ontologyField.value = useDefaultOntology.value;
		ontologyField.disabled = true;
	}
}

function displayFullDescription(combo, field){
	var form = document.forms['mainForm'];
	newValue = combo.options[combo.selectedIndex].text;
	//alert(newValue);
	field.value = newValue;
}

<%!
private void writeComboBoxWithComponents(JspWriter out, Object oComponents, String componentName) {
	try{
		// out.println("oComponents"+ oComponents);
		if (oComponents instanceof List){
			List<Component> components = (List<Component>) oComponents; 
			if (components != null){
				Component component;
				for (int i = 0; i < components.size(); i++){
					component = components.get(i);
					//out.println("<option value='"+ component.getName() +"' selected>"+ component.getShortDescription() +"</option>");
					out.println("<option value='"+ component.getName() +"' selected>"+ component.getDescription() +"</option>");
				}
			}
		}
	}catch(IOException exception){}
}
%>
</script>
<body bgcolor='white'>
<form action='Controller' id='mainForm' onsubmit='return validate();' onload="document.forms['mainForm'].<%=FWUtil.PARAM_WEB_RESOURCE%>.focus();">
<script type="text/javascript">createTableHeader(500);</script>

	<tr>
		<td colspan='2'><font size='4'>Web Resource URL:</font></td>
	</tr>
	<tr>
		<td colspan='2'><input type='text' name='<%=FWUtil.PARAM_WEB_RESOURCE%>' id='<%=FWUtil.PARAM_WEB_RESOURCE%>'
			STYLE='width: 500px' value='http://www.nytimes.com/2008/09/07/automobiles/autoreviews/07AUTO.html' /></td>
	</tr>
	<tr>
		<td colspan='2'><font size='4'>Component for data
		extraction:</font></td>
	</tr>
	<tr>
		<td colspan='2'><select STYLE='width: 500px' id='<%=FWUtil.PARAM_CED%>' name='<%=FWUtil.PARAM_CED%>' onchange="javascript:displayFullDescription(form.CED, form.textarea_CED);">
			<%
				writeComboBoxWithComponents(out, application.getAttribute(FWUtil.CED_COMPONENTS_ATTRIBUTE), FWUtil.PARAM_CED);
			%>

<!--
			<option>PDF Extractor: parse the file using PNL to retrieve
			phrase information (P, S, O)</option>-->
		</select></td>
	</tr>
	<tr>
		<td colspan='2'><textarea readonly cols=60 rows=2 id='textarea_<%=FWUtil.PARAM_CED%>'></textarea></td>
	</tr>
	<tr>
		<td colspan='2'><font size='4'>Component for element
		mapping:</font></td>
	</tr>
	<tr>
		<td colspan='2'><select STYLE='width: 500px' id='<%=FWUtil.PARAM_CMS%>' name='<%=FWUtil.PARAM_CMS%>' onchange="javascript:displayFullDescription(form.CMS, form.textarea_CMS);">
			<%
				writeComboBoxWithComponents(out, application.getAttribute(FWUtil.CMS_COMPONENTS_ATTRIBUTE), FWUtil.PARAM_CMS);
			%>
			<!--<option>Default element mapping: an element must have the
				same name of the concept</option>
				<option>Inference mapping: the element relations are used to
				define the concept</option>-->
		</select></td>
	</tr>
	<tr>
		<td colspan='2'><textarea readonly cols=60 rows=2 id='textarea_<%=FWUtil.PARAM_CMS%>'></textarea></td>
	</tr>
	<tr>
		<td colspan='2'><font size='4'>Ontology file URL (on OWL DL):</font></td>
	</tr>
	<tr>
		<td colspan='2'>
			<select STYLE='width: 500px' id='useDefaultOntology' name='useDefaultOntology' onchange="javascript:validateOntologyField();">
				<option value='Autos' selected>Autos</option>
				<option value='SUMO'>SUMO</option>
				<option value='Autos+Sumo'>Autos + Sumo</option>
				<option value='User Defined'>User Defined</option>
			</select>
	</td>
	</tr>
<!--	<tr>
		<td colspan='2'><font size='4'><input type='radio' checked
			id='useDefaultOntology' name='useDefaultOntology' value='default'
			onclick='validateOntologyField();'>Default <input
			type='radio' id='useDefaultOntology' name='useDefaultOntology'
			value='other' onclick='validateOntologyField();'>Other</font></td>
	</tr> -->
	<tr>
		<td colspan='2'><input rowspan=2 type='text' name='<%=FWUtil.PARAM_ONTOLOGY_FILE%>'
			id='<%=FWUtil.PARAM_ONTOLOGY_FILE%>' disabled STYLE='width: 500px' /></td>
	</tr>
	<tr>
		<td colspan=2 align=center><input type='submit' id='generate' name='generate'
			value='Generate semantic annotation' /></td>
	</tr>
	<!--
	<tr>
		<td valign='bottom' colspan=2>General comments
		about all versions: <BR>
		&nbsp;&nbsp;- Version 1.0: The XML file informed must have its
		Schema (XSD) defined into it, via
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xsi:noNamespaceSchemaLocation="schema.xsd" at the first XML tag;<BR>
		&nbsp;&nbsp;- Version 1.1: The components for information extraction must be defined via IDataLoader interface at the component definition XML file (inside 'components' folder);<BR>
		&nbsp;&nbsp;- Version 1.1: The components for element mapping must be defined via ISemanticMatcher interface at the component definition XML file (inside 'components' folder);<BR>
		&nbsp;&nbsp;- Version 1.2: Adding CMS based on the directory service;<BR>
		&nbsp;&nbsp;- Version 1.3: Retrieving CED and CMS descriptions to inform the users what the selected component provides;<BR>
		&nbsp;&nbsp;- Version 1.4: Adding HTML Information Extraction component;<BR>
		&nbsp;&nbsp;- Version 1.5: Renaming Information to Data and CEI to CED (according with formal definitions of the terms);<BR>
		</td>
	</tr>

-->
<script type="text/javascript">
createTableBottom();

// Loading default attributes
displayFullDescription(document.forms['mainForm'].CED, document.forms['mainForm'].textarea_CED);
displayFullDescription(document.forms['mainForm'].CMS, document.forms['mainForm'].textarea_CMS);

document.forms['mainForm'].<%=FWUtil.PARAM_ONTOLOGY_FILE%>.value = document.forms['mainForm'].useDefaultOntology.value;

</script>

</form>
</body>
</html>
