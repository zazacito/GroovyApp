<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="list-user" class="content scaffold-list" role="main">

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div class="container-fluid">
                <h1 style="font-weight: bold !important; margin-top: 2rem !important; " >Tous les Utilisateurs</h1>
                <table class="table table-striped table-hover table-bordered">
                    <thead >
                        <tr>
                            <g:sortableColumn property="username" title="Nom d'utilisateur" style="text-align:center !important;"/>
                            <g:sortableColumn property="saleAds" title="Annonces" />
                            <g:sortableColumn property="role" title="Role" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each var="user" in="${userList}" >
                        <tr>
                            <td style="font-weight: bold !important; text-align:center !important;">
                                <g:link controller="user" action="show" id="${user.id}">
                                    ${user.username}
                                </g:link>
                            </td>
                            <td>
                                <table class=" table table-sm thead-light">
                                    <thead >
                                        <tr >
                                            <th style="font-size:10px !important;">Titre</th>
                                            <th style="font-size:10px !important;">Description</th>
                                            <th style="font-size:10px !important;">Prix</th>
                                        </tr>

                                    </thead>
                                    <tbody>
                                        <g:each var="listAds" in="${user.saleAds}" >
                                            <tr>
                                                <td>
                                                    <g:link controller="saleAd" action="show" id="${listAds.id}">
                                                        ${listAds.title}
                                                    </g:link>
                                                </td>
                                                <td> ${listAds.description} </td>
                                                <td>${listAds.price} €</td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </td>
                            <td>
                                <g:each var="role" in="${user.getAuthorities()}">
                                    ${role.authority}
                                </g:each>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <br>

                <g:link class="btn btn-primary btn-warning btn-lg "
                        controller="user" action="create">Ajouter Un Utilisateur</g:link>

                <br>
                <br>
                <hr>


            </div>


            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>