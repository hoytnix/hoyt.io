import sqlalchemy as sa

from alembic import op

#from lib.util_datetime import tzware_datetime
#from lib.util_sqlalchemy import AwareDateTime


"""
posts may or may not published

Revision ID: 05546c22ac6e
Revises: af9f94db37ba
Create Date: 2016-10-24 21:55:26.792176
"""

# Revision identifiers, used by Alembic.
revision = '05546c22ac6e'
down_revision = 'af9f94db37ba'
branch_labels = None
depends_on = None


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.add_column('posts', sa.Column('is_published', sa.Boolean(), nullable=True))
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('posts', 'is_published')
    ### end Alembic commands ###
