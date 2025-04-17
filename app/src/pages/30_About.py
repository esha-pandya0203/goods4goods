import streamlit as st
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

st.write("# About this App")

st.markdown (
    """
    Goods4Goods is a data driven trade-based app where you can post items you no longer need and trade them for items you’ve been wanting. 
    It’s the perfect solution for anyone looking to refresh their collection or declutter without spending money. 
    Our platform allows users to list items they no longer need, specify what they’re looking for in return, and connect with reputable traders.

    """
        )
