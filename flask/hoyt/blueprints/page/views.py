from flask import Blueprint, render_template

page = Blueprint('pages', __name__, template_folder='templates')


@page.route('/')
def index():
    return render_template('page/index.jinja2')


@page.route('/policy/terms/')
def terms():
    return render_template('page/terms.jinja2')


@page.route('/policy/privacy/')
def privacy():
    return render_template('page/privacy.jinja2')
