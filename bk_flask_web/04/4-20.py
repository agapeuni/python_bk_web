from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] ="postgresql+pypostgresql://sqlalchemy:sqlalchemy@localhost/sqlalchemy"
db = SQLAlchemy(app)

import models

… 중략