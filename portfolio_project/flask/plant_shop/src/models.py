from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Reference:
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/
# https://docs.sqlalchemy.org/en/14/core/metadata.html#sqlalchemy.schema.Column
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/#many-to-many-relationships


class Plant(db.Model):
    __tablename__ = 'plants'
    plant_id = db.Column(db.Integer, primary_key=True)
    scientific_name = db.Column(db.String, nullable=False)
    price = db.Column(db.Integer, nullable=False)
    common_name = db.Column(db.String, nullable=True)
    care_guide = db.Column(db.String, nullable=True)

    def __init__(self, scientific_name: str, price: int, plant_id: int):
        self.scientific_name = scientific_name
        self.price = price
        self.plant_id = plant_id

    def serialize(self):
        return {
            'plant_id': self.plant_id,
            'scientific_name': self.scientific_name,
            'price': self.price,
            'common_name': self.common_name,
            'care_guide': self.care_guide
        }


class Customer(db.Model):
    __tablename__ = 'customers'
    id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.String, nullable=False)
    last_name = db.Column(db.String, nullable=False)
    email = db.Column(db.String, nullable=False)

    def __init__(self, id: int, first_name: str, last_name: str, email: str):
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.email = email

    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'email': self.email,
        }
