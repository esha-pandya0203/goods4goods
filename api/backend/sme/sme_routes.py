from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

sme = Blueprint('sme', __name__)

# Get all personal information of given smeID
@sme.route('/<smeID>', methods=['GET'])
def get_sme_personal_info(smeID):
    query = f'''
        SELECT s.firstName AS first_name,
        s.lastName AS last_name,
        s.email AS email,
        s.street AS street,
        s.city AS city,
        s.state AS state,
        s.zipcode AS zipcode
        FROM SME s
        WHERE s.sme_id = '{smeID}'
        GROUP BY 
            s.sme_id;
    '''

    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200

    return response

# @sme.routes('/<smeID>/favItems', methods=['GET'])
# def get_sme_fav_items(smeID):
#     query = f'''
#         SELECT i.item_id, i.posted_by, 
#         FROM SME s
#             JOIN FavoriteItems fi ON s.sme_id = fi.sme_id
#             JOIN Item i ON i.item_id = fi.item_id
#         WHERE s.sme_id = '{smeID}'
#         GROUP BY 
#             s.sme_id;
#     '''
