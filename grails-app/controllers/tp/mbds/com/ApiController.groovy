package tp.mbds.com

import grails.converters.JSON
import grails.converters.XML

class ApiController {
    def index() {}

    def User() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break
            case "PUT":
                // HTTP 201 (CREATED) HTTP 204 (NO CONTENT) HTTP 404 (NOT FOUND) HTTP 400 (BAD REQUEST)
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                //changement username
                def username = request.JSON.username
                userInstance.username = username
                //changement password
                def password = request.JSON.password
                if (password != "") {
                    userInstance.password = password
                }
                if (!userInstance)
                    return response.status = 404
                userInstance.save(flush: true)
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break
            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                UserRole.removeAll(userInstance)
                userInstance.delete(flush: true)
                return response.status = 200
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }

    def Users() {
        switch (request.getMethod()) {
            case "GET":
                def listUsers = User.getAll()
                if (listUsers.isEmpty())
                    return response.status = 404
                response.withFormat {
                    xml { render listUsers as XML }
                    json { render listUsers as JSON }
                }
                break
            case "POST":
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }

    def SaleAd() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id)
                if (!saleAdInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render saleAdInstance as XML }
                    json { render saleAdInstance as JSON }
                }
                break
            case "PUT":
                if (!params.id)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id)
                if (!saleAdInstance)
                    return response.status = 404
                //changement title
                def title = request.JSON.title
                saleAdInstance.title = title
                //changement description
                def description = request.JSON.description
                saleAdInstance.description = description
                //changement longlongDescription
                def longDescription = request.JSON.longDescription
                saleAdInstance.longDescription = longDescription
                //changement price
                def price = request.JSON.price
                saleAdInstance.price = price

                if (!saleAdInstance)
                    return response.status = 404
                saleAdInstance.save(flush: true)
                response.withFormat {
                    xml { render saleAdInstance as XML }
                    json { render saleAdInstance as JSON }
                }
                break
            case "PATCH":
                break
            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id)
                if (!saleAdInstance)
                    return response.status = 404
                def userInstance = saleAdInstance.author
                userInstance.removeFromSaleAds(saleAdInstance)
                saleAdInstance.delete(flush: true)
                return response.status = 200
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406

    }

    def SaleAds() {
        switch (request.getMethod()) {
            case "GET":
                def listSaleAds = SaleAd.getAll()
                if (listSaleAds.isEmpty())
                    return response.status = 404
                response.withFormat {
                    xml { render listSaleAds as XML }
                    json { render listSaleAds as JSON }
                }
                break
            case "POST":
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }
}