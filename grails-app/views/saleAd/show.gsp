<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="show-saleAd" class="content scaffold-show" role="main">
            <div class="container-fluid">
                <h1 style="font-weight: bold !important; margin-top: 2rem !important; " >Détails Annonces</h1>

                <br>
                <ol class="property-list user">

                    <li class="fieldcontain">
                        <span id="title-label" class="property-label">Titre</span>
                        <div class="property-value" aria-labelledby="title-label">
                            ${this.saleAd.title}
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="description-label" class="property-label">Description</span>
                        <div class="property-value" aria-labelledby="description-label">
                            ${this.saleAd.description}
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="descriptionLong-label" class="property-label">Description Détaillée</span>
                        <div class="property-value" aria-labelledby="descriptionLong-label">
                            ${this.saleAd.longDescription}
                        </div>
                    </li>
                    <li class="fieldcontain">
                        <span id="illustrations-label" class="property-label">Illustrations</span>
                        <div class="property-value" aria-labelledby="illustrations-label">
                            <g:each var="listIllustrations" in="${saleAd.illustrations}" >
                                <img src="${grailsApplication.config.tpmbds.illustrations.url}${listIllustrations.filename}" height="200px" alt="Grails"/>
                            </g:each>
                        </div>
                    </li>
                    <li class="fieldcontain">
                        <span id="prix-label" class="property-label">Prix</span>
                        <div class="property-value" aria-labelledby="prix-label">
                            ${this.saleAd.price}
                        </div>
                    </li>
                    <li class="fieldcontain">
                        <span id="author-label" class="property-label">Auteur</span>
                        <div class="property-value" aria-labelledby="author-label">
                            ${this.saleAd.author.username}
                        </div>
                    </li>


                </ol>


                <br>
                <br>
                <g:form resource="${this.saleAd}" method="DELETE">
                    <fieldset>
                        <g:link class="btn btn-primary btn-warning btn-lg" action="edit"
                                resource="${this.saleAd}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="btn btn-primary btn-warning btn-lg" type="submit"
                               value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                               onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
                <hr>


            </div>

        </div>
    </body>
</html>
