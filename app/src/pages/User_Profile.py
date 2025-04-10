import logging
import streamlit as st
import requests
from modules.nav import SideBarLinks
from datetime import datetime

logger = logging.getLogger(__name__)
st.set_page_config(layout='wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

# Get the user data from the API
response = requests.get(f"http://api-test:4000/users/{st.session_state['user_id']}")
user_data = response.json()[0]

# function to format the date
def format_date(date_str):
    return datetime.strptime(date_str, "%a, %d %b %Y %H:%M:%S GMT").strftime("%B %d, %Y")

# Display the user profile
st.title(f"{user_data['first_name']} {user_data['last_name']}'s Profile")

# Display user bio
st.subheader("Bio")
st.write(user_data['user_bio'])
# Edit User Bio
with st.expander("✏️ Edit User Bio"):
    new_bio = st.text_area("Edit Bio", value=user_data["user_bio"])
    if st.button("💾 Save Changes", key=f"save_{user_data['user_id']}"):
        update_payload = {
            "user_bio": new_bio
        }
        put_resp = requests.put(f"http://api-test:4000/users/{user_data['user_id']}", json=update_payload)

        if put_resp.status_code == 200:
            st.success("Bio updated successfully! Changes will be reflected on the next visit to the page.")
            user_data['user_bio'] = new_bio  
        else:
            st.error(f"Failed to update user bio: {put_resp.text}")

# User Information
st.subheader("User Information")
st.write(f"**Full Name:** {user_data['first_name']} {user_data['last_name']}")
st.write(f"**Star Rating:** {user_data['star_rating']} ⭐")
st.write(f"**Successful Trades:** {user_data['successful_trades']}")
st.write(f"**Total Reports:** {user_data['total_reports']}")
st.write(f"**User Joined:** {format_date(user_data['user_joined_date'])}")


