from sqlalchemy import Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class Todo(Base):
    __tablename__ = 'todo'
    # Here we define columns for the table todo
    # Notice that each column is also a normal Python instance attribute.
    id = Column(Integer, primary_key=True, autoincrement=True)
    task = Column(String(100), nullable=False)
    status = Column(Integer, nullable=False)

from sqlalchemy import create_engine
engine = create_engine('mysql+mysqldb://root:mariano@localhost/tododb?charset=utf8&use_unicode=0')

from sqlalchemy.orm import sessionmaker

# Construct a sessionmaker object
session = sessionmaker()

# Bind the sessionmaker to engine
session.configure(bind=engine)

# Create all the tables in the database which are
# defined by Base's subclasses such as User
Base.metadata.create_all(engine)