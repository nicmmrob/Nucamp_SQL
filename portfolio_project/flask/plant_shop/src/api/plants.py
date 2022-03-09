from flask import Blueprint, jsonify, abort, request
from ..models import db, Plant

bp = Blueprint('plants', __name__, url_prefix='/plants')


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    plants = Plant.query.all()  # ORM performs SELECT query
    result = []
    for p in plants:
        result.append(p.serialize())  # build list of Plants as dictionaries
    return jsonify(result)  # return JSON response


# show requested plant by plant_id
@bp.route('/<int:plant_id>', methods=['GET'])
def show(plant_id: int):
    p = Plant.query.get_or_404(plant_id)
    return jsonify(p.serialize())


@bp.route('', methods=['POST'])
def add_plant():
    # req body must not contain scientific_name
    if 'scientific_name' not in request.json:
        return abort(400)
    if 'price' not in request.json:
        return abort(400)
    if len(request.json['scientific_name']) < 3:
        return abort(400)
    if request.json['price'] < 2:
        return abort(400)

    # add plant details
    p = Plant(
        scientific_name=request.json['scientific_name'],
        price=request.json['price'],
        plant_id=request.json['plant_id']
    )

    db.session.add(p)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement

    return jsonify(p.serialize())


# delete plant by plant_id
@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    p = Plant.query.get_or_404(id)
    try:
        db.session.delete(p)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)


@bp.route('/<int:plant_id>', methods=['PATCH', 'PUT'])
def update_price(plant_id: int):
    p = Plant.query.get_or_404(plant_id)
    if int(request.json['price']) >= 2:
        p.price = request.json['price']
    else:
        return abort(400)
    try:
        db.session.commit()
        return jsonify(p.serialize())
    except:
        return jsonify(False)
