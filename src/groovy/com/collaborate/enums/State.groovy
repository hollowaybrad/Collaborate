package com.collaborate.enums

enum State {

	DEFINED("Defined"),
	IN_PROGRESS("In-Progress"),
	COMPLETED("Completed"),
	ACCEPTED("Accepted")

	public State(String label){
		this.label = label
	}

	String label;

}
