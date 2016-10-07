from subprocess import call

from flask_frozen import Freezer

from hoyt.app import create_app


def freeze_app(environment=None):
    app = create_app(environment=environment)
    freezer = Freezer(app)
    freezer.freeze()

def minify_assets():
    call('grunt', shell=True)

def deploy_app(environment=None):
    _cmd = ''
    if environment == 'staging':
        _cmd = 'firebase use staging && '
    call('{}firebase deploy'.format(_cmd), shell=True)
