<!DOCTYPE html>
<html>
<head>
  <title><g:layoutTitle default="Grails" /></title>

  <link rel="stylesheet" href="${resource(dir: 'css/blueprint', file: 'screen.css')}" type="text/css" media="screen, projection" />
  <link rel="stylesheet" href="${resource(dir: 'css/blueprint', file: 'print.css')}" type="text/css" media="print" />
  <!--[if IE]>
  <link rel="stylesheet" href="${resource(dir: 'css/blueprint', file: 'ie.css')}" type="text/css" media="screen, projection" />
  <![endif]-->

  <link rel="stylesheet" href="${resource(dir:'css',file:'magicclock.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:javascript library="jquery" plugin="jquery"/>
  <g:javascript library="application" />
  <g:layoutHead />
</head>
<body>
<div class="container">
  <div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
  </div>
  <div id="grailsLogo"><g:link controller="magicClockUser"><img src="${resource(dir:'images',file:'MagicClock_logo.png')}" alt="Grails" border="0" /></g:link> </div>
  <div class="span-24 last">
    <div>
     <h1>Navigation</h1>
        <g:link controller="magicClockUser">View MagicClockUsers</g:link>&nbsp;&nbsp;###&nbsp;
         <g:link controller="location">View Locations</g:link>&nbsp;&nbsp;###&nbsp;
      <g:link controller="geographicCoordinate">View GeographicCoordinates</g:link> 
    </div>
    <g:layoutBody />
    <div class="span-24 last"style="text-align:center;">Made with &hearts; in Munich (2012) - Fabius - Frederik - Felix - Claudius<br/>visit <g:link url="http://www.magicclock.de/">http://www.magicclock.de/</g:link></div>
  </div>
</div>
</body>
</html>