import logging 
logger = logging.getLogger(__name__)
import streamlit as st 
import requests 
from streamlit_extras.app_logo import add_logo 
from modules.nav import SideBarLinks 
from datetime import date, datetime

SideBarLinks()  

st.write("# Write a New Data Analysis") 

with st.form("Create a New Analysis"): 
    written_analysis = st.text_area("Written Analysis:")
    end_date = st.date_input("Today's Date", value=date.today())
    
    submitted = st.form_submit_button("Submit") 
    
    if submitted: 
        # convert end date to a datetime object 
        end_date_str = datetime.combine(end_date, datetime.min.time()).strftime("%Y-%m-%d %H:%M:%S")
        
        data = {} 
        data['written_analysis'] = written_analysis 
        data['end_date'] = end_date_str
        data['analyst_id'] = st.session_state['analyst_id']
        st.write(data) 
        
        requests.post('http://api:4000/a/analysis', json=data) 