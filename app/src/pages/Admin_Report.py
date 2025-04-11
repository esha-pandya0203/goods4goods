import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

# set the header of the page
st.header('Administrator Reports')

st.write("Fill out an Administrator Report")

# Admin Report Page - fill out a report

with st.form("Create a new Admin Report"):
    code = st.number_input("Input Report Code: ")
    description = st.text_area("Input Description of Report: ")
    status = st.number_input("Input Report Status: ")
    reporter_id = st.number_input("Input your Admin ID Number: ")
    reported_id = st.number_input("Input the Reported User's ID Number: ")
    offer_id = st.number_input("Input the Offer ID for the Report: ")

    submitted = st.form_submit_button("Submit")

    if submitted:
        data = {}
        data['report_code'] = int(code)
        data['description'] = description
        data['status'] = int(status)
        data['reporter_id'] = int(reporter_id)
        data['reported_id'] = int(reported_id)
        data['offer_id'] = int(offer_id)
        st.write("Data being sent: ", data)

        response = requests.post("http://api:4000/admins/adminReport", json = data)
        st.write("Response: ", response.text)


