import logging 
logger = logging.getLogger(__name__)

import streamlit as st 
from modules.nav import SideBarLinks 

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome Data Analyst, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('See User Engagement Metrics', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/Data_Analyst_User_Metrics.py')

if st.button('See Product Popularity Metrics', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/Data_Analyst_Item_Metrics.py')

if st.button("Generate a Report",
             type='primary',
             use_container_width=True):
  st.switch_page('pages/Data_Analyst_Write_Report.py')

if st.button("View Previous Reports",
             type='primary',
             use_container_width=True):
  st.switch_page('pages/Data_Analyst_View_Reports.py')