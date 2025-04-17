import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Create a new post')

def validate_text(name, field_name):
  if not name:
    return False, f'{field_name} cannot be empty'
  return True, ''

with st.form('create_post_form'):
  st.write('New post')
  form_title = st.text_input('Title:')
  form_description = st.text_input('Description: ')
  form_content = st.text_area('Post:')
  st.write(f'{len(form_content)} characters')
  submit = st.form_submit_button('Post!')
  if submit:
    validations = [
      validate_text(form_title, "Post title"),
      validate_text(form_content, "Post")
    ]
    if all(v[0] for v in validations):
      form_data = {"post_title": form_title, "description": form_description, "full_post": form_content, "show": True, "posted_by": 1}
      resp = requests.post('http://api:4000/posts', json=form_data)
      if resp.status_code == 200:
        st.success("Post created successfully!")
      else:
        st.error(f"Error: {resp}")
    else:
      for valid, message in validations:
        if not valid:
          st.error(message)
