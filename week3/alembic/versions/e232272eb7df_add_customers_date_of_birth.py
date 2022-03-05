"""add customers date_of_birth

Revision ID: e232272eb7df
Revises: 4027ef28e916
Create Date: 2022-03-02 22:45:19.698827

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'e232272eb7df'
down_revision = '4027ef28e916'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        ALTER TABLE customers
        ADD COLUMN date_of_birth TIMESTAMP;
        """
    )


def downgrade():
    op.execute(
        """
        ALTER TABLE customers
        DROP COLUMN date_of_birth;
        """
    )
