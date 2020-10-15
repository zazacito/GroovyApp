<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="create-user" class="content scaffold-create" role="main">
            <h1 style="font-weight: bold !important; margin-top: 2rem !important; padding-bottom: 2rem !important;" >Ajouter Un Utilisateur</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <div class="container">

                <div class="row">
                    <div class="col-md-4 order-md-2 mb-4">

                    </div>
                    <div class="col-md-4">
                        <g:form class="form-signin" style="max-width:30rem !important;" resource="${this.user}" method="POST">

                            <br>
                            <div class="form-label-group">
                                <label for="username">Nom d'utilisateur</label>
                                <input type="text" name="username" value="" required="" id="username"  class="form-control"
                                       placeholder="Entrez  un nom d'utilisateur" autofocus="">
                            </div>
                            <br>
                            <div class="form-label-group">
                                <label for="password">Password</label>
                                <input  type="password" name="password" required="" value="" id="password" class="form-control"
                                        placeholder="Entrez un mot de passe" required="">
                            </div>
                            <br>
                            <div class="form-label-group">
                                <label >Rôle</label>
                                <g:select class="form-control" from="${tp.mbds.com.Role.list()}"
                                          name="role" optionKey="id" optionValue="authority"/>
                            </div>
                            <br>
                            <div class="form-label-group">
                                <g:submitButton class="btn btn-primary btn-warning btn-lg btn-block" name="create"
                                                value="${message(code: 'default.button.create.label', default: 'Create')}" />
                            </div>


                        </g:form>
                        <br><br><br><br><br><br><br>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
