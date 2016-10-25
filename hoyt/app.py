from os import path, walk

from flask import Flask
from flask_admin.contrib.sqla import ModelView

from hoyt.extensions import admin, db, md
from lib.dates import current_year
from lib.imports import all_blueprints, all_models


def create_app(environment='develop'):
    app = Flask(__name__)

    # Configuration -----------------------------------------------------------
    if not environment:
        environment = 'develop'

    cwd = path.dirname(path.abspath(__file__))
    config_dir = path.join(cwd, 'config')

    config_files = []
    for (root, dir_names, file_names) in walk(config_dir):
        for file_name in file_names:
            config_files.append(path.join(root, file_name))
    config_files = sorted(config_files)

    for config_file in config_files:
        app.config.from_pyfile(config_file)

        if environment:
            if environment in config_file:
                break    # only go as deep as the runtime
    app.config['ENV'] = environment

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
    _admin = admin(app, url='/admin', name='Allegan Legal', template_mode='bootstrap3')
    for model in all_models():
        _admin.add_view(ModelView(model, db.session))

    # Flask-Misaka
    md.init_app(app)

    return None


def template_processors(app):
    app.jinja_env.add_extension('hamlish_jinja.HamlishExtension')
    app.jinja_env.globals.update(current_year=current_year)

    return app.jinja_env
