"""create customers

Revision ID: 4027ef28e916
Revises: 
Create Date: 2022-03-02 22:38:52.189271

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '4027ef28e916'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        CREATE TABLE customers(
            id SERIAL PRIMARY KEY,
            name TEXT NOT NULL
        );
        """
    )


def downgrade():
    op.execute(
        """
        DROP TABLE customers;
        """
    )
