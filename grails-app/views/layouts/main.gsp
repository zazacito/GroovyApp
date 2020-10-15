<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav navbar-left">
                <li class="nav-item" style="color: yellow !important; padding-top:1rem !important; ">
                    <img src="https://img.icons8.com/doodle/48/000000/rubber-duck.png"/> LE COIN COIN
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-center" style="padding-left:2rem !important; ">
                <li class="nav-item active">
                    <a href="/tpmbds/">Accueil</a>
                </li>
                <li class="nav-item">
                    <g:link controller="saleAd" action="index">Voir les Annonces</g:link>
                </li>
                <li class="nav-item">
                    <g:link controller="saleAd" action="create">Ajouter Une Annonce</g:link>
                </li>
                <li class="nav-item">
                    <g:link controller="user" action="index">Voir Les Utilisateurs</g:link>
                </li>
                <li class="nav-item">
                    <g:link controller="user" action="create">Ajouter Un Utilisateur</g:link>
                </li>

            </ul>
            <ul class="nav navbar-nav navbar-right" style="padding-left:2rem !important; ">
                <li class="nav-item">
                    <g:link controller="logout" action="index">Déconnexion</g:link>
                </li>
            </ul>
        </div>
    </div>
</div>

<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>
<footer class="footer mt-auto py-3">Réalisé Par Justin Lassalle et Victor Azalbert</footer>
</body>
</html>
