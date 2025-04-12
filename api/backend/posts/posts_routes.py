from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
posts = Blueprint('posts', __name__)

# Get all of the posts made so far
@posts.route('/', methods=['GET'])
def get_posts():
    query = '''SELECT post_id, post_title, description, 
                `show`, posted_by, createdDate FROM Posts;
    '''

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute(query)

    # fetch all the data from the cursor
    # The cursor will return the data as a 
    # Python Dictionary
    theData = cursor.fetchall()

    # Create a HTTP Response object and add results of the query to it
    # after "jasonify"-ing it.
    response = make_response(jsonify(theData))
    # set the proper HTTP Status code of 200 (meaning all good)
    response.status_code = 200
    # send the response back to the client
    return response


@posts.route('/', methods=['POST'])
def add_new_post():
    # In a POST request, there is a 
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    post_title = the_data['post_title']
    description = the_data['description']
    show = the_data['show']
    posted_by = the_data['posted_by']
    
    query = f'''
        INSERT INTO Posts (post_title, description, `show`, posted_by)
        VALUES ('{post_title}', '{description}', {show}, {posted_by});
    '''
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully added product")
    response.status_code = 200
    return response

#------------------------------------------------------------
# Delete post with particular postID
@posts.route('/<postID>', methods=['DELETE'])
def delete_post(postID):
    current_app.logger.info('DELETE /posts route')
    query = f'DELETE FROM Posts WHERE post_id = {postID};'

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    response = make_response("Successfully deleted post")
    response.status_code = 200
    return response
