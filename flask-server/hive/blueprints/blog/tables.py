from hive.extensions import db

# Many-to-many relationships.
tags = db.Table('tags',
                db.Column('tag_id', db.Integer, db.ForeignKey('tag.id')),
                db.Column('post_id', db.Integer, db.ForeignKey('posts.id')))
