
package com.collaborate


class User{

	String email
	String firstName
	String lastName
	Date dateCreated = new Date()

	static constraints = {
		email blank:false
		firstName blank:false
		lastName blank:false
	}

}
