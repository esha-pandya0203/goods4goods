import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

# set the header of the page
st.header('Update User Reports')

report_id = st.number_input(label = "Enter the Report ID: ")


# Delete a report 
if st.button("Delete Report"):
    if report_id:
        delete_url = f'http://api:4000/admins/userReport/{report_id}'
        response = requests.delete(delete_url)
        st.write("Status Code: ", response.status_code)
        st.write("Response: ", response.text)
    else:
        st.warning("Please enter a report id.")

status_code = st.number_input(label = "Enter the new status code: ", min_value = 1)

# Change status of a report
if st.button("Update Report Status"):
    if report_id and status_code:
        update_url = f'http://api:4000/admins/userReport'
        payload = {
            "report_id" : int(report_id),
            "status": int(status_code)
        }
        response = requests.put(update_url, json=payload)
        st.write("Status Code: ", response.status_code)
        st.write("Response: ", response.text)
    else:
        st.warning("Please enter a report ID and an updated status.")



