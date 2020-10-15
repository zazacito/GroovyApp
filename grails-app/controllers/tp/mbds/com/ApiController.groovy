package tp.mbds.com

import grails.converters.JSON
import grails.converters.XML

class ApiController {

    def index() { }

    def User() {
       switch(request.getMethod()){
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


               response.withFormat {
                   xml { render userInstance as XML }
                   json { render userInstance as JSON }
               }
           break
           case "PATCH":
           break
           case "DELETE":
           break
           default:
               return response.status = 405
           break
       }
        return response.status  = 406
    }

    def Users(){ }

    def SaleAd(){
        switch(request.getMethod()){
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
                break
            case "PATCH":
                break
            case "DELETE":
                break
            default:
                return response.status = 405
                break
        }
        return response.status  = 406


    }

    def SaleAds(){ }
}
