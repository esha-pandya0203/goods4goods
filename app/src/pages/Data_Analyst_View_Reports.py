import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests

from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

st.write("# Accessing Previously Written Analyses")

analyses = requests.get('http://api:4000/a/analysis').json() 

try: 
  st.dataframe(analyses)
except:
  st.write("Could not connect to database to get previously written analyses!") 