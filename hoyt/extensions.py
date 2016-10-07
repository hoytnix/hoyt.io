from flask_admin import Admin
from flask_sqlalchemy import SQLAlchemy
from flask_misaka import Misaka

admin = Admin
db = SQLAlchemy()

md = Misaka(**{'fenced_code': True})
