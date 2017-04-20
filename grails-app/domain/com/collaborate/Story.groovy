package com.collaborate

import com.collaborate.enums.State

class Story{

	String title
	String description
	Integer points = new Integer(0);
	State state = State.DEFINED;
	User requestor
	User owner
	Date dateCreated = new Date()

	static belongsTo = [project: Project]

	static hasMany = [labels: Label, tasks: Task]

	static mapping = {
		labels lazy: false
		tasks lazy: false
	}

    static constraints = {
		owner nullable: true
		requestor nullable: true
		description nullable: true
    }
}
