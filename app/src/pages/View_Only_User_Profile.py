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
    
# function to fetch user items
def get_user_items(user_id):
    response = requests.get(f"http://api:4000/items/{user_id}")
    if response.status_code == 200:
        return response.json()
    else:
        st.error("Failed to fetch user items.")
        return []

# function to format the date
def format_date(date_str):
    return datetime.strptime(date_str, "%a, %d %b %Y %H:%M:%S GMT").strftime("%B %d, %Y")


user_data = get_user_data(st.session_state['view_user_id'])

if st.button("Go Back"):
    st.switch_page('pages/User_Find_Items.py')

# Display the user profile
st.title(f"{user_data['first_name']} {user_data['last_name']}'s Profile")

# Display user bio
st.subheader("Bio")
st.write(user_data['user_bio'])

# User Information
st.subheader("User Information")
st.write(f"**Full Name:** {user_data['first_name']} {user_data['last_name']}")
st.write(f"**Star Rating:** {user_data['star_rating']} ⭐")
st.write(f"**Successful Trades:** {user_data['successful_trades']}")
st.write(f"**Total Reports:** {user_data['total_reports']}")
st.write(f"**User Joined:** {format_date(user_data['user_joined_date'])}")

# Get user items
items = get_user_items(st.session_state['view_user_id'])

# Display item(s) if any
if items:
    for item in items:
        with st.container():
            st.markdown("----")
            cols = st.columns([1, 2])

        # Show image
        with cols[0]:
            st.image(item["image_url"], use_container_width=True)
        
        # Show item details and actions
        with cols[1]:
            st.subheader(item["product_name"])
            st.markdown(f"**Description:** {item['description']}")
            st.markdown(f"**Target Price:** ${item['target_price']}")

else:
    st.warning("No items to display.")
    logger.warning("No items to display.")

