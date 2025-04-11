import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
from modules.nav import SideBarLinks
from datetime import datetime

st.set_page_config(layout='wide')
SideBarLinks()

# function fetch user data
def get_user_data(user_id):
    response = requests.get(f"http://api:4000/users/{user_id}")
    if response.status_code == 200:
        return response.json()[0]
    else:
        st.error("Failed to fetch user data.")
        return None

# function to edit user bio
def edit_user_bio(new_bio):
    payload = {
        "user_bio": new_bio
    }
    response = requests.put(f"http://api:4000/users/{st.session_state['user_id']}", json=payload)
    if response.status_code == 200:
        #st.success("Bio updated successfully! Changes will be reflected on the next visit to the page.")
        st.rerun()
    else:
        st.error("Failed to update bio.")

# function to format the date
def format_date(date_str):
    return datetime.strptime(date_str, "%a, %d %b %Y %H:%M:%S GMT").strftime("%B %d, %Y")


user_data = get_user_data(st.session_state['user_id'])

# Display the user profile
st.title(f"{user_data['first_name']} {user_data['last_name']}'s Profile")

# Display user bio
st.subheader("Bio")
st.write(user_data['user_bio'])
# Edit User Bio
with st.expander("✏️ Edit User Bio"):
    new_bio = st.text_area("Edit Bio", value=user_data["user_bio"])
    if st.button("💾 Save Changes", key=f"save_{user_data['user_id']}"):
        edit_user_bio(new_bio)

# User Information
st.subheader("User Information")
st.write(f"**Full Name:** {user_data['first_name']} {user_data['last_name']}")
st.write(f"**Star Rating:** {user_data['star_rating']} ⭐")
st.write(f"**Successful Trades:** {user_data['successful_trades']}")
st.write(f"**Total Reports:** {user_data['total_reports']}")
st.write(f"**User Joined:** {format_date(user_data['user_joined_date'])}")


