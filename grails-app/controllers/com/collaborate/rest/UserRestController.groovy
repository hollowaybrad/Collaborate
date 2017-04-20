package com.collaborate.rest

import grails.converters.JSON

import com.collaborate.User

class UserRestController {

    def list(){
		render User.list() as JSON
	}
}
