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

# function to propose a trade 
def propose_trade(offering_user, receiving_user, item_offered_id, item_requested_id):
    payload = {
    "offering_user": offering_user,
    "receiving_user": receiving_user,
    "item_offered_id": item_offered_id,
    "item_requested_id": item_requested_id
    }

    response = requests.post("http://api:4000/offers", json=payload)
    if response.status_code == 200:
        st.success("Trade proposed successfully!")
        #st.rerun()
    else:
        st.error("Failed to propose trade.")

# function to format the date
def format_date(date_str):
    return datetime.strptime(date_str, "%a, %d %b %Y %H:%M:%S GMT").strftime("%B %d, %Y")


user_data = get_user_data(st.session_state['view_user_id'])

current_user_id = st.session_state["user_id"]
current_user_items = get_user_items(current_user_id)

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

            # drop down to select item to offer
            selected_item = st.selectbox(
                "Select one of your items to offer:",
                current_user_items,
                format_func=lambda x: x["product_name"] +", Target Price: "+ str(x['target_price']),
                key=f"dropdown_{item['item_id']}"
            )

            # button to propose trade
            if st.button("Propose Trade", key=f"trade_{item['item_id']}"):
                propose_trade(
                    offering_user=current_user_id,
                    receiving_user=item["posted_by"],
                    item_offered_id=selected_item["item_id"],
                    item_requested_id=item["item_id"]
                )

else:
    st.warning("No items to display.")
    logger.warning("No items to display.")

