##################################################
# This is the main/entry-point file for the 
# sample application for your project
##################################################

# Set up basic logging infrastructure
import logging
logging.basicConfig(format='%(filename)s:%(lineno)s:%(levelname)s -- %(message)s', level=logging.INFO)
logger = logging.getLogger(__name__)

# import the main streamlit library as well
# as SideBarLinks function from src/modules folder
import streamlit as st
from modules.nav import SideBarLinks

# streamlit supports reguarl and wide layout (how the controls
# are organized/displayed on the screen).
st.set_page_config(layout = 'wide')

# If a user is at this page, we assume they are not 
# authenticated.  So we change the 'authenticated' value
# in the streamlit session_state to false. 
st.session_state['authenticated'] = False

# Use the SideBarLinks function from src/modules/nav.py to control
# the links displayed on the left-side panel. 
# IMPORTANT: ensure src/.streamlit/config.toml sets
# showSidebarNavigation = false in the [client] section
SideBarLinks(show_home=True)

# ***************************************************
#    The major content of this page
# ***************************************************

# set the title of the page and provide a simple prompt. 
logger.info("Loading the Home page of the app")
st.title('Goods4Goods')
st.write('\n\n')
st.write('### HI! Which user would you like to log in as?')

if st.button("Act as Emma Johnson, a user of Goods4Goods", 
            type = 'primary', 
            use_container_width=True):
    st.session_state['authenticated'] = True
    st.session_state['role'] = 'user' 
    st.session_state['first_name'] = 'Emma'
    st.session_state['user_id'] = 1
    logger.info("Logging in as Emma Johnson User Persona")
    st.switch_page('pages/User_Home.py')

if st.button('Act as Chloe Smith, a System Administrator', 
            type = 'primary', 
            use_container_width=True):
    st.session_state['authenticated'] = True
    st.session_state['role'] = 'administrator'
    st.session_state['first_name'] = 'Chloe'
    st.switch_page('pages/System_Admin_Home.py')

if st.button('Act as Barney Johnson, a data analyst of Goods4Goods', 
             type='primary', 
             use_container_width=True):
    st.session_state['authenticated'] = True 
    st.session_state['role'] = 'data_analyst' 
    st.session_state['first_name'] = 'Barney' 
    st.session_state['analyst_id'] = 1 
    logger.info('Logging in as Barney Johnson Data Analyst Persona') 
    st.switch_page('pages/Data_Analyst_Home.py') 


if st.button('Act as Daniel Kimmel, a Social Media Employee', 
            type = 'primary', 
            use_container_width=True):
    st.session_state['authenticated'] = True
    st.session_state['role'] = 'sme'
    st.session_state['first_name'] = 'Daniel'
    st.session_state['sme_id'] = 1
    st.switch_page('pages/SME_Home.py')
