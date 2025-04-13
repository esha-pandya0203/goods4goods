import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')
# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome Social Media Employee, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Manage Social Media Posts',
            type='primary',
            use_container_width=True):
    st.switch_page('pages/SME_All_Posts.py')

if st.button('Create a New Post',
            type='primary',
            use_container_width=True):
    st.switch_page('pages/SME_New_Post.py')

if st.button('View Your Profile',
            type='primary',
            use_container_width=True):
    st.switch_page('pages/SME_Profile.py')

