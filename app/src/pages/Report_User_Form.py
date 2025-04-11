import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

errors = requests.get("http://api:4000/reports/codes").json()

# set the header of the page
st.header('Report User: ' + st.session_state['report_user_name'])

with st.form("Fill out a Report"):
    selected_item = st.selectbox(
        "Select error:",
        errors,
        format_func=lambda x: x["error_name"],
        key="dropdown"
    )
    description = st.text_area("Description: ")
    submitted = st.form_submit_button("Submit")

    if submitted:
        data = {}
        data['report_code'] = int(selected_item['error_code_id'])
        data['description'] = description
        data['reporter_id'] = int(st.session_state['user_id'])
        data['reported_id'] = int(st.session_state['report_user_id'])
        data['offer_id'] = int(st.session_state['report_offer_id'])

        response = requests.post("http://api:4000/reports/user", json = data)
        if response.status_code == 200:
            st.success("Report submitted successfully!")
        else:
            st.error("Failed submit report.")

if st.button("Go Back"):
    st.switch_page('pages/User_Offers.py')