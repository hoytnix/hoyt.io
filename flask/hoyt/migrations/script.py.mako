"""${repr(up_revision)} - ${message}"""

import sqlalchemy as sa

from alembic import op

#from lib.util_datetime import tzware_datetime
#from lib.util_sqlalchemy import AwareDateTime
${imports if imports else ""}

"""
${message}

Revision ID: ${up_revision}
Revises: ${down_revision | comma,n}
Create Date: ${create_date}
"""

# Revision identifiers, used by Alembic.
revision = ${repr(up_revision)}
down_revision = ${repr(down_revision)}
branch_labels = ${repr(branch_labels)}
depends_on = ${repr(depends_on)}


def upgrade():
    """Command to migrate database forward."""

    ${upgrades if upgrades else "pass"}


def downgrade():
    """Command to migrate database backwards."""

    ${downgrades if downgrades else "pass"}
