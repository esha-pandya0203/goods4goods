########################################################
# Offer blueprint of endpoints
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from backend.ml_models.model01 import predict

#------------------------------------------------------------
# Create a offers Blueprint object.
offers = Blueprint('offers', __name__)

#------------------------------------------------------------
# Get all offers for a user with particular userID
@offers.route('/<userId>', methods=['GET'])
def get_user_offers(userId):
    current_app.logger.info('GET /items/<userID> route')
    cursor = db.get_db().cursor()
    cursor.execute(f''' SELECT CONCAT(u1.firstName, " ", u1.lastName) AS 'Offering Trader', 
                        CONCAT(u2.firstName, " ", u2.lastName) AS 'Receiving Trader', 
                        sc.status_name AS 'Status', 
                        i1.product_name AS 'Offered Item', 
                        i2.product_name AS 'Requested Item'
                        FROM Offer o
                            JOIN User u1 ON o.offering_user = u1.user_id
                            JOIN User u2 ON o.receiving_user = u2.user_id
                            JOIN StatusCodes sc ON sc.status_code_id = o.status
                            JOIN Item i1 ON o.item_offered_id = i1.item_id
                            JOIN Item i2 ON o.item_requested_id = i2.item_id
                        WHERE (u1.user_id = {userId} OR u2.user_id = {userId});''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

#------------------------------------------------------------
# Get fairness for particular offer using offerID
@offers.route('/fairness/<offerID>', methods=['GET'])
def get_offer_fairness(offerID):
    current_app.logger.info('GET /fairness/<offerID> route')
    cursor = db.get_db().cursor()
    cursor.execute(f''' SELECT i1.product_name AS 'Offered Item', i1.target_price AS `Offered Item's Target Price`, 
                        i2.product_name AS 'Requested Item', i2.target_price AS `Requested Item's Target Price`, 
                        CONCAT(((LEAST(i1.target_price, i2.target_price) / GREATEST(i1.target_price, i2.target_price)) * 100), '%') AS 'Fairness Score'
                        FROM Offer o
                            JOIN Item i1 ON o.item_offered_id = i1.item_id
                        JOIN Item i2 ON o.item_requested_id = i2.item_id
                        WHERE o.offer_id = {offerID};''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

# ------------------------------------------------------------
# This is a POST route to make a new offer.
@offers.route('/propose', methods=['POST'])
def propose_offer():
    
    the_data = request.json
    current_app.logger.info(the_data)

    offering_user = the_data['offering_user']
    receiving_user = the_data['receiving_user']
    status = the_data['status']
    item_offered_id = the_data['item_offered_id']
    item_requested_id = the_data['item_requested_id']
    query = f'''
        INSERT INTO Offer (offering_user,
                            receiving_user,
                            status,
                            item_offered_id,
                            item_requested_id)
        VALUES ('{offering_user}', '{receiving_user}', '{status}', {str(item_offered_id)}, {str(item_requested_id)})
    '''
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully created offer")
    response.status_code = 200
    return response

#------------------------------------------------------------
# Update offer status with offerID
# TO DO: change boolean active based on status
@offers.route('/update-status', methods=['PUT'])
def deactivate_item():
    current_app.logger.info('PUT /deactivate route')
    offer_info = request.json
    offer_id = offer_info['offer_id']
    status = offer_info['status']

    query = 'UPDATE item SET status = %s where id = %s'
    data = (status, offer_id)
    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'offer status updated!'