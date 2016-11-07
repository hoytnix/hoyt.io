from flask import Blueprint, render_template

dashboard = Blueprint(
    'dashboard',
    __name__,
    template_folder='templates',
    url_prefix='/dashboard')


@dashboard.route('/')
def index():
    """Display the ten most-recent posts."""
    return render_template('dashboard/index.jinja2')
