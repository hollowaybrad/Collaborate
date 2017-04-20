package com.collaborate

import com.collaborate.enums.State


class Task{

	String estimate
	String todo
	State state
	Date dateCreated = new Date()

	static belongsTo = [story: Story]

    static constraints = {
    }
}
