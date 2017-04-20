
<!DOCTYPE html>
<html lang="en" ng-app='backlog'>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="" >
	
	<title>Collaborate Project Tracking</title>
	
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
	
	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jumbotron.css')}" type="text/css">
	
	<!-- AngularJS -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js"></script>
	<g:javascript src="backlog.js" />
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'backlog.css')}" type="text/css">
	
	<r:require module="jquery" />
	<r:layoutResources />
	
</head>

<body>

	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<p class="navbar-text">
					${project.name}
				</p>
			</div>
			<div class="navbar-collapse collapse">
				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" placeholder="Email" class="form-control">
					</div>
					<button type="submit" class="btn btn-success">Sign in</button>
				</form>
				<ul class="nav navbar-nav">
					<li><g:link controller="home" action="index">Home</g:link></li>
					<li><g:link controller="project" action="show" id="${project.id}">Dashboard</g:link></li>
					<li class="active"><a href="#backlog">Backlog</a></li>
					<li><a href="#plan">Plan</a></li>
					<li><a href="#track">Track</a></li>
				</ul>

			</div>
			<!--/.navbar-collapse -->
		</div>
	</div>

	<div class="container" style="padding-top: 25px" ng-controller="BacklogCtrl" ng-init="init(${project.id});">
	
	
		<div class="row">
			<div class="col-md-12">

					<h4 style=""><span ng-bind="backlog.stories.length" class="label label-default"></span> Stories   <span ng-bind="backlog.totalPoints" class="label label-default"></span> Total Points</h4>		
				
					<hr/>
				
					<form ng-submit="addStoryToBacklog(${project.id})" style="padding-bottom:15px;" class="form-inline" role="form">
						<div class="form-group">
							<input type="text" ng-model="storyTitle" size="30" placeholder="Add new story" class="form-control" > 
						</div>
						<div class="form-group">
							<input class="btn btn-info btn-s" type="submit" value="Add">
						</div>
						<div class="form-group">
							<button class="btn btn-primary btn-s" data-toggle="modal" data-target="#storyModal">Add with detail</button>
						</div>
					</form>
				
					<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>Title</th>
								<th>Points</th>
								<th>Owner</th>
								<th>Labels</th>
								<th></th>
							</tr>
						</thead>
						
						<tr ng-repeat="story in backlog.stories">
							<td ng-click="editingt = true" class="editable">
								<span ng-hide="editingt" class="badge" style="margin-right:5px;">ID{{story.id}}</span><span ng-hide="editingt" ng-bind="story.title"></span> 
								<span><input ng-show="editingt" type="text" ng-model="story.title" size="30" class="form-control"></span>
							</td>
							<td ng-click="editingp = true" class="editable">
								<span ng-hide="editingp" ng-bind="story.points"></span>
								<span><input ng-show="editingp" type="number" ng-model="story.points" size="2" class="form-control"></span>
							</td>
							<td ng-click="editingo = true" class="editable">
								<span ng-hide="editingo" ng-bind="story.owner.email"></span>
								<span ng-show="editingo">
									<select ng-model="story.owner" ng-options="user.email for user in users" name="user" class="form-control"></select>
								</span>		
							</td>
							<td ng-click="editingl = true" class="editable">
								<span ng-repeat="label in story.labels">
									<span ng-hide="editingl" ng-bind="label.title" class="badge"></span>
<!-- 									<span ng-if="($first || $middle) && story.labels.length > 1">-</span> -->
								</span>
								<span ng-show="editingl">
									<select ng-model="story.labels" ng-options="label.title for label in labels" name="label" class="form-control" multiple></select>
								</span>	
							</td>
							<td>
								<span ng-hide="editingt || editingp || editingo || editingl" ng-click=""><a href="">Full Edit</a></span>
								<span ng-show="editingt || editingp || editingo || editingl" ng-click="editingp = false; editingt = false; editingo = false; editingl = false;">
									<input type="button" class="btn btn-info btn-xs" value="Save" ng-click="updateStory(${project.id}, $index)"/>
								</span>
							</td>
							
						</tr>
					</table>
			</div>
		</div>
		
		<hr>

		<footer>
			<p>&copy; Collaborate 2013</p>
		</footer>
	</div>
	<!-- /container -->
	
	<!-- Collaborator Modal -->
	<div class="modal fade" id="storyModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="userStoryLabel">New Story</h3>
				</div>
				<div class="modal-body">
					<g:form role="form" url="[action:'create',controller:'story']">
						<input type="hidden" name="id" value="${project.id}"/>
						
						<div class="form-group">
							<label for="title">Title</label> 
							<input type="text" name="title" class="form-control" id="title" placeholder="Enter story title" />
						</div>
						<div class="form-group">
							<label for="description">Description</label> 
							<input type="text" name="description" class="form-control" id="description" placeholder="Enter description" />
						</div>
						<div class="form-group">
							<label for="points">Points</label> 
							<input type="text" name="points" class="form-control" id="points" placeholder="Enter points" size="2"/>
						</div>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-info">Save</button>
					</g:form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->



	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<g:javascript src='bootstrap.min.js' />
</body>
</html>
