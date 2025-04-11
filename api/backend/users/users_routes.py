########################################################
# Sample customers blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################

from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
users = Blueprint('users', __name__)

#------------------------------------------------------------
# Get all user information
@users.route('/<userId>', methods=['GET'])
def get_user_profile_info(userId):
    query = f'''
        SELECT 
        u.firstName AS first_name,
        u.lastName AS last_name,
        u.bio AS user_bio,
        u.user_id AS user_id,
        u.email AS email,
        COUNT(DISTINCT o.offer_id) AS successful_trades,
        COUNT(DISTINCT ar.report_id) + COUNT(DISTINCT ur.report_id) AS total_reports,
        AVG(r.rating_number) AS star_rating,
        u.createdDate AS user_joined_date
        FROM 
            User u
        LEFT JOIN 
            Offer o ON ((u.user_id = o.offering_user OR u.user_id = o.receiving_user) AND o.status = 2)
        LEFT JOIN 
            AdminReport ar ON u.user_id = ar.reported_id
        LEFT JOIN 
            UserReport ur ON u.user_id = ur.reported_id
        LEFT JOIN 
            Rating r ON u.user_id = r.rating_for
        WHERE u.user_id = '{userId}'
        GROUP BY 
            u.user_id;'''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200

    return response

#------------------------------------------------------------
# Update the user bio
@users.route('/<userId>', methods=['PUT'])
def update_customer(userId):
    current_app.logger.info('PUT /customers route')
    item_info = request.json
    user_bio= item_info['user_bio']

    query = 'UPDATE User SET bio = %s where user_id = %s'
    data = (user_bio, userId)
    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'User bio updated!'