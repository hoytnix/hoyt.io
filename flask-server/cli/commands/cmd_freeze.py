import click

from hive.extensions import Freezer
from hive.app import create_app


@click.command()
@click.option('--environment', '-e', default=None)
def cli(environment):
    """ Run PostgreSQL related tasks. """
    app = create_app(environment=environment)
    freezer = Freezer(app)
    freezer.freeze()
