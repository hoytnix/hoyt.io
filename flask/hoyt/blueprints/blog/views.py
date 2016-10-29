from flask import Blueprint, render_template, abort

from .models import Post, Category

blog = Blueprint(
    'blog', __name__, template_folder='templates', url_prefix='/blog')


@blog.route('/')
def index():
    """Display the ten most-recent posts."""

    categories = Category.query.all()
    posts = Post.query.filter_by(is_published=True) \
                    .order_by(Post.updated_on.desc()).limit(10)
    return render_template(
        'blog/index.jinja2', categories=categories, posts=posts)


@blog.route('/<slug>/')
def category_detail(slug):
    """Display everything related to the category.

    Args:
        slug (str): key to search for category.
    """

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
    """Display a single post.

    Args:
        category_slug (str): not required logically, but used for sanity checking.
        post_slug (str): key to search for post.
    """

    result = None

    posts = Post.query.all()
    for post in posts:
        if post.slug == post_slug:
            result = post
            break

    if not result:
        abort(404)

    # Although this _shouldn't_ do anything, it's here for my sanity. :)
    if result.category.slug != category_slug:
        abort(404)

    return render_template('blog/post_detail.jinja2', post=result)
