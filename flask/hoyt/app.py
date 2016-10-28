from flask import Flask
from flask_admin.contrib.sqla import ModelView

from hoyt.settings import settings
from hoyt.extensions import admin, db, md
from lib.dates import current_year
from lib.imports import all_blueprints, all_models


def create_app(environment=None, settings_override=None):
    app = Flask(__name__)

    app.config.update(settings(environment))
    if settings_override:
        app.config.update(settings_override)

    # Blueprints --------------------------------------------------------------
    for blueprint in all_blueprints():
        app.register_blueprint(blueprint)

    template_processors(app)
    extensions(app)

    return app


def extensions(app):
    # Flask-Sqlalchemy
    db.init_app(app)

    # Flask-Admin
    _admin = admin(
        app, url='/admin', name='Hoyt.IO', template_mode='bootstrap3')
    for model in all_models():
        _admin.add_view(ModelView(model, db.session))

    # Flask-Misaka
    md.init_app(app)

    return None


def template_processors(app):
    app.jinja_env.globals.update(current_year=current_year)

    return app.jinja_env
