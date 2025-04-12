import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

def get_posts():
    response = requests.get(f"http://api:4000/posts")
    if response.status_code == 200:
        return response.json()
    else:
        st.error(f"Failed to get posts: {response.text}")
        return {}

def delete_post(post_id):
    response = requests.delete(f"http://api:4000/posts/{post_id}")
    if response.status_code == 200:
        st.rerun()
    else:
        st.error(f"Failed to delete post: {response.text}")

def update_post_visibility(post_id, curr_visibility):
    response = requests.put(f"http://api:4000/posts/{post_id}", json={"new_visibility": not curr_visibility})
    if response.status_code == 200:
        st.rerun()
    else:
        st.error(f"Failed to update post: {response.text}")

st.title(f"Welcome Social Media Employee, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('Social Media Posts')
posts = get_posts()

if posts:
    for post in posts:
        with st.container(border=True):
            
            left, right = st.columns([4,1])

            with left:
                st.subheader(post['post_title'], False)
                st.markdown(f"**{post['description']}**")
                st.markdown(f"Post visibility: {post['show']}")
                st.markdown(f"Author: {post['createdBy']}")
                st.markdown(f"Created on {post['createdDate']}")
            with right:
                # Delete button
                if st.button("❌ Delete", key=f"button_delete_{post['post_id']}"):
                    delete_post(post['post_id'])
                # Hide/show button
                if st.button("Hide/Show", key=f"button_hide_{post['post_id']}"):
                    update_post_visibility(post['post_id'], post['show'])
else:
    st.write("No social media posts yet! Ready to write some?")
