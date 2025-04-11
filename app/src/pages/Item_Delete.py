import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks


# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

# set the header of the page
st.header('Remove Flagged Items')



# Enter an item to delete 
item_id = st.number_input(label = "Enter Item ID to be Deleted: ", min_value = 1, step=1)
if st.button("Delete Item"):
    if item_id:
        delete_url = f'http://api:4000/admins/adminItems/{int(item_id)}'
        response = requests.delete(delete_url)
        st.write("Response: ", response.text)
    else:
        st.warning("Please enter an item id.")

