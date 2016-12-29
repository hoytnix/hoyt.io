from flask import url_for    # url generation
from sqlalchemy import or_   # searching
from flask_admin.contrib.sqla import ModelView # custom admin views

from hive.extensions import db
from lib.urls import slugify
from lib.util_sqlalchemy import ResourceMixin


class PostRevision(ResourceMixin, db.Model):
    __tablename__ = 'post_revision'  # plural lower-case
    id = db.Column(db.Integer, primary_key=True)

    # Relationships.
    post_id = db.Column(db.Integer, db.ForeignKey('posts.id'))

    # Details
    diff = db.Column(db.Text, nullable=False)

    def __str__(self):
        return '{}: {}'.format(self.post_id, self.created_on)
