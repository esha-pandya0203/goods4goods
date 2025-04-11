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
reports = Blueprint('reports', __name__)

#------------------------------------------------------------
# Allow a user to report another user
@reports.route('/user', methods = ['POST'])
def postReport():
    the_data = request.json
    current_app.logger.info(the_data)

    code = the_data['report_code']
    description = the_data['description']
    reporter_id = the_data['reporter_id']
    reported_id = the_data['reported_id']
    offer_id = the_data['offer_id']

    query = f'''
        INSERT INTO UserReport (report_code, description, reporter_id, reported_id, offer_id) 
        VALUES('{code}', '{description}', {reporter_id}, {reported_id}, {offer_id})
    '''
    
    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)   
    db.get_db().commit()
    
    response = make_response("Report Added.")
    response.status_code = 200
    return response

@reports.route('/codes', methods = ['GET'])
def getCodes():
    current_app.logger.info('GET reports/codes route')
    cursor = db.get_db().cursor()
    cursor.execute(f''' SELECT *
                        FROM ErrorCodes; ''')
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response