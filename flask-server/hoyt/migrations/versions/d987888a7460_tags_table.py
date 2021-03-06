"""'d987888a7460' - Tags table."""

import sqlalchemy as sa

from alembic import op

#from lib.util_datetime import tzware_datetime
#from lib.util_sqlalchemy import AwareDateTime
"""
Tags table

Revision ID: d987888a7460
Revises: 216ce379d3f0
Create Date: 2016-11-01 14:13:28.216736
"""

# Revision identifiers, used by Alembic.
revision = 'd987888a7460'
down_revision = '216ce379d3f0'
branch_labels = None
depends_on = None


def upgrade():
    """Command to migrate database forward."""

    ### commands auto generated by Alembic - please adjust! ###
    op.create_table(
        'tag',
        sa.Column(
            'id', sa.Integer(), nullable=False),
        sa.Column(
            'title', sa.String(length=128), nullable=False),
        sa.PrimaryKeyConstraint('id'))
    op.add_column('tags', sa.Column('tag_id', sa.Integer(), nullable=True))
    op.create_foreign_key(None, 'tags', 'tag', ['tag_id'], ['id'])
    op.drop_column('tags', 'title')
    op.drop_column('tags', 'id')
    ### end Alembic commands ###


def downgrade():
    """Command to migrate database backwards."""

    ### commands auto generated by Alembic - please adjust! ###
    op.add_column('tags', sa.Column('id', sa.INTEGER(), nullable=False))
    op.add_column(
        'tags',
        sa.Column(
            'title',
            sa.VARCHAR(length=128),
            autoincrement=False,
            nullable=False))
    op.drop_constraint(None, 'tags', type_='foreignkey')
    op.drop_column('tags', 'tag_id')
    op.drop_table('tag')
    ### end Alembic commands ###
