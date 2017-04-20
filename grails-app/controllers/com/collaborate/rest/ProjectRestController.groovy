package com.collaborate.rest

import grails.converters.JSON
import grails.transaction.Transactional

import com.collaborate.Project
import com.collaborate.Story
import com.collaborate.enums.State

class ProjectRestController {

	def getBacklog(){

		Project project = Project.get(params.id)

		def query = Story.where {project == project && state == State.DEFINED}

		def json =  query.list(sort:"id", order:"asc") as JSON
		json.prettyPrint = true

		render json
	}

	@Transactional
	def updateStory(Story story){

		println "Got story ${story.title} with ${story.labels.size()} labels"

		story.labels.each { println ${it.title} }

		story.save()
	}

	@Transactional
	def createStory(){

		Story story = new Story(params)

		Project project = Project.get(params.projectId)
		project.addToStories(story)
		project.save(failOnError: true, flush:true)

		render story as JSON
	}
}