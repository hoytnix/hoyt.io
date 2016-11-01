from flask_frozen import Freezer

from flask import url_for

from hoyt.app import create_app
from hoyt.settings import settings


def all_urls():
    app = create_app()
    freezer = Freezer(app, with_static_files=False)
    return [url for url, _ in freezer._generate_all_urls()]


def canonical_url_for(endpoint, **values):
    canonical_url = settings()['CANONICAL_URL']
    return canonical_url + url_for(endpoint, **values)
