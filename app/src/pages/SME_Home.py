import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome Social Media Employee, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')
st.write('Social Media Posts')
posts = {}
try:
  posts = requests.get('http://api:4000/z/posts').json()
except:
  st.write("Could not connect to sample api")
st.dataframe(posts)
