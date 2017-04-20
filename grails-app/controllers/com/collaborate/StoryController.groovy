package com.collaborate

import grails.transaction.Transactional

class StoryController {

	@Transactional
    def create(){
		Story story = new Story(params)
		story.project = Project.get(params.id)
		story.save(failOnError: true)

		println "In Story create new Story is: ${story}"

		redirect(controller: 'project', action: 'backlog', params: [id: params.id])
	}
}
