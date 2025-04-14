########################################################
# Items blueprint of endpoints
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create an items Blueprint object.
items = Blueprint('items', __name__)

#------------------------------------------------------------
# Get all active items from the system
@items.route('/', methods=['GET'])
def get_items():
    current_app.logger.info('GET /items route')
    cursor = db.get_db().cursor()
    cursor.execute('''SELECT * FROM Item 
                    JOIN User ON Item.posted_by = User.user_id
                    WHERE active = 1''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

#------------------------------------------------------------
# Get all active items from the system a user can make offers for
@items.route('/listings/<userId>', methods=['GET'])
def get_listing_items(userId):
    current_app.logger.info('GET /items route')
    cursor = db.get_db().cursor()
    cursor.execute('''SELECT * FROM Item 
                    JOIN User ON Item.posted_by = User.user_id
                    WHERE active = 1 AND Item.posted_by != {0}'''.format(userId))
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

#------------------------------------------------------------
# Get all active items for a user with particular userID
@items.route('/<userId>', methods=['GET'])
def get_user_items(userId):
    current_app.logger.info('GET /items/<userID> route')
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Item WHERE posted_by = {0} AND active = 1'.format(userId))
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

# ------------------------------------------------------------
# Add a new item to the system
@items.route('/', methods=['POST'])
def add_new_item():
    current_app.logger.info('POST /items route')
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    posted_by = the_data['posted_by']
    description = the_data['description']
    product_name = the_data['product_name']
    image_url = the_data['image_url']
    target_price = the_data['target_price']
    
    query = f'''
        INSERT INTO Item (posted_by,
                            description,
                            product_name,
                            image_url,
                            target_price)
        VALUES ('{posted_by}', '{description}', '{product_name}', '{image_url}', {str(target_price)})
    '''

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully added product")
    response.status_code = 200
    return response

#------------------------------------------------------------
# Deactivate item with particular itemID
@items.route('/<itemId>', methods=['DELETE'])
def deactivate_item(itemId):
    current_app.logger.info('DELETE /items route')
    cursor = db.get_db().cursor()

    cursor.execute('DELETE FROM Item WHERE item_id = {0}'.format(itemId))
    db.get_db().commit()
    
    response = make_response("Successfully removed product")
    response.status_code = 200
    return response

#------------------------------------------------------------
# Update item into for an item with particular itemID
@items.route('/<itemId>', methods=['PUT'])
def update_customer(itemId):
    current_app.logger.info('PUT /customers route')
    item_info = request.json
    description = item_info['description']
    product_name = item_info['product_name']
    image_url = item_info['image_url']
    target_price = item_info['target_price']

    query = 'UPDATE Item SET description = %s, product_name = %s, image_url = %s, target_price = %s  where item_id = %s'
    data = (description, product_name, image_url, target_price, itemId)
    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'item updated!'