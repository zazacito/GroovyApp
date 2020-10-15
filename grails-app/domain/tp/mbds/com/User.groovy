package tp.mbds.com

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString


class User implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [saleAds: SaleAd]

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        password nullable: true, blank: false, password: true
        username nullable: false, blank: false, unique: true
        saleAds nullable: true
    }

    static mapping = {
        password column: '`password`'
    }
}
