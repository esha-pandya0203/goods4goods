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
                        u1.user_id AS 'Offering Trader ID',
                        CONCAT(u2.firstName, " ", u2.lastName) AS 'Receiving Trader', 
                        u2.user_id AS 'Receiving Trader ID',
                        sc.status_name AS 'Status', 
                        i1.product_name AS 'Offered Item', 
                        i1.image_url AS 'Offered Item Image',
                        i2.product_name AS 'Requested Item',
                        i2.image_url AS 'Requested Item Image',
                        o.offer_id AS 'Offer ID',
                        o.item_offered_id AS 'Offered Item ID',
                        o.item_requested_id AS 'Requested Item ID'
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
@offers.route('/', methods=['POST'])
def propose_offer():

    the_data = request.json
    current_app.logger.info(the_data)

    offering_user = the_data['offering_user']
    receiving_user = the_data['receiving_user']
    item_offered_id = the_data['item_offered_id']
    item_requested_id = the_data['item_requested_id']

    cursor = db.get_db().cursor()

    query = '''INSERT INTO Offer (offering_user,
                            receiving_user,
                            status,
                            item_offered_id,
                            item_requested_id)
        VALUES (%s, %s, 1, %s, %s) '''
    
    cursor.execute('UPDATE Item SET active = 0 WHERE item_id = %s', (item_offered_id,))
    cursor.execute('UPDATE Item SET active = 0 WHERE item_id = %s', (item_requested_id,))
    
    cursor.execute(query, (offering_user, receiving_user, item_offered_id, item_requested_id))
    db.get_db().commit()
    
    response = make_response("Successfully created offer")
    response.status_code = 200
    return response

#------------------------------------------------------------
# Update offer status with offerID
# TO DO: change boolean active based on status
@offers.route('/status', methods=['PUT'])
def deactivate_item():
    current_app.logger.info('PUT /update-status route')

    offer_info = request.json
    offer_id = offer_info['offer_id']
    status = offer_info['status']
    item_offered_id = offer_info['offered_item']
    item_requested_id = offer_info['requested_item']
    
    cursor = db.get_db().cursor()

    # Change active status of items based on offer status
    if status == "Accepted" or status == "Pending":
         cursor.execute('UPDATE Item SET active = 0 WHERE item_id = %s', (item_offered_id,))
         cursor.execute('UPDATE Item SET active = 0 WHERE item_id = %s', (item_requested_id,))
    elif status == "Rejected":
        cursor.execute('UPDATE Item SET active = 1 WHERE item_id = %s', (item_offered_id,))
        cursor.execute('UPDATE Item SET active = 1 WHERE item_id = %s', (item_requested_id,))
    
    # Get status_code_id from status name
    cursor.execute('SELECT status_code_id FROM StatusCodes WHERE status_name = %s', (status,))
    result = cursor.fetchone()
    status_code_id = result['status_code_id']

    # Update offer's status
    cursor.execute('UPDATE Offer SET status = %s WHERE offer_id = %s', (status_code_id, offer_id))
    db.get_db().commit()

    response = make_response("Successfully updated offer status")
    response.status_code = 200
    return response
