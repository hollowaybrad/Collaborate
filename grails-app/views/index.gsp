
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="">

<title>Collaborate Project Tracking</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">

<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'jumbotron.css')}" type="text/css">

<r:require module="jquery" />
<r:layoutResources />

	<script type="text/javascript">
	    $( document ).ready(function() {
		    $('#myModal').on('shown.bs.modal', function () {
		    	$('#name').focus();
			});
		    
		})
    </script>

</head>

<body>

	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<div class="navbar-collapse collapse">
				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" placeholder="Email" class="form-control">
					</div>
					<button type="submit" class="btn btn-success">Sign in</button>
				</form>
				<ul class="nav navbar-nav">
					<li class="active"><g:link controller="home" action="index">Home</g:link></li>
					<li><a href="#about">About</a></li>
					<li><g:link controller="user">Users</g:link></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Settings <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>

			</div>
			<!--/.navbar-collapse -->
		</div>
	</div>

	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<span style="float: right"> <img src="${resource(dir: 'images', file: 'collaborate.PNG')}" alt="screenshot" width="300" height="200" /></span>
			<h1>Welcome to Collaborate!</h1>
			<p>Select your favorite project below or create a new one</p>
			<p>
				<button class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">New Project &raquo;</button>
			</p>
		</div>
	</div>

	<!-- Project Modal --> 
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">New Project</h3>
				</div>
				<div class="modal-body">
					<g:form role="form" url="[action:'create',controller:'project']">
						<div class="form-group">
							<label for="name">Name</label> 
							<input type="text" name="name" class="form-control" id="name" placeholder="Enter project name" />
						</div>
						<div class="form-group">
							<label for="description">Description</label>
							<textarea id="description" name="description" class="form-control" rows="4" cols="50" placeholder="Enter project description"></textarea>
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

	<div class="container">
		<!-- Example row of columns -->

		<div class="row">
			<g:each var="project" in="${projects}">
				<div class="col-6 col-sm-6 col-lg-4" style="min-height: 200px">
					<h2>
						${project.name}
					</h2>
					<p>
						${project.description}
					</p>
					<p>
						<g:link role="button" class="btn btn-success" controller="project"
							action="show" id="${project.id}">GO</g:link>
						<g:link class="btn btn-failure" controller="project"
							action="delete" id="${project.id}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Delete</g:link>
					</p>
				</div>
				<!--/span-->
			</g:each>
		</div>

		<hr>

		<footer>
			<p>&copy; Collaborate 2013</p>
		</footer>
	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<g:javascript src='bootstrap.min.js' />
</body>
</html>
