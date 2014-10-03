%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link   href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container">
            <div class="row">
                <h3>TODO Task List with Bottle - SqlAlchemy - Bootstrap</h3>
            </div>
            <div class="row">
               <p>
                    <a href="/new" class="btn btn-success">New Task</a>
                </p>
		<table class="table table-striped table-bordered">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Task</th>
                      <th>Status</th>
		              <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>

                        %for row in rows:
                  <tr>
                        %for col in row:
                        <td>{{col}}</td>
                        %end

                        <td width=250>
                        <a class="btn btn-success" href="/edit/{{row[0]}}">Update</a>
                        <a class="btn btn-danger" href="/del/{{row[0]}}">Delete</a>
                        </td>
                  </tr>
                        %end
                  </tbody>
            </table>
        </div>
    </div> <!-- /container -->
  </body>
</html>
