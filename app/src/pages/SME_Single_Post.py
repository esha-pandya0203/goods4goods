import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

if st.button("Go back to all posts"):
    st.switch_page("pages/SME_All_Posts.py")

if 'selected_post' in st.session_state:
    post = st.session_state.selected_post
    st.title(post['post_title'])
    st.markdown(f"Author: {post['createdBy']}")
    st.markdown(f"Created {post['createdDate']}")
    st.write(' ')
    st.markdown(f"**{post['description']}**")
else:
    st.error("No post selected to view.")
