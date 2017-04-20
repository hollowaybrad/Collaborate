package com.collaborate

import com.collaborate.User;

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class CollaboratorSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test Collaborator"() {
		
		User c = new User(firstName: "Test", lastName: "User", userName: "testUser@test.com")
		
		expect:
		c.firstName == "Test"
		c.lastName == "User"
		c.userName == "testUser@test.com"
		
    }
}
