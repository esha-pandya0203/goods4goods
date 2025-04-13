########################################################
# Admin blueprint of endpoints
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from backend.ml_models.model01 import predict

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
admins = Blueprint('admins', __name__)


# As a system administrator, I need to be able to see items flagged by users or an algorithm to review and decide if they should be taken down. 
# - GET all UserReports
@admins.route('/userReport', methods = ['GET'])
def get_UserReports():
    cursor = db.get_db().cursor()
    the_query = '''
    SELECT * 
    FROM `UserReport`
    '''

    cursor.execute(the_query)
    theData = cursor.fetchall()
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'

    return the_response

@admins.route('/adminReport', methods = ['GET'])
def get_AdminReports():
    cursor = db.get_db().cursor()
    the_query = '''
    SELECT * 
    FROM `AdminReport`
    '''

    cursor.execute(the_query)
    theData = cursor.fetchall()
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'

    return the_response

# Get UserReports based on reportCode
@admins.route('/reportCode/<reportCode>', methods = ['GET'])
def getReportsByCode(reportCode):
    current_app.logger.info('GET /reportCode/<reportCode> route')
    cursor = db.get_db().cursor()
    cursor.execute('SELECT report_id, report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id, createdDate FROM UserReport WHERE report_code = {0}'.format(reportCode))

    theData = cursor.fetchall()

    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

# As a system administrator, I need to be able to remove/hide content so that any inappropriate or fake listings are not shown to users. 
# - DELETE Item
@admins.route('/adminItems/<item_id>', methods = ['DELETE'])
def deleteItems(item_id):
    current_app.logger.info('DELETE /adminItems/<item_id> route')
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM Item WHERE item_id = {0}'.format(item_id))


    db.get_db().commit()
    
    return ('Item Deleted.')

# As a system administrator I need to be able to create reports so that I can also help in reporting issues in the app.
#- POST AdminReport
@admins.route('/adminReport', methods = ['POST'])
def postReport():
    the_data = request.json
    current_app.logger.info(the_data)

    code = the_data['report_code']
    description = the_data['description']
    status =the_data['status']
    reporter_id = the_data['reporter_id']
    reported_id = the_data['reported_id']
    offer_id = the_data['offer_id']

    query = f'''
        INSERT INTO AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) 
        VALUES('{code}', '{description}', '{status}', {reporter_id}, {reported_id},{offer_id})
'''
    
    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Report Added.")
    response.status_code = 200
    return response

# # As a system administrator I need to be able to delete user biographies or change user biographies if they’re inappropriate in order to not allow users to have anything that violates the app’s rules in their biography.
# #- Remove USER bio - PUT Bio = NULL
# @admins.route('/UserBio/<user_id>', methods = ['PUT'])
# def deleteBio(user_id):
#     current_app.logger.info('PUT /UserBio/<user_id> route')
#     user_info = request.json
#     bio = user_info['bio']

#     query = 'UPDATE User SET bio = NULL WHERE user_id = {0}'.format(user_id)
#     cursor = db.get_db().cursor()
#     cursor.execute(query)
#     db.get_db().commit()

#     return 'User bio deleted.'


# Update a UserReport status - accepted/rejected?
@admins.route('/userReport', methods = ['PUT'])
def updateStatus():
    current_app.logger.info('PUT /userReport route')
    status_info = request.json
    report_id = status_info['report_id']
    status = status_info['status']

    current_app.logger.info(f'Updating report_id {report_id} to status {status}')
    query = 'UPDATE UserReport SET status = %s WHERE report_id = %s'
    data = (status,report_id)
    cursor = db.get_db().cursor()
    cursor.execute(query, data)
    db.get_db().commit()
    return 'Status Updated!'

# Delete a UserReport
@admins.route('/userReport/<report_id>', methods = ['DELETE'])
def deleteReports(report_id):
    current_app.logger.info('DELETE /userReport/<report_id> route')
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM UserReport WHERE report_id = {0}'.format(report_id))

    db.get_db().commit()


    return 'Report deleted.'