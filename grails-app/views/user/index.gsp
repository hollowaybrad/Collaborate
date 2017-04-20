
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
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jumbotron.css')}" type="text/css">
    
    <r:require module="jquery"/>
    <r:layoutResources/>
    
    <script type="text/javascript">
	    $( document ).ready(function() {
	    	$('#userModal').on('shown.bs.modal', function () {
		    	$('#firstName').focus();
			});
		})
    </script>
    
    

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
			<li><a href="#about">About</a></li>
			<li class="active"><a href="#contact">Users</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Settings <b class="caret"></b></a>
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

         
        </div><!--/.navbar-collapse -->
      </div>
    </div>
    
    <!-- Collaborator Modal -->
	<div class="modal fade" id="userModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="userModalLabel">New User</h3>
				</div>
				<div class="modal-body">
					<g:form role="form" url="[action:'create',controller:'user']">
						<div class="form-group">
							<label for="name">First Name</label> 
							<input type="text" name="firstName" class="form-control" id="firstName" placeholder="Enter first name" />
						</div>
						<div class="form-group">
							<label for="description">Last Name</label> 
							<input type="text" name="lastName" class="form-control" id="lastName" placeholder="Enter last name" />
						</div>
						<div class="form-group">
							<label for="description">Email</label> 
							<input type="email" name="email" class="form-control" id="email" placeholder="Enter email" />
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
    

    <div class="container" style="padding-top: 25px">
    
    <div class="row">
        <div class="col-md-6" style="min-height: 200px">
          <h4 style="border: 1px solid; padding:5px">Users</h4>
          <g:each var="user" in="${users}">
          	<p>${user.firstName} ${user.lastName} - ${user.email}</p>
          </g:each>
          
          <button class="btn btn-info btn-md" data-toggle="modal" data-target="#userModal">New User &raquo;</button>
        </div>
       
      </div>

      <hr>

      <footer>
        <p>&copy; Collaborate 2013</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   <g:javascript src='bootstrap.min.js' />
  </body>
</html>
