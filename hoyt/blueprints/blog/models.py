import os

from flask import Markup, url_for

from hoyt.extensions import db
from lib.slugs import slugify


class Post(db.Model):
    __tablename__ = 'posts'    # plural lower-case
    id = db.Column(db.Integer, primary_key=True)

    # Relationships.
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'))

    # Details
    title = db.Column(db.String(128), nullable=False)

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
            return text

    @property
    def preview_text(self):
        text = self.body
        if text == '':
            return text
        paragraphs = text.split('\n\n')
        return paragraphs[0]

    @property
    def category(self):
        return Category.query.get(self.category_id)

    @property
    def href(self):
        return '<a href="{}">{}</a>'.format(
            url_for('blog.post_detail', category_slug=self.category.slug, post_slug=self.slug),
            self
        )

    @property
    def slug(self):
        return slugify(self.title)

    def __repr__(self):
        return self.title


class Category(db.Model):
    __tablename__ = 'categories'    # plural lower-case
    id = db.Column(db.Integer, primary_key=True)

    # Relationships.
    posts = db.relationship('Post', backref='category', lazy='dynamic')

    # Details
    title = db.Column(db.String(128), nullable=False)

    @property
    def href(self):
        return '<a href="{}">{}</a>'.format(
            url_for('blog.category_detail', slug=self.slug),
            self
        )

    @property
    def slug(self):
        return slugify(self.title)

    def __repr__(self):
        return self.title
