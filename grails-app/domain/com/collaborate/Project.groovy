package com.collaborate

import grails.rest.Resource


@Resource(uri='/projects')
class Project{

	String name
	String description
	Date dateCreated = new Date()

	static hasMany = [iterations: Iteration, collaborators: User, stories: Story]

	static mapping = {
		stories lazy: false
	}

    static constraints = {
		name blank:false
    }


}
