from lib.imports import all_models

import click


@click.group()
def cli():
    """ """

@click.command()
@click.option('--blueprint', default=None)
def models(blueprint):
    print(all_models(blueprint=blueprint)

cli.add_command(models)
