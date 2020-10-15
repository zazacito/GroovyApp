<%@ page import="tp.mbds.com.SaleAd" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>
<body>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1> <img src="https://img.icons8.com/doodle/48/000000/rubber-duck.png"/> Bienvenue Sur Le Coin Coin <img src="https://img.icons8.com/doodle/48/000000/rubber-duck.png"/></h1>


            <div>
                <h2>Dernières Annonces</h2>
                <br>
                <g:each var="saleAd" in="${tp.mbds.com.SaleAd.list(max:3)}" >
                    <div class="row mb-2 " style="">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-10" style="background-color: lightgray !important; border-radius: 10px !important;">
                            <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                <div class="row mb-2 mt-2" style="padding: 2rem !important;">
                                    <div class="col-md-4 mt-2" >
                                        <img src="${grailsApplication.config.tpmbds.illustrations.url}${saleAd.illustrations[0].filename}" height="150px" alt="Grails"/>
                                    </div>
                                    <div class="col-md-8">
                                        <g:link controller="saleAd" action="show" id="${saleAd.id}">
                                            <strong class="d-inline-block mb-2 text-primary"> ${saleAd.title}</strong>
                                        </g:link>
                                        <p>${saleAd.description} </p>
                                        <p> ${saleAd.price} €</p>
                                        <p> Créé Par: <g:link controller="user" action="show" id="${saleAd.author.id}">
                                            ${saleAd.author.username}
                                        </g:link></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                </g:each>

            </div>


    </div>

</body>
</html>
