import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

def get_post(post_id):
    response = requests.get(f"http://api:4000/posts/{post_id}")
    if response.status_code == 200:
        return response.json()[0]
    else:
        st.error(f"Failed to get post: {response.text}")
        return {}

post = get_post(st.session_state.selected_post)

if st.button("Go back to all posts"):
    st.switch_page("pages/SME_All_Posts.py")

if 'selected_post' in st.session_state:
    st.title(f"{post['post_title']}")
    st.markdown(f"Author: {post['createdBy']}")
    st.markdown(f"Created {post['createdDate']}")
    st.write(' ')
    st.markdown(f"**{post['description']}**")
    st.markdown(f"{post['full_post']}")
    if st.button("✏️ Edit post"):
        st.switch_page("pages/SME_Edit_Post.py")
else:
    st.error("No post selected to view.")
