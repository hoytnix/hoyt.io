from flask import Blueprint, render_template, abort, url_for, request

from .models import Post, Category

blog = Blueprint('blog', __name__, template_folder='templates', url_prefix='/blog')


@blog.route('/')
def index():
    o = {
        'categories': Category.query.all(),
        'posts': Post.query.order_by(Post.updated_on.desc()).limit(10)
    }
    return render_template('blog/index.jinja2', **o)


@blog.route('/<slug>/')
def category_detail(slug):
    result = None

    categories = Category.query.all()
    for category in categories:
        if category.slug == slug:
            result = category
            break

    if not result:
        abort(404)

    return render_template('blog/category_detail.jinja2', category=result)


@blog.route('/<category_slug>/<post_slug>/')
def post_detail(category_slug, post_slug):
    result = None

    posts = Post.query.all()
    for post in posts:
        if post.slug == post_slug:
            result = post
            break

    if not result:
        abort(404)

    return render_template('blog/post_detail.jinja2', post=result)
