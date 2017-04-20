package com.collaborate

import grails.transaction.Transactional


class ProjectController{

	def show(){
		[project: Project.get(params.id)]
	}

	@Transactional
	def create(){
		Project project = new Project(params).save()
		redirect(action: 'show', params: [id: project.id])
	}

	@Transactional
	def delete() {
		def project = Project.get(params.id)
		project.delete()
		redirect(controller: 'home', action: 'index')
	}

	def backlog(){
		[project: Project.get(params.id)]
	}
}
