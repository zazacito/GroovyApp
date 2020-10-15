<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="list-saleAd" class="content scaffold-list" role="main">

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="container-fluid">
                <h1 style="font-weight: bold !important; margin-top: 2rem !important; ">Toutes les Annonces</h1>
                <table class="table table-striped table-hover table-bordered">
                    <thead class="thead-dark">
                    <tr >
                        <g:sortableColumn property="title" title="Titre" style="text-align:center !important;"/>
                        <g:sortableColumn property="description" title="Description" />
                        <g:sortableColumn property="longDescription" title="Description Longue" />
                        <g:sortableColumn property="illustrations" title="Illustrations" />
                        <g:sortableColumn property="price" title="Prix" style="text-align:center !important;"/>
                        <g:sortableColumn property="author" title="Auteur" style="text-align:center !important;" />
                    </tr>
                    </thead>
                    <tbody>
                        <g:each var="saleAd" in="${saleAdList}" >
                        <tr>
                            <td style="font-weight: bold !important; text-align:center !important;">
                                <g:link controller="saleAd" action="show" id="${saleAd.id}">
                                    ${saleAd.title}
                                </g:link>
                            </td>
                            <td>${saleAd.description}</td>
                            <td>${saleAd.longDescription}</td>
                            <td style="text-align: center !important;">
                                <g:each var="listIllustrations" in="${saleAd.illustrations}" >
                                    <img src="${grailsApplication.config.tpmbds.illustrations.url}${listIllustrations.filename}" height="150px" alt="Grails"/>
                                </g:each>
                            </td>
                            <td style="text-align:center !important;">${saleAd.price}</td>
                            <td style="text-align:center !important;">
                                <g:link controller="user" action="show" id="${saleAd.author.id}">
                                    ${saleAd.author.username}
                                </g:link>
                            </td>
                        </tr>
                        </g:each>
                    </tbody>
                </table>
                <br>


                <g:link class="btn btn-primary btn-warning btn-lg " controller="saleAd" action="create">Ajouter Une Annonce</g:link>

                <br>
                <br>
                <hr>


            </div>
            <%-- <f:table collection="${saleAdList}" />--%>



<div class="pagination">
   <g:paginate total="${saleAdCount ?: 0}" />
</div>
</div>
</body>
</html>