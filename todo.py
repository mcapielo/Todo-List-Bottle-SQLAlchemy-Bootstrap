from bottle import route, debug, template, request, static_file, response, redirect
import bottle
import os
os.chdir(os.path.dirname(__file__))
from models import Todo
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


engine = create_engine('mysql+mysqldb://root:mariano@localhost/tododb?charset=utf8&use_unicode=0')
Session = sessionmaker(bind=engine)
session = Session()


@route('/')
def todo_list():
    # Make a query to find all Todos in the database
    result = session.query(Todo.id, Todo.task, Todo.status).filter_by(status=1).all()
    output = template('index', rows=result)
    return output


@route('/new', method='GET')
def new_item():
    if request.GET.get('save', '').strip():
        new = request.GET.get('task', '').strip()
        newtask = Todo()
        newtask.task = new
        newtask.status = 1
        session.add(newtask)
        session.commit()
        redirect('/')
    else:
        return template('new_task')

@route('/del/<no:int>', method='GET')
def del_item(no):
        deletetask = session.query(Todo).filter(Todo.id == no).one()
        session.delete(deletetask)
        session.commit()
        redirect('/')



@route('/edit/<no:int>', method='GET')
def edit_item(no):
    if request.GET.get('save', '').strip():
        edit = request.GET.get('task', '').strip()
        status = request.GET.get('status', '').strip()

        if status == 'open':
            status = 1
        else:
            status = 0

        updatetask = session.query(Todo).filter(Todo.id == no).one()
        updatetask.task = edit
        updatetask.status = status
        session.commit()

        redirect('/')
    else:
        updatetask = session.query(Todo).filter(Todo.id == no).one()
        cur_data = updatetask.task
        return template('edit_task', old=cur_data, no=no)


@route('/<filename:re:.*\.html>', method='GET')
@route('/<filename:re:.*\.js>', method='GET')
@route('/<filename:re:.*\.css>', method='GET')
@route('/<filename:re:.*\.(jpg|png|gif|ico)>', method='GET')
@route('/<filename:re:.*\.(eot|ttf|woff|svg)>', method='GET')
def statics(filename):
        response.set_header('Cache-Control', 'max-age=36,public')
        return static_file(filename, root='static')


debug(True)
application = bottle.default_app()