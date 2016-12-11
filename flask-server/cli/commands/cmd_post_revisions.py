import click

from sqlalchemy_utils import database_exists, create_database
from diff_match_patch import diff_match_patch

from hoyt.app import create_app
from hoyt.extensions import db
from hoyt.blueprints.blog import Post, PostRevision

# Create an app context for the database connection.
app = create_app()
db.app = app


@click.command()
def cli():
    """ Migrate old Posts to new PostRevisions. """
    dmp = diff_match_patch()

    posts = Post.query.all()
    for post in posts:
        patch = dmp.patch_make(a="", b=post.body)
        body_as_patch = dmp.patch_toText(patch)

        post_revision = PostRevision(
            post_id=post.id, diff=body_as_patch, created_on=post.created_on)

        db.session.add(post_revision)
    db.session.commit()
