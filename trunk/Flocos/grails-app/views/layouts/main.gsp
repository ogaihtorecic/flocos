<html>
    <head>
        <title><g:layoutTitle default="FLOCOS" /> </title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <nav:resources/>
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>
      <div id="grailsLogo" class="logo"><a href="http://sionise.com"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="FLOCOS & MOAF" border="0" height="166" width="487" /></a></div>
        <div id="menu">
			<nav:render/>
    	</div>
        <g:layoutBody />
    </body>
</html>