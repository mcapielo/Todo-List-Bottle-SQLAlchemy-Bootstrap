<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link   href="/css/bootstrap.min.css" rel="stylesheet">
<script src="/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container">

                <div class="span10 offset1">
                    <div class="row">
                        <h3>Update a Task</h3>
                    </div>

                    <form class="form-horizontal" action="/edit/{{no}}" method="get">
                      <div class="control-group">
                        <label class="control-label">Task</label>
                        <div class="controls">
                            <input name="task" value="{{old}}" size="200" maxlength="200"">
                            <select name="status" class="form-control">
                        <option>open</option>
                        <option>closed</option>
                        </select>
                        </div>
                      </div>
                      <div class="form-actions">
                          <button type="submit" name="save" value="save" class="btn btn-success">Update</button>
                          <a class="btn" href="/">Back</a>
                        </div>
                    </form>
                </div>

    </div> <!-- /container -->
  </body>
</html>