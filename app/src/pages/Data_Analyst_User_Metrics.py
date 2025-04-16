import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
import pandas as pd 
import altair as alt

from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

st.write("# User Metrics")

try:
    signup_data = requests.get('http://api:4000/users/metrics/signups').json() 
    signup_df = pd.DataFrame(signup_data)
    signup_df['sign_up_date'] = pd.to_datetime(signup_df['sign_up_date'])
    
    st.subheader("📈 New User Sign-Ups Over Time")
    line_chart = alt.Chart(signup_df).mark_line(point=True).encode(
        x='sign_up_date:T', 
        y='new_users:Q', 
        tooltip=['sign_up_date:T', 'new_users'] 
    ).properties(width=700, height=400) 
    st.altair_chart(line_chart) 
except: 
    st.write("Could not get user sign-up metrics from database")

try:
    report_data = requests.get('http://api:4000/users/metrics/reports').json() 
    report_df = pd.DataFrame(report_data)
    
    st.subheader("🔔 Most Common User-Reported Errors")
    bar_chart = alt.Chart(report_df).mark_bar().encode(
        x=alt.X('report_count:Q', title='Report Count'), 
        y=alt.Y('error_name:N', sort='-x', title='Error Type'), 
        tooltip=['error_name', 'report_count']
    ).properties(width=700, height=400)
    st.altair_chart(bar_chart)
except: 
    st.write("Could not get user report metrics from database")