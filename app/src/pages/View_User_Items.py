import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')
SideBarLinks()

# function to fetch user items
def get_user_items(user_id):
    response = requests.get(f"http://api:4000/items/{user_id}")
    if response.status_code == 200:
        return response.json()
    else:
        st.error("Failed to fetch user items.")
        return []

# function to add a new item
def add_new_item(posted_by, description, product_name, image_url, target_price):
    payload = {
        "posted_by": posted_by,
        "description": description,
        "product_name": product_name,
        "image_url": image_url,
        "target_price": target_price
    }
        
    response = requests.post(f"http://api:4000/items", json=payload)
    if response.status_code == 200:
        #st.success("Item added!")
        st.rerun()
    else:
        st.error(f"Failed to add item: {response.text}")  

# function to delete an item
def delete_item(item_id):
    response = requests.delete(f"http://api:4000/items/{item_id}")
    if response.status_code == 200:
        #st.success("Item deleted! Will be removed from list on next visit to page.")
        st.rerun()
    else:
        st.error(f"Failed to delete item: {response.text}")  

# function to edit an item
def edit_item(new_name, new_desc, new_price, new_img, item_id):
    payload = {
        "product_name": new_name,
        "description": new_desc,
        "target_price": new_price,
        "image_url": new_img
    }
    response = requests.put(f"http://api:4000/items/{item_id}", json=payload)
    if response.status_code == 200:
        #st.success("Item updated! Changes will be reflected on next visit to page.")
        st.rerun()
    else:
        st.error(f"Failed to update item: {response.text}")

# Title of page
st.title('🪑 My Items')

# Form to add new item
st.markdown("## ➕ Add New Item")
with st.form("add_item_form", clear_on_submit=True):
    col1, col2 = st.columns(2)

    with col1:
        product_name = st.text_input("Product Name")
        description = st.text_area("Description")

    with col2:
        image_url = st.text_input("Image URL")
        target_price = st.number_input("Target Price ($)", step=1, min_value=0)

    # Submit button
    submitted = st.form_submit_button("Add Item")
    if submitted:
        add_new_item(
            posted_by=st.session_state['user_id'],
            description=description,
            product_name=product_name,
            image_url=image_url,
            target_price=target_price)

# Get the item data from the API
items = get_user_items(st.session_state['user_id'])

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

            # Delete button
            if st.button("❌ Delete", key=f"delete_{item['item_id']}"):
                delete_item(item["item_id"])

            # Edit button
            with st.expander("✏️ Edit Item"):
                new_name = st.text_input("Product Name", value=item["product_name"], key=f"name_{item['item_id']}")
                new_desc = st.text_area("Description", value=item["description"], key=f"desc_{item['item_id']}")
                new_price = st.number_input("Target Price", value=item["target_price"], key=f"price_{item['item_id']}")
                new_img = st.text_input("Image URL", value=item["image_url"], key=f"img_{item['item_id']}")

                if st.button("💾 Save Changes", key=f"save_{item['item_id']}"):
                    edit_item(
                        new_name=new_name,
                        new_desc=new_desc,
                        new_price=new_price,
                        new_img=new_img,
                        item_id=item["item_id"]
                    )

else:
    st.warning("No items to display.")
    logger.warning("No items to display.")
