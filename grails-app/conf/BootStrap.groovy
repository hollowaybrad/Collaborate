import grails.converters.JSON

import com.collaborate.Label
import com.collaborate.Project
import com.collaborate.Story
import com.collaborate.User

class BootStrap {

    def init = { servletContext ->

		JSON.registerObjectMarshaller(Story) {
			def map = [:]
			map['id'] = it.id
			map['projectId'] = it.project.id
			map['title'] = it.title
			map['description'] = it.description
			map['points'] = it.points
			map['state'] = it.state
			map['requestor'] = it.requestor
			map['owner'] = it.owner
			map['dateCreated'] = it.dateCreated
			map['labels'] = it.labels
			map['tasks'] = it.tasks
			return map
		}

		User user = new User(email:"hollowaybrad@gmail.com", firstName:"Brad",lastName:"Holloway").save()
		User user2 = new User(email:"testuser@gmail.com", firstName:"Test",lastName:"User").save()

		Label label1 = new Label(title: "Membership").save()
		Label label2 = new Label(title: "Security").save()

		Story story1 = new Story(title:"Member logs in", description:"Member is authenticated and logs into the application", points:new Integer(2), owner:user, requestor:user)
		Story story2 = new Story(title:"Member views homepage", description:"Member is authenticate and views the homepage", points:new Integer(2), owner:user, requestor:user)

		story1.addToLabels(label1)

		Project project1 = new Project(name:"TPC Membership", description:"New rewrite of TPC Membership system. This includes rewrite of TPCOnline, Membership to the new architecture as well as converting existing AS400 billing features and integrations.", collaborators:[user])
		Project project2 = new Project(name:"Commitments", description:"New rewrite of web based commitments. TLA and Canada support already exists. This includes new work to make PGA TOUR and Champions Tour happen.", collaborators:[user]).save()

		project1.addToStories(story1)
		project1.addToStories(story2)
		project1.save()
    }

    def destroy = {
    }
}
