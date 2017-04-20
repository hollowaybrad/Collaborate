
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
          <p class="navbar-text">${project.name}</p>
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
            <li class="active"><a href="#">Dashboard</a></li>
            <li><g:link controller="project" action="backlog" id="${project.id}">Backlog</g:link></li>
            <li><a href="#plan">Plan</a></li>
            <li><a href="#track">Track</a></li>  
          </ul>
         
        </div><!--/.navbar-collapse -->
      </div>
    </div>
    

    <div class="container" style="padding-top: 25px">
    
    <div class="row">
        <div class="col-md-6" style="min-height: 200px">
          <h4 style="border: 1px solid; padding:5px">My Tasks</h4>
          <p style="text-align: center; font-style: italic;">Nothing todo at the moment. Your all done!</p>
          
        </div>
        <div class="col-md-6" style="min-height: 200px">
          <h4 style="border: 1px solid; padding:5px">Iteration Summary</h4>
          <p style="text-align: center; font-style: italic;">No iterations going on. Better hit the backlog</p>
       </div>
        <div class="col-md-6" style="min-height: 200px">
          <h4 style="border: 1px solid; padding:5px">Unassigned Tasks For Current Iteration</h4>
          <p style="text-align: center; font-style: italic;">Everything is all tasked out</p>
        </div>
         <div class="col-md-6" style="min-height: 200px">
          <h4 style="border: 1px solid; padding:5px">Incomplete Stories For Current Iteration</h4>
          <p style="text-align: center; font-style: italic;">All stories are complete!</p>
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
