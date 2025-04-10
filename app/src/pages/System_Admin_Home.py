import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Welcome System Admin, {st.session_state['first_name']}.")


if st.button('See User Reports', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/User_Reports.py')


if st.button('Update Status of User Reports', 
        type='primary',
        use_container_width=True):
    st.switch_page('pages/Update_User_Reports.py')


if st.button('Create Admin Report', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/Admin_Report.py')

  
# if st.button('Delete Item', 
#              type='primary',
#              use_container_width=True):
#   st.switch_page('pages/Item_Delete.py')

# if st.button('Delete User Bio', 
#              type='primary',
#              use_container_width=True):
#   st.switch_page('pages/User_Bio_Delete.py')