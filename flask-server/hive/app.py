from flask import Flask, request
from flask_admin.contrib.sqla import ModelView

from hive.settings import settings
from hive.extensions import admin, db, md
from lib.imports import all_blueprints, all_models


def create_app(environment=None, settings_override=None):
    """Create a Flask application using the app factory pattern.

    Args:
        settings_override (dict): Override settings.

    Returns:
        app (Flask): Flask application instance
    """

    app = Flask(__name__)

    app.config.update(settings(environment))
    if settings_override:
        app.config.update(settings_override)

    # Blueprints --------------------------------------------------------------
    for blueprint in all_blueprints():
        app.register_blueprint(blueprint)

    template_processors(app)
    extensions(app)

    @app.after_request
    def update_last_modified(response):
        from hive.blueprints.page import LastModified
        try:
            source = response.get_data()
            source = source.decode('utf-8', 'ignore')
        except:
            return response
        LastModified.select(request.path).update_time(source)
        return response

    return app


def extensions(app):
    """Register extensions.

    Args:
        app (Flask): Flask application instance

    Returns:
        None
    """

    # Flask-Sqlalchemy
    db.init_app(app)

    # Flask-Admin
    _admin = admin(
        app, url='/admin', name='Hoyt.IO', template_mode='bootstrap3')
    for model in all_models():
        try:
            if model.__adminview__:
                _admin.add_view(model.__adminview__(model, db.session))
            else:
                _admin.add_view(ModelView(model, db.session))
        except:
            _admin.add_view(ModelView(model, db.session))

    # Flask-Misaka
    md.init_app(app)

    return None


def template_processors(app):
    """Register template processors.

    Args:
        app (Flask): Flask application instance

    Returns:
        app.jinja_env
    """
    from lib import current_year
    from lib.urls import canonical_url_for, canonical_request_url
    from hive.blueprints.page.models import Attribute, LastModified
    from hive.blueprints.blog.models.tag import Tag

    app.jinja_env.globals.update(current_year=current_year)
    app.jinja_env.globals.update(canonical_url_for=canonical_url_for)
    app.jinja_env.globals.update(canonical_request_url=canonical_request_url)
    app.jinja_env.globals.update(page_attributes=Attribute.attribute_dict)
    app.jinja_env.globals.update(last_modified=LastModified.select)
    app.jinja_env.globals.update(tag_cloud_dict=Tag.tag_cloud)

    return app.jinja_env