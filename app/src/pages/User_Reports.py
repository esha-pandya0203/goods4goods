import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks


# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

# set the header of the page
st.header('User Reports')

####
filter_dropdown = st.selectbox(label="Filter Reports", options=['All','Code 1 - User Bio', 'Code 2 - Item Error','Code 3 - Technical Error'])
# Filter Report Types - by report code
if filter_dropdown == 'Code 1 - User Bio':
    url = 'http://api:4000/admins/reportCode/1'
elif filter_dropdown == 'Code 2 - Item Error':
    url = 'http://api:4000/admins/reportCode/2'
elif filter_dropdown == 'Code 3 - Technical Error':
    url = 'http://api:4000/admins/reportCode/3'
else:
# Show all current reports
    url = 'http://api:4000/admins/userReport'
    # userReports = requests.get('http://api:4000/admins/userReport').json()
    
try:
    response = requests.get(url)
    # st.write("Status Code: ", response.status_code)
    userReports = response.json()
    st.dataframe(userReports)
except:
    e = st.error("Could not connect to database to get User Reports.")
    st.write("Error: ", e)
    st.write(response.text)



# Find reported user - delete bio




# # Enter an item to delete (diff page)
# item_id = st.text_input(label = "Enter Item ID to be Deleted: ")
# if item_id:
#     requests.delete('http://api:4000/admins/adminItems/<{item_id}>')