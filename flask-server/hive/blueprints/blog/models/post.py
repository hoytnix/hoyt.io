from flask import url_for
from sqlalchemy import or_
from flask_admin.contrib.sqla import ModelView
from diff_match_patch import diff_match_patch

from .post_revision import PostRevision
from ..tables import tags

from hive.extensions import db
from lib.urls import slugify
from lib.util_sqlalchemy import ResourceMixin


class Post(ResourceMixin, db.Model):
    __tablename__ = 'posts'  # plural lower-case
    id = db.Column(db.Integer, primary_key=True)

    # Relationships.
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'))
    tags = db.relationship(
        'Tag', secondary=tags, backref='post', lazy='dynamic')
    revisions = db.relationship('PostRevision', backref='post', lazy='dynamic')

    # Details
    title = db.Column(db.String(128))
    comments_enabled = db.Column(db.Boolean, default=True)
    is_published = db.Column(db.Boolean, default=False)
    preview_paragraphs = db.Column(db.Integer, default=2)

    @property
    def body(self):
        dmp = diff_match_patch()
        revisions = PostRevision.query.filter_by(
            post_id=self.id).order_by(PostRevision.created_on.asc()).all()
        text = ''
        for revision in revisions:
            patches = dmp.patch_fromText(textline=revision.diff)
            text = dmp.patch_apply(patches, text)[0]
        return text

    @property
    def latest_revision(self):
        return PostRevision.query.filter_by(
            post_id=self.id).order_by(PostRevision.created_on.desc()).first()

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
        search_chain = (Post.title.ilike(search_query), )

        return or_(*search_chain)

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
    def preview_text(self):
        """Return so many paragraphs of the body, as specified by `preview_paragraphs`.

        Returns: str
        """

        text = self.body
        if not text or text == '':
            return ''

        # First try normal method
        methods = ['\n\n', '\r\n\r\n']
        method = None
        for _method in methods:
            method = _method
            paragraphs = text.split(method)
            if paragraphs.__len__() > 1:
                break

        return method.join(paragraphs[:self.preview_paragraphs])

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

    def __str__(self):
        return self.title
