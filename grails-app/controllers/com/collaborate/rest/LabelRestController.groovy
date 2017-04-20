package com.collaborate.rest

import grails.converters.JSON

import com.collaborate.Label

class LabelRestController {

    def list(){
		render Label.list() as JSON
	}
}
