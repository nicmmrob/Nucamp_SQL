from flask import Blueprint, jsonify, abort, request
from sqlalchemy import null
from ..models import db, Customer


bp = Blueprint('customers', __name__, url_prefix='/customers')


# Reference:
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/
# https://docs.sqlalchemy.org/en/14/core/metadata.html#sqlalchemy.schema.Column
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/#many-to-many-relationships


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    customers = Customer.query.all()  # ORM performs SELECT query
    result = []
    for c in customers:
        result.append(c.serialize())  # build list of Customers as dictionaries
    return jsonify(result)  # return JSON response


# show requested customer by id
@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    c = Customer.query.get_or_404(id)
    return jsonify(c.serialize())


@bp.route('', methods=['POST'])
def add_customer():
    if 'first_name' not in request.json:
        return abort(400)
    if 'last_name' not in request.json:
        return abort(400)
    if 'email' not in request.json:
        return abort(400)
    if len(request.json['first_name']) < 3:
        return abort(400)
    if len(request.json['last_name']) < 2:
        return abort(400)
    if request.json['email'] is null:
        return abort(400)

    # add customer details
    c = Customer(
        first_name=request.json['first_name'],
        last_name=request.json['last_name'],
        email=request.json['email'],
        id=request.json['id']
    )

    db.session.add(c)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement

    return jsonify(c.serialize())


# delete customer by id
@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    c = Customer.query.get_or_404(id)
    try:
        db.session.delete(c)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)


@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def patch_or_put(id: int):
    c = Customer.query.get_or_404(id)
    if 'first_name' not in request.json and 'last_name' not in request.json:
        return abort(400)
    if 'first_name' in request.json and len(request.json['first_name']) >= 3:
        c.first_name = request.json['first_name']
    else:
        return abort(400)
    if 'last_name' in request.json and len(request.json['last_name']) >= 3:
        c.last_name = request.json['last_name']
    else:
        return abort(400)
    if 'email' in request.json:
        c.email = request.json['email']
    try:
        db.session.commit()
        return jsonify(c.serialize())
    except:
        return jsonify(False)
