import streamlit as st
import logging
logger = logging.getLogger(__name__)
import pandas as pd
import requests
from modules.nav import SideBarLinks


st.set_page_config(layout = 'wide')
SideBarLinks()


st.title("Available Items")
current_user_id = st.session_state["user_id"]

# get listings for the user to browse
def get_listings(user_id):
    response = requests.get(f"http://api-test:4000/items/listings/{user_id}")
    if response.status_code == 200:
        return response.json()
    else:
        st.error("Failed to fetch user items.")
        return []
    
# function to fetch user items
def get_user_items(user_id):
    response = requests.get(f"http://api-test:4000/items/{user_id}")
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

    response = requests.post("http://api-test:4000/offers", json=payload)
    if response.status_code == 200:
        st.success("Trade proposed successfully!")
    else:
        st.error("Failed to propose trade.")

# Fetch items from the API
items = get_listings(current_user_id)
user_items = get_user_items(current_user_id)

# Display item(s) if any
if items:
    for item in items:
        if item["posted_by"] == current_user_id:
            continue
        else:
            with st.container():
                st.markdown("----")
                cols = st.columns([1, 2])

            # image 
            with cols[0]:
                st.image(item["image_url"], use_container_width=True)
            
            # item details
            with cols[1]:
                st.subheader(item["product_name"])
                st.markdown(f"**Description:** {item['description']}")
                st.markdown(f"**Target Price:** ${item['target_price']}")
                st.markdown(f"**Posted By:** {item['firstName']} {item['lastName']}")
            
                # drop down to select item to offer
                selected_item = st.selectbox(
                    "Select one of your items to offer:",
                    user_items,
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