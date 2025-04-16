import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
import pandas as pd 
import altair as alt

from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

st.write("# Item Metrics")

try:
    st.subheader("📊 Trade Summary")
    summary_stats = requests.get('http://api:4000/items/metrics/completed-trades').json() 
    col1, col2 = st.columns(2) 
    col1.metric('Total Listed Items', summary_stats['total_listed_items'])
    col2.metric('Completed Trades', summary_stats['completed_trades'])
except: 
    st.write("Could not connect to database to load trade summary statistics")

try:
    st.subheader("✅ Offer Status Distribution")
    status_data = requests.get('http://api:4000/offers/metrics/status').json()
    status_df = pd.DataFrame(status_data) 
    
    status_chart = alt.Chart(status_df).mark_bar().encode(
        y=alt.Y('status_name:N', sort='-x', title='Status'), 
        x=alt.X('trade_count:Q', title='Number of Offers'), 
        tooltip=['status_name', 'trade_count']
    ).properties(width=700, height=400).configure_mark(color='lightblue')
    st.altair_chart(status_chart)
except: 
    st.write("Could not connect to database to load overall status statistics")

try:
    st.subheader("🔥Top Traded Items")
    top_items = requests.get('http://api:4000/items/metrics/top-items').json()
    items_df = pd.DataFrame(top_items) 
    
    item_chart = alt.Chart(items_df).mark_bar().encode(
        y=alt.Y('product_name:N', sort='-x', title='Product'), 
        x=alt.X('trade_count:Q', title='Number of Offers'), 
        tooltip=['product_name', 'trade_count']
    ).properties(width=700, height=400).configure_mark(color='orange')
    st.altair_chart(item_chart)
except: 
    st.write("Could not connect to database to load top item statistics")