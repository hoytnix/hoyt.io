from subprocess import call

import click

from cli.tasks.app import freeze_app, minify_assets, deploy_app


@click.group()
def cli():
    """ Run PostgreSQL related tasks. """
    pass


@click.command()
@click.option('--environment', '-e', default=None)
def publish(environment):
    freeze_app(environment=environment)
    minify_assets()

@click.command()
@click.option('--environment', '-e', default=None)
def deploy(environment):
    deploy_app(environment=environment)


cli.add_command(publish)
cli.add_command(deploy)
