package tptest

import tp.mbds.com.Illustration
import tp.mbds.com.Role
import tp.mbds.com.SaleAd
import tp.mbds.com.User
import tp.mbds.com.UserRole

class BootStrap {

    def init = { servletContext ->
        def roleAdmin = new Role(authority: "ROLE_ADMIN").save()
        def roleUser = new Role(authority: "ROLE_USER").save()
        def roleModo = new Role(authority: "ROLE_MODERATEUR").save()

        def userAdmin = new User(username: "admin", password: "password").save()
        def userClient = new User(username: "user", password: "password").save()
        def userModo = new User(username: "modo", password: "password" ).save()

        UserRole.create(userAdmin, roleAdmin, true)
        UserRole.create(userClient, roleUser, true)
        UserRole.create(userModo,roleModo, true )



        (1..5).each{Integer Index ->
            def annonceInstance = new SaleAd(title: "title"+Index,
                    description: "description" + Index ,
                    longDescription: "longDescription" + Index,
                    price: 100F*Index)
            (1..3).each{
                annonceInstance.addToIllustrations( new Illustration(filename: "image.jpg" ))
            }
            userClient.addToSaleAds(annonceInstance)
        }
        userClient.save(flush:true, failOnError: true)

    }
    def destroy = {
    }
}
