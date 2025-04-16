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

# Check if user has already rated the transaction
@ratings.route('/<offerId>/<ratedBy>', methods=['GET'])
def check_user_rating(offerId, ratedBy):
    cursor = db.get_db().cursor()

    cursor.execute('''SELECT rating_number FROM Rating 
                      WHERE offer_id = %s AND rated_by = %s''', (offerId, ratedBy))
    
    result = cursor.fetchone()

    if result:
        return make_response({"rating_number": result["rating_number"]}, 200)
    else:
        return make_response({"rating_number": None}, 200)


#------------------------------------------------------------
# Rate a user
@ratings.route('/', methods=['POST'])
def rate_user():
    current_app.logger.info('POST /ratings/rate route')
    cursor = db.get_db().cursor()
    
    # Get the data from the request
    data = request.get_json()
    
    # Extract the data
    rating_for = data['rating_for']
    rating_by = data['rating_by']
    rating_number = data['rating_number']
    offer_id = data['offer_id']
    
    # Insert the rating into the database
    cursor.execute(f''' 
    INSERT INTO Rating (rating_number, rated_by, rating_for, offer_id)
    VALUES ({rating_number}, {rating_by}, {rating_for}, {offer_id}); 
    ''')
    
    db.get_db().commit()
    
    response = make_response("Successfully added rating")
    response.status_code = 200
    return response

