from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
# Routes
#------------------------------------------------------------
#   URL             |  Method  | Purpose                            |
#------------------------------------------------------------
#   /               |   GET    |  Get all posts
#   /               |   POST   |  Create a new post
#   /<postID>       |   GET    |  Get a particular post
#   /<postID>       |   PUT    |  Edit a particular post
#   /show/<postID>  |   PUT    |  Change show/hide of a post
#   /<postID>       |   DELETE |  Delete a particular post
#------------------------------------------------------------
posts = Blueprint('posts', __name__)

#------------------------------------------------------------
# Get all of the posts made so far sorted by latest created date first
@posts.route('/', methods=['GET'])
def get_posts():
    query = '''SELECT p.post_id AS 'post_id', p.post_title AS 'post_title', p.description AS 'description', 
                p.full_post AS 'full_post', p.`show` AS 'show', CONCAT(s.firstName, " ", s.lastName) AS 'createdBy', p.createdDate AS 'createdDate' 
                FROM Posts p
                    JOIN SME s ON s.sme_id = p.posted_by
                ORDER BY createdDate DESC;
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

#------------------------------------------------------------
# Create a new post
@posts.route('/', methods=['POST'])
def add_new_post():
    # In a POST request, there is a 
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    post_title = the_data['post_title']
    description = the_data['description']
    full_post = the_data['full_post']
    show = the_data['show']
    posted_by = the_data['posted_by']
    
    query = f'''
        INSERT INTO Posts (post_title, description, full_post, `show`, posted_by)
        VALUES ('{post_title}', '{description}', '{full_post}', {show}, {posted_by});
    '''
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    response = make_response("Successfully added post")
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get post content of a particular postID
@posts.route('/<postID>', methods=['GET'])
def get_post(postID):
    query = f'''SELECT p.post_id AS 'post_id', p.post_title AS 'post_title', p.description AS 'description', 
                p.full_post AS 'full_post', p.`show` AS 'show', CONCAT(s.firstName, " ", s.lastName) AS 'createdBy', p.createdDate AS 'createdDate'
                FROM Posts p
                    JOIN SME s ON s.sme_id = p.posted_by
                WHERE post_id = {postID};
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# # Edit written content of a post with particular postID
@posts.route('/<postID>', methods=['PUT'])
def update_post(postID):
    the_data = request.json

    new_title = the_data['post_title']
    new_description = the_data['description']
    new_full_post = the_data['full_post']

    query = f'''UPDATE Posts 
    SET post_title = '{new_title}',
    description = '{new_description}',
    full_post = '{new_full_post}'
    WHERE post_id = {postID};
    '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    response = make_response("Successfully updated post content")
    response.status_code = 200
    return response

#------------------------------------------------------------
# Show/hide post with particular postID
@posts.route('/show/<postID>', methods=['PUT'])
def update_post_visibility(postID):
    the_data = request.json

    new_visibility = the_data['new_visibility']
    query = f'UPDATE Posts SET `show` = {new_visibility} WHERE post_id = {postID}'
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    response = make_response("Successfully updated post visibility")
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
