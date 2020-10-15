<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div id="edit-saleAd" class="content scaffold-edit" role="main">

    <h1 style="font-weight: bold !important; margin-top: 2rem !important; padding-bottom: 2rem !important;">Editer Une Annonce</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.saleAd}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.saleAd}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>


    <div class="container">

        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">

            </div>

            <div class="col-md-4">
                <g:form class="form-signin" enctype="multipart/form-data" action="update" id="${saleAd.id}" method="POST"
                        style="max-width:30rem !important;">
                    <br>

                    <div class="form-label-group">
                        <label for="title">Titre</label>
                        <input type="text" name="title" value="${this.saleAd.title}" required="" id="title"
                               class="form-control"
                               autofocus="">
                    </div>
                    <br>

                    <div class="form-label-group">
                        <label for="description">Description</label>
                        <input type="text" name="description" value="${this.saleAd.description}"
                               required="" id="description" class="form-control">

                    </div>
                    <br>

                    <div class="form-label-group">
                        <label for="longDescription">Description Longue</label>
                        <textarea name="longDescription" required="" id="longDescription" class="form-control">
                            ${this.saleAd.longDescription}
                        </textarea>
                    </div>
                    <br>

                    <div class="form-label-group">
                        <label>Prix</label>
                        <input type="number" step="0.01" name="price" required="" min="0.0" id="price"
                               class="form-control" value="${this.saleAd.price}">
                    </div>
                    <br>

                    <div class="form-label-group">

                        <label for="filename">Illustrations</label>

                        <ol style="padding-left:1rem !important;">
                            <g:each var="illustration" in="${saleAd.illustrations}">
                                <li>
                                    <img src="${grailsApplication.config.tpmbds.illustrations.url}${illustration.filename}"
                                         height="200px" alt="Grails"/>
                                    <br>
                                    <br>
                                    <g:link class="btn  btn-danger" controller="illustration" action="delete"
                                            id="${illustration.id}">Supprimer
                                    </g:link>
                                </li>
                                <br>
                            </g:each>

                        </ol>

                        <div class="content" id="wrapper">
                            <br>
                        </div>
                        <br>
                        <input type="button" class=" btn  btn-warning"
                               id="more_fields" onclick="add_fields();
                        add();" value="Ajouter plus d'Illustrations"/>

                    </div>
                    <br>

%{--                    <div class="form-label-group">--}%
%{--                        <label>Sélectionnez un Auteur</label>--}%
%{--                        <g:select class="form-control" from="${tp.mbds.com.User.list()}"--}%
%{--                                  name="user" optionKey="id" optionValue="username"--}%
%{--                                  value="${this.saleAd.author.id}"/>--}%
%{--                    </div>--}%
                    <br>

                    <div class="form-label-group">
                        <input class="btn btn-primary btn-warning btn-lg btn-block" type="submit"
                               value="${message(code: 'default.button.update.label', default: 'Update')}"/>

                    </div>
                </g:form>
                <br><br><br><br><br><br><br>
            </div>
        </div>

    </div>
</div>
<script>
    var i = 0;

    function add() {
        i++;
    }

    function add_fields() {
        document.getElementById('wrapper').innerHTML += '<input type="file" name="filename' + i + '" value="" required="" id="filename" placeholder="Entrez un nom de fichier"> <br>\r\n';
    }
</script>
</body>
</html>
