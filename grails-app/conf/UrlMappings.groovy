class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "home")
        "500"(view:'/error')

		"/rest/user/list"(controller: "userRest", action:"list")

		"/rest/project/$id/backlog"(controller: "projectRest", action:"getBacklog")

		"/rest/project/$projectId/story/update"(controller: "projectRest", action:"updateStory")

		"/rest/project/$projectId/story/create"(controller: "projectRest", action:"createStory")

		"/rest/label/list"(controller: "labelRest", action:"list")
	}
}
