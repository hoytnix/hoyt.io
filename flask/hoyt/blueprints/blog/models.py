import os
import datetime
import hashlib

import pytz
from flask import url_for

from hoyt.extensions import db
from lib.slugs import slugify
from lib.util_sqlalchemy import ResourceMixin


class Post(ResourceMixin, db.Model):
    __tablename__ = 'posts'  # plural lower-case
    id = db.Column(db.Integer, primary_key=True)

    # Relationships.
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'))

    # Details
    title = db.Column(db.String(128))
    comments_enabled = db.Column(db.Boolean, default=True)
    is_published = db.Column(db.Boolean, default=False)
    preview_paragraphs = db.Column(db.Integer, default=2)
    file_hash = db.Column(db.String(128))

    @property
    def next_post(self):
        minimum = self.id
        current = None

        posts = Post.query.all()
        for post in posts:
            if not post.id > minimum:
                continue
            if not current:
                current = post
                continue
            if post.id < current.id:
                current = post
        return current

    @property
    def previous_post(self):
        maximum = self.id
        current = None

        posts = Post.query.all()
        for post in posts:
            if not post.id < maximum:
                continue
            if not current:
                current = post
                continue
            if post.id > current.id:
                current = post
        return current

    @property
    def body(self):
        cd = os.path.dirname(os.path.abspath(__file__))
        posts_dir = os.path.join(cd, 'posts')

        file_name = '{}-{}.md'.format(self.id, self.slug)
        fp = os.path.join(posts_dir, file_name)

        if not os.path.exists(fp):
            with open(fp, 'w+') as stream:
                pass
            return ''
        else:
            with open(fp, 'r') as stream:
                text = stream.read()

        h = hashlib.new('sha512')
        h.update(text.encode('utf-8', errors='ignore'))
        hash_sum = h.hexdigest()

        if hash_sum != self.file_hash:
            self.file_hash = hash_sum
            self.updated_on = datetime.datetime.now(pytz.utc)
            self.save()

        return text

    @property
    def preview_text(self):
        text = self.body
        if text == '':
            return text
        paragraphs = text.split('\n\n')
        return '\n\n'.join(paragraphs[:self.preview_paragraphs])

    @property
    def category(self):
        return Category.query.get(self.category_id)

    @property
    def href(self):
        return '<a href="{}">{}</a>'.format(self.url_for, self.title)

    @property
    def url_for(self):
        return url_for(
            'blog.post_detail',
            category_slug=self.category.slug,
            post_slug=self.slug)

    @property
    def slug(self):
        return slugify(self.title)


class Category(db.Model):
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
                        .order_by(Post.updated_on.desc()).all()

    @property
    def href(self):
        return '<a href="{}">{}</a>'.format(self.url_for, self.title)

    @property
    def url_for(self):
        return url_for('blog.category_detail', slug=self.slug)

    @property
    def slug(self):
        return slugify(self.title)

    def __repr__(self):
        return self.title
