Hey! This is my first post at my blog.

This blog will be used for exploring how I develop software applications, documenting my discoveries, and sharing them with interested parties.

You may be interested to know that the source-code for this post looks a little like this!

```
{% block body %}
    {{ post.body|markdown }}
{% endblock %}
```

That's a lot accomplished for three little lines. :)

This is real Python code:

```
import os
import datetime
import hashlib

import pytz
from flask import Markup, url_for

from hoyt.extensions import db
from lib.slugs import slugify
from lib.util_sqlalchemy import ResourceMixin, AwareDateTime


class Post(ResourceMixin, db.Model):
    __tablename__ = 'posts'    # plural lower-case
    id = db.Column(db.Integer, primary_key=True)

    # Relationships.
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'))

    # Details
    title = db.Column(db.String(128))
    comments_enabled = db.Column(db.Boolean, default=True)
    preview_paragraphs = db.Column(db.Integer, default=2)
    file_hash = db.Column(db.String(128))

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
        h.update(text.encode('utf-8',errors='ignore'))
        hash_sum = h.hexdigest()

        if hash_sum != self.file_hash:
            self.file_hash = hash_sum
            self.updated_on = datetime.datetime.now(pytz.utc)
            self.save()

        return text
```

Cheers, Michael.
