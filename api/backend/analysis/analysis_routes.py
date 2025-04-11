########################################################
# reports blueprint of endpoints 
########################################################

from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from datetime import datetime 
from dateutil.relativedelta import relativedelta 

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
analysis = Blueprint('analysis', __name__)

#------------------------------------------------------------
# Get all report information 
@analysis.route('/analysis', methods=['GET'])
def get_all_reports(): 
    query = '''
    SELECT a.start_date, a.end_date, a.written_analysis, da.firstName, da.lastName
    FROM Analysis AS a
    JOIN Analyst AS da ON a.analyst_id = da.analyst_id
    ORDER BY a.end_date DESC;
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200

    return response
#------------------------------------------------------------
# This is a POST route to add a new product.
# Remember, we are using POST routes to create new entries
# in the database. 
@analysis.route('/analysis', methods=['POST'])
def add_new_product():
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    written_analysis = the_data['written_analysis']
    end_date_str = the_data['end_date']
    analyst_id = the_data['analyst_id']
    
    end_date = datetime.strptime(end_date_str, "%Y-%m-%d %H:%M:%S")
    start_date = end_date - relativedelta(months=1) 
    
    start_date_str = start_date.strftime("%Y-%m-%d %H:%M:%S")
    end_date_str = end_date.strftime("%Y-%m-%d %H:%M:%S")
    
    query = f'''
        INSERT INTO Analysis (start_date,
                              end_date,
                              written_analysis, 
                              analyst_id)
        VALUES ('{start_date_str}', '{end_date_str}', '{written_analysis}', {analyst_id})
    '''

    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully added analysis")
    response.status_code = 200
    return response