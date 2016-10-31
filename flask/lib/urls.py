from flask_frozen import Freezer

from hoyt.app import create_app


def all_urls():
    app = create_app()
    freezer = Freezer(app, with_static_files=False)
    return [url for url, _ in freezer._generate_all_urls()]
