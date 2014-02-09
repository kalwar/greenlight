<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils"%>
<%@ page import="grails.plugins.springsecurity.SecurityConfigType"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    %{--<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">--}%
    %{--<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">--}%
    %{--<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--}%

    <r:require modules="bootstrap"/>
    <r:require modules="customCSS"/>
    <g:javascript library="application"/>
    <g:javascript library="jquery"></g:javascript>
    <g:javascript library="jqueryFormValidator"></g:javascript>
    <g:javascript library="pdfViewer"></g:javascript>
    <g:javascript library="fontawsome"></g:javascript>


    <r:layoutResources />
    <g:layoutHead/>
</head>
%{--<body style="margin: 0 auto">--}%
%{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>--}%
%{--<g:layoutBody/>--}%
%{--<div class="footer" role="contentinfo"></div>--}%
%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
%{--<r:layoutResources />--}%
%{--</body>--}%

<body>

<div role="navigation" class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="${createLink(uri: '/')}" class="navbar-brand">ORB Consent Form</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${createLink(uri: '/')}">Home</a></li>
                <li><g:link  controller="attachment" action="list">Consent Forms</g:link></li>
                <li><g:link  controller="attachment" action="create">Upload Files</g:link></li>

                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <!-- Admin menu -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Administration <b class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li class="dropdown-header">Roles</li>
                            <li><g:link controller="user" action='search'><g:message code="spring.security.ui.search"/></g:link></li>
                            <li><g:link controller="user" action='create'><g:message code="spring.security.ui.create"/></g:link></li>
                            <li class="dropdown-header">Users</li>
                            <li><g:link controller="role" action='search'><g:message code="spring.security.ui.search"/></g:link></li>
                            <li><g:link controller="role" action='create'><g:message code="spring.security.ui.create"/></g:link></li>
                            <li class="divider"></li>
                            <g:if test='${SpringSecurityUtils.securityConfig.securityConfigType == SecurityConfigType.Requestmap}'>
                                <li class="dropdown-header"><g:message code="spring.security.ui.menu.requestmaps"/></li>
                                <li><g:link controller="requestmap" action='search'><g:message code="spring.security.ui.search"/></g:link></li>
                                <li><g:link controller="requestmap" action='create'><g:message code="spring.security.ui.create"/></g:link></li>
                            </g:if>
                            <g:if test='${SpringSecurityUtils.securityConfig.rememberMe.persistent}'>
                                <li class="dropdown-header"><g:message code="spring.security.ui.menu.persistentLogins"/></li>
                                <li><g:link controller="persistentLogin" action='search'><g:message code="spring.security.ui.search"/></g:link></li>
                            </g:if>
                            <li class="dropdown-header"><g:message code="spring.security.ui.menu.registrationCode"/></li>
                            <li><g:link controller="registrationCode" action='search'><g:message code="spring.security.ui.search"/></g:link></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <g:message code="spring.security.ui.menu.appinfo"/> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><g:link action='config' controller='securityInfo'><g:message code='spring.security.ui.menu.appinfo.config'/></g:link></li>
                            <li><g:link action='mappings' controller='securityInfo'><g:message code='spring.security.ui.menu.appinfo.mappings'/></g:link></li>
                            <li><g:link action='currentAuth' controller='securityInfo'><g:message code='spring.security.ui.menu.appinfo.auth'/></g:link></li>
                            <li><g:link action='usercache' controller='securityInfo'><g:message code='spring.security.ui.menu.appinfo.usercache'/></g:link></li>
                            <li><g:link action='filterChain' controller='securityInfo'><g:message code='spring.security.ui.menu.appinfo.filters'/></g:link></li>
                            <li><g:link action='logoutHandler' controller='securityInfo'><g:message code='spring.security.ui.menu.appinfo.logout'/></g:link></li>
                            <li><g:link action='voters' controller='securityInfo'><g:message code='spring.security.ui.menu.appinfo.voters'/></g:link></li>
                            <li><g:link action='providers' controller='securityInfo'><g:message code='spring.security.ui.menu.appinfo.providers'/></g:link></li>
                        </ul>
                    </li>
                </sec:ifAnyGranted>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <sec:ifLoggedIn>
                    <li><g:link data-placement="bottom" class="btn btn-inverse" data-original-title="Logout" rel="tooltip" controller="logout"> Logout </g:link></li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li><g:link data-placement="bottom" class="btn btn-inverse" data-original-title="Login" rel="tooltip" controller="login"> Login </g:link></li>
                </sec:ifNotLoggedIn>
            </ul>

        </div><!--/.nav-collapse -->
    </div>
</div>

<div class="container" style="margin-top: 50px;">
    <g:layoutBody/>
</div>


<script type="text/javascript">
    $(function()
    {
        $('.bootstrapTooltip').tooltip()

        $.validator.addMethod(
                "regex",
                function(value, element, regexp) {
                    var re = new RegExp(regexp);
                    return this.optional(element) || re.test(value);
                },
                "Not a valid format."
        );


    });
</script>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources />
</body>
</html>