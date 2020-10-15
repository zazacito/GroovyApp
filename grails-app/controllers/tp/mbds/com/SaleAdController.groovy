package tp.mbds.com

import grails.validation.ValidationException
import org.apache.commons.lang.RandomStringUtils

import java.text.DecimalFormat

import static org.springframework.http.HttpStatus.*

class SaleAdController {

    SaleAdService saleAdService

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond saleAdService.list(params), model: [saleAdCount: saleAdService.count()]
    }

    def show(Long id) {
        respond saleAdService.get(id)
    }

    def create() {
        respond new SaleAd(params)
    }

    def save(SaleAd saleAd) {
        if (saleAd == null) {
            notFound()
            return
        }

        try {

            def user = User.get(params.author)

            request.multipartFiles.eachWithIndex {
                def mfile, int index ->
                    def f = request.getFile('filename'+index)

                    String charset = (('A'..'Z') + ('0'..'9')).join()
                    Integer length = 9
                    String randomString = RandomStringUtils.random(length, charset.toCharArray())
                    def file = new File(grailsApplication.config.tpmbds.illustrations.path + randomString +'.png')
                    f.transferTo(file)

                    saleAd.addToIllustrations(new Illustration(filename: file.getName()))
            }
            saleAdService.save(saleAd)
            user.addToSaleAds(saleAd)
            user.save(flush: true, failOnError: true)

        } catch (ValidationException e) {
            respond saleAd.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), saleAd.id])
                redirect saleAd
            }
            '*' { respond saleAd, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond saleAdService.get(id)
    }

    def update() {
        def saleAd = SaleAd.get(params.id)
        if (saleAd == null) {
            notFound()
            return
        }

        try {
            request.multipartFiles.eachWithIndex {
                def mfile, int index ->
                    def f = request.getFile(mfile.key)

                    String charset = (('A'..'Z') + ('0'..'9')).join()
                    Integer length = 9
                    String randomString = RandomStringUtils.random(length, charset.toCharArray())
                    def file = new File(grailsApplication.config.tpmbds.illustrations.path + randomString +'.png')
                    f.transferTo(file)

                    saleAd.addToIllustrations(new Illustration(filename: file.getName()))
            }
            saleAd.title = params.title
            saleAd.description = params.description
            saleAd.longDescription = params.longDescription
            saleAd.price = Float.parseFloat(params.price)

            saleAdService.save(saleAd)

        } catch (ValidationException e) {
            respond saleAd.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), saleAd.id])
                redirect saleAd
            }
            '*' { respond saleAd, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        saleAdService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
