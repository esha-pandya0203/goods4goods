import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')
SideBarLinks()

# Function to fetch given sme's data
def get_sme_data(sme_id):
    response = requests.get(f"http://api:4000/sme/{sme_id}")
    if response.status_code == 200:
        return response.json()[0]
    else:
        st.error("Failed to fetch employee data.")
        return None

sme_data = get_sme_data(st.session_state['sme_id'])

st.title(f"{sme_data['first_name']} {sme_data['last_name']}'s Profile")

st.subheader("Employee Information")
st.write(f"**Full Name:** {sme_data['first_name']} {sme_data['last_name']}")
st.write(f"**Email:** {sme_data['email']}")
st.write(f"**Home Address:** {sme_data['street']}, {sme_data['city']}, {sme_data['state']} {sme_data['zipcode']}")
