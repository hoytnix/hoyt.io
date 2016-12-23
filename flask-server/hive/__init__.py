"""Package for Hoyt."""

__project__ = 'Hive'
__version__ = '0.0.2'

VERSION = "{0} v{1}".format(__project__, __version__)

# pylint: disable=wrong-import-position
from . import blueprints
