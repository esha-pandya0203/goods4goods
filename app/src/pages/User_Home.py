import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')
SideBarLinks()

st.title(f"Welcome, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Manage Your Profile', 
             type='primary',
             use_container_width=True):

  st.switch_page('pages/User_Profile.py')

if st.button('Manage Your Items', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/View_User_Items.py')

if st.button('Manage Your Offers', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/User_Offers.py')

if st.button('Search for Items', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/User_Find_Items.py')