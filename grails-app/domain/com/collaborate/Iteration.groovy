package com.collaborate


class Iteration{

	String name
	Date startDate
	Date endDate
	Integer velocity
	Date dateCreated = new Date()

	static belongsTo = [project: Project]

	static hasMany = [stories: Story]

    static constraints = {
    }
}
