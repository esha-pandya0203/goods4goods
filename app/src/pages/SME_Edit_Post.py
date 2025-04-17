import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Edit Post')

def get_post(post_id):
    response = requests.get(f"http://api:4000/posts/{post_id}")
    if response.status_code == 200:
        return response.json()[0]
    else:
        st.error(f"Failed to get post: {response.text}")
        return {}

curr_post = get_post(st.session_state.selected_post)

def validate_text(name, field_name):
  if not name:
    return False, f'{field_name} cannot be empty'
  return True, ''

with st.form('edit_post_form'):
  st.write('Edit post')
  form_title = st.text_input('Title:', value=curr_post['post_title'])
  form_description = st.text_input('Description:', value=curr_post['description'])
  form_content = st.text_area('Post:', value=curr_post['full_post'])
  st.write(f'{len(form_content)} characters')
  submit = st.form_submit_button('Save changes!')
  if submit:
    validations = [
      validate_text(form_title, "Post title"),
      validate_text(form_description, "Post description"),
      validate_text(form_content, "Post")
    ]
    if all(v[0] for v in validations):
      form_data = {"post_title": form_title, "description": form_description, "full_post": form_content}
      resp = requests.put(f'http://api:4000/posts/{curr_post["post_id"]}', json=form_data)
      if resp.status_code == 200:
        st.success("Post edited successfully!")
        st.switch_page("pages/SME_Single_Post.py")
      else:
        st.error(f"Error: {resp}")
    else:
      for valid, message in validations:
        if not valid:
          st.error(message)
