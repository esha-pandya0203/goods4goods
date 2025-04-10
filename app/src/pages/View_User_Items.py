import logging
import streamlit as st
import requests
from modules.nav import SideBarLinks

logger = logging.getLogger(__name__)
st.set_page_config(layout='wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

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

    submitted = st.form_submit_button("Add Item")

    if submitted:
        payload = {
            "posted_by": st.session_state['user_id'],
            "description": description,
            "product_name": product_name,
            "image_url": image_url,
            "target_price": target_price
        }
        
        response = requests.post(f"http://api-test:4000/items", json=payload)
        if response.status_code == 200:
            st.success("Item added!")
        else:
            st.error(f"Failed to add item: {response.text}")

# Get the item data from the API
response = requests.get(f"http://api-test:4000/items/{st.session_state['user_id']}")
items = response.json()

# Display item(s) if any
if items:
    for item in items:
        with st.container():
            st.markdown("----")
            cols = st.columns([1, 2, 1])

        # Show image
        with cols[0]:
            st.image(item["image_url"], use_container_width=True)
        
        # Show item details and actions
        with cols[1]:
            st.subheader(item["product_name"])
            st.markdown(f"**Description:** {item['description']}")
            st.markdown(f"**Target Price:** ${item['target_price']}")

            # Show delete button
            if st.button("❌ Delete", key=f"delete_{item['item_id']}"):
                del_resp = requests.delete(f"http://api-test:4000/items/{item['item_id']}")
                if del_resp.status_code == 200:
                    st.success("Item deleted. Will be removed from list on next visit to page.")
                else:
                    st.error(f"Failed to delete: {del_resp.text}")

            # Show edit button
            with st.expander("✏️ Edit Item"):
                new_name = st.text_input("Product Name", value=item["product_name"], key=f"name_{item['item_id']}")
                new_desc = st.text_area("Description", value=item["description"], key=f"desc_{item['item_id']}")
                new_price = st.number_input("Target Price", value=item["target_price"], key=f"price_{item['item_id']}")
                new_img = st.text_input("Image URL", value=item["image_url"], key=f"img_{item['item_id']}")

                if st.button("💾 Save Changes", key=f"save_{item['item_id']}"):
                    update_payload = {
                        "product_name": new_name,
                        "description": new_desc,
                        "target_price": new_price,
                        "image_url": new_img,
                    }
                    put_resp = requests.put(f"http://api-test:4000/items/{item['item_id']}", json=update_payload)
                    if put_resp.status_code == 200:
                        st.success("Item updated! Changes will be reflected on next visit to page.")
                    else:
                        st.error(f"Failed to update: {put_resp.text}")

else:
    st.warning("No items to display.")
    logger.warning("No items to display.")
