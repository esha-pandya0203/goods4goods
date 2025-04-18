from flask import Flask

from backend.db_connection import db
from backend.analysis.analysis_routes import analysis 
from backend.posts.posts_routes import posts
from backend.Admin.admin_routes import admins
from backend.users.users_routes import users
from backend.items.items_routes import items
from backend.offers.offer_routes import offers
from backend.ratings.rating_routes import ratings
from backend.reports.report_routes import reports
from backend.sme.sme_routes import sme
import os
from dotenv import load_dotenv

def create_app():
    app = Flask(__name__)

    # Load environment variables
    # This function reads all the values from inside
    # the .env file (in the parent folder) so they
    # are available in this file.  See the MySQL setup 
    # commands below to see how they're being used.
    load_dotenv()

    # secret key that will be used for securely signing the session 
    # cookie and can be used for any other security related needs by 
    # extensions or your application
    # app.config['SECRET_KEY'] = 'someCrazyS3cR3T!Key.!'
    app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')

    # # these are for the DB object to be able to connect to MySQL. 
    # app.config['MYSQL_DATABASE_USER'] = 'root'
    app.config['MYSQL_DATABASE_USER'] = os.getenv('DB_USER').strip()
    app.config['MYSQL_DATABASE_PASSWORD'] = os.getenv('MYSQL_ROOT_PASSWORD').strip()
    app.config['MYSQL_DATABASE_HOST'] = os.getenv('DB_HOST').strip()
    app.config['MYSQL_DATABASE_PORT'] = int(os.getenv('DB_PORT').strip())
    app.config['MYSQL_DATABASE_DB'] = os.getenv('DB_NAME').strip()  # Change this to your DB name

    # Initialize the database object with the settings above. 
    app.logger.info('current_app(): starting the database connection')
    db.init_app(app)


    # Register the routes from each Blueprint with the app object
    # and give a url prefix to each
    app.logger.info('current_app(): registering blueprints with Flask app object.')
    app.register_blueprint(posts,       url_prefix='/posts')
    app.register_blueprint(sme,       url_prefix='/sme')
    app.register_blueprint(analysis, url_prefix='/a')
    app.register_blueprint(admins,      url_prefix = '/admins')
    app.register_blueprint(users,       url_prefix='/users')
    app.register_blueprint(items, url_prefix='/items')
    app.register_blueprint(offers, url_prefix='/offers')
    app.register_blueprint(ratings, url_prefix='/ratings')
    app.register_blueprint(reports, url_prefix='/reports')
    
    # Don't forget to return the app object
    return app

