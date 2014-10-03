<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link   href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">

	<div class="span10 offset1">
	    <div class="row">
		<h3>Create a New Task for TODO</h3>
	    </div>

	    <form class="form-horizontal" action="/new" method="get">
	      <div class="control-group <?php echo !empty($nameError)?'error':'';?>">
		<label class="control-label">Task</label>
		<div class="controls">
		    <input type="text"  placeholder="New Task" maxlength="100" name="task">
		</div>
	      </div>
	      <div class="form-actions">
		  <button name="save" value="save" type="Submit" class="btn btn-success">New Task</button>
		  <a class="btn" href="/">Back</a>
                        </div>
                    </form>
                </div>

    </div> <!-- /container -->
  </body>
</html>
