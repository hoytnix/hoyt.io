from flask import url_for    # url generation
from sqlalchemy import or_   # searching
from flask_admin.contrib.sqla import ModelView # custom admin views

from .post import Post

from hive.extensions import db
from lib.urls import slugify
from lib.util_sqlalchemy import ResourceMixin


class Tag(db.Model):
    #__tablename__ = 'tags'  # plural lower-case
    id = db.Column(db.Integer, primary_key=True)

    # Details
    title = db.Column(db.String(128), nullable=False)

    @classmethod
    def tag_cloud(cls):
        count = {}
        posts = Post.query.all()
        for post in posts:
            tags = post.tags
            for tag in tags:
                if tag not in count:
                    count[tag] = 1
                else:
                    count[tag] += 1

        return sorted(
            [{
                "tag": tag,
                "count": count[tag]
            } for tag in count],
            key=lambda k: k['tag'].title)

    @property
    def most_recent_posts(self):
        return Post.query.filter(Post.tags.any(Tag.title == self.title)) \
                        .filter_by(is_published=True) \
                        .order_by(Post.created_on.desc()).all()

    @property
    def href(self):
        return '<a href="{}">{}</a>'.format(self.url_for, self.title)

    @property
    def url_for(self):
        return url_for('blog.tag_detail', slug=self.slug)

    @property
    def slug(self):
        return slugify(self.title)

    def __str__(self):
        return self.title
