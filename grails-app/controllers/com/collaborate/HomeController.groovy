package com.collaborate

import org.springframework.web.servlet.ModelAndView

class HomeController {

    def index() {
		return new ModelAndView("/index", [projects:Project.list()])
	}
}
