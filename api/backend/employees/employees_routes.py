########################################################
# Sample employees blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################

from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from backend.ml_models.model01 import predict

employees = Blueprint('employees', __name__) 

@employees.route('/employees', methods=['GET']) 
def get_all_employees(): 
    cursor = db.get_db().cursor()
    cursor.execute('''
                   SELECT id, last_name, first_name, email_address, job_title
                   FROM employees;
                   ''')
    
    theData = cursor.fetchall() 
    
    the_response = make_response(jsonify(theData)) 
    the_response.status_code = 200 
    the_response.mimetype = 'application/json' 
    return the_response 

