from flask import url_for    # url generation
from sqlalchemy import or_   # searching
from flask_admin.contrib.sqla import ModelView # custom admin views

from hive.extensions import db
from lib.urls import slugify
from lib.util_sqlalchemy import ResourceMixin


class Category(ResourceMixin, db.Model):
    __tablename__ = 'categories'  # plural lower-case
    id = db.Column(db.Integer, primary_key=True)

    # Relationships.
    posts = db.relationship('Post', backref='category', lazy='dynamic')

    # Details
    title = db.Column(db.String(128), nullable=False)

    @property
    def most_recent_posts(self):
        return Post.query.filter_by(category_id=self.id) \
                        .filter_by(is_published=True) \
                        .order_by(Post.created_on.desc()).all()

    @property
    def href(self):
        return '<a href="{}">{}</a>'.format(self.url_for, self.title)

    @property
    def url_for(self):
        return url_for('blog.category_detail', slug=self.slug)

    @property
    def slug(self):
        return slugify(self.title)

    @classmethod
    def search(cls, query):
        """
        Search a resource by 1 or more fields.

        :param query: Search query
        :type query: str
        :return: SQLAlchemy filter
        """
        if not query:
            return ''

        search_query = '%{0}%'.format(query)
        search_chain = (cls.title.ilike(search_query), )

        return or_(*search_chain)

    def __str__(self):
        return self.title
