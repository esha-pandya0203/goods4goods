import streamlit as st
import logging
logger = logging.getLogger(__name__)
import requests
from modules.nav import SideBarLinks


st.set_page_config(layout = 'wide')
SideBarLinks()

def get_user_offers(user_id):
    response = requests.get(f"http://api:4000/offers/{user_id}")
    if response.status_code == 200:
        return response.json()
    else:
        st.error("Failed to fetch offers.")
        return []

def update_offer_status(offer_id, status, item_offered_id, item_requested_id):
    payload = {
        "offer_id": offer_id,
        "status": status,
        "offered_item": item_offered_id,
        "requested_item": item_requested_id
    }
    response = requests.put("http://api:4000/offers/status", json=payload)
    if response.status_code == 200:
        #st.success("Status updated successfully!")
        st.rerun()
    else:
        st.error("Failed to update status.")

def get_fairness_score(offer_id):
    response = requests.get(f"http://api:4000/offers/fairness/{offer_id}")
    if response.status_code == 200:
        return response.json()[0]["Fairness Score"]
    else:
        st.warning("Couldn't fetch fairness score.")
        return None
    
def get_user_rating_for_transaction(user_id, offer_id):
    response = requests.get(f"http://api:4000/ratings/{offer_id}/{user_id}")
    if response.status_code == 200:
        return response.json()
    else:
        st.error("Failed to fetch user rating.")
        return None

def rate_transaction(user_id, offer_id, rating, other_user_id):
    payload = {
        "rating_for": other_user_id,
        "rating_by": user_id,
        "rating_number": rating,
        "offer_id": offer_id
    }
    response = requests.post("http://api:4000/ratings", json=payload)
    if response.status_code == 200:
        #st.success("Rating submitted successfully!")
        st.rerun()
    else:
        st.error("Failed to submit rating.")

def orgazine_offers(offers, user_id):
    received_offers = []
    proposed_offers = []
    rejected_offers = []
    accepted_offers = []

    for offer in offers:
        if offer["Status"].lower() == "rejected":
            rejected_offers.append(offer)
        elif offer["Status"].lower() == "accepted":
            accepted_offers.append(offer)
        elif offer["Offering Trader ID"] == user_id:
            proposed_offers.append(offer)
        else:
            received_offers.append(offer)

    return received_offers, proposed_offers, rejected_offers, accepted_offers

user_id = st.session_state["user_id"]

# Fetch all offers for this user
received_offers, proposed_offers, rejected_offers, accepted_offers = orgazine_offers(get_user_offers(user_id), user_id)

# Tabs to view different offers
st.title("Your Offers")
tab1, tab2, tab3, tab4 = st.tabs(["📥 Received", "📤 Proposed", "❌ Rejected", "✅ Accepted"])

# Function to display offers
def display_offer_card(offer, user_role, allow_status_change=False, restrict_status_options=None):
    col1, col2 = st.columns([1, 1])

    with col1:
        st.image(offer["Offered Item Image"], caption=f"Offered: {offer['Offered Item']}", use_container_width=True)
    with col2:
        st.image(offer["Requested Item Image"], caption=f"Requested: {offer['Requested Item']}", use_container_width=True)

    st.markdown(f"**Status:** {offer['Status']}")
    other_user = offer["Offering Trader"] if user_role == "received" else offer["Receiving Trader"]
    other_user_id = offer["Offering Trader ID"] if user_role == "received" else offer["Receiving Trader ID"]
    st.markdown(f"**Other Trader:** {other_user}")

    # Fairness score
    fairness = get_fairness_score(offer["Offer ID"])
    st.markdown(f"**Fairness Score:** {fairness}")

    if st.button("Report User", key=f"report_{offer['Offer ID']}"):
            st.session_state['report_user_id'] = f"{other_user_id}"
            st.session_state['report_user_name'] = f"{other_user}"
            st.session_state['report_offer_id'] = f"{offer['Offer ID']}"
            st.switch_page('pages/Report_User_Form.py')

    if allow_status_change:
        options = restrict_status_options or ["Pending", "Accepted", "Rejected"]
        new_status = st.selectbox(
            f"**Update status:**",
            options,
            index=options.index(offer["Status"]) if offer["Status"] in options else 0,
            key=f"status_select_{offer['Offer ID']}"
        )
        if st.button("💾 Update Status", key=f"update_btn_{offer['Offer ID']}"):
            update_offer_status(offer["Offer ID"], new_status, offer["Offered Item ID"], offer["Requested Item ID"])

    st.markdown("---")

# Tab 1: Received Offers 
with tab1:
    st.header("Offers You Received")
    if not received_offers:
        st.info("No received offers.")
    else:
        for offer in received_offers:
            with st.container():
                display_offer_card(offer, "received", allow_status_change=True)

# Tab 2: Proposed Offers
with tab2:
    st.header("Offers You Proposed")
    if not proposed_offers:
        st.info("No proposed offers.")
    else:
        for offer in proposed_offers:
            with st.container():
                display_offer_card(
                    offer,
                    user_role="proposed",
                    allow_status_change=True,
                    restrict_status_options=["Pending", "Rejected"] 
                )

# Tab 3: Rejected Offers
with tab3:
    st.header("Rejected Offers")
    if not rejected_offers:
        st.info("No rejected offers.")
    else:
        for offer in rejected_offers:
            role = "received" if offer["Receiving Trader ID"] == user_id else "proposed"
            with st.container():
                display_offer_card(offer, role)

# Tab 4: Accepted Offers
with tab4:
    st.header("Accepted Offers")
    if not accepted_offers:
        st.info("No accepted offers.")
    else:
        for offer in accepted_offers:
            st.markdown("---")
            role = "received" if offer["Receiving Trader ID"] == user_id else "proposed"
            other_user_id = offer["Offering Trader ID"] if role == "received" else offer["Receiving Trader ID"]

            check_ratings = get_user_rating_for_transaction(user_id, offer["Offer ID"])
            if check_ratings['rating_number']is not None:
                st.markdown(f"**Your rating for this transaction:** {check_ratings['rating_number']} ⭐")
            else:
                st.markdown("**You haven't rated this transaction yet.**")
                rating = st.slider("Rate out of 5", 1, 5)
                        
                if st.button("Submit Rating", key=f"rating_{offer['Offer ID']}"):
                    rate_transaction(
                        user_id=user_id,
                        offer_id=offer["Offer ID"],
                        rating=rating,
                        other_user_id=other_user_id)

            role = "received" if offer["Receiving Trader ID"] == user_id else "proposed"
            with st.container():
                display_offer_card(offer, role)

            

            