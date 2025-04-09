 ########################################################
# Offer blueprint of endpoints
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a offers Blueprint object.
ratings = Blueprint('ratings', __name__)

#------------------------------------------------------------
# Get all ratings for a user with particular userID
@ratings.route('/<userId>', methods=['GET'])
def get_user_ratings(userID):
    current_app.logger.info('GET /ratings/<userID> route')
    cursor = db.get_db().cursor()
    cursor.execute(f''' SELECT AVG(r.rating_number) AS 'Average Rating'
                        FROM User u
                            JOIN Rating r ON r.rating_for = u.user_id
                        WHERE u.user_id = {userID}; ''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

#------------------------------------------------------------
# Rate a user

