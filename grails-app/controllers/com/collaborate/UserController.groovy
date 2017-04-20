package com.collaborate

import grails.transaction.Transactional

class UserController{

	def index(){
		[users: User.list()]
	}

	@Transactional
	def create(){
		User collaborator = new User(params).save()
		redirect(action: 'index')
	}

}
