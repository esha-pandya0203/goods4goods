import streamlit as st
import logging
logger = logging.getLogger(__name__)
import requests
from modules.nav import SideBarLinks


st.set_page_config(layout = 'wide')
SideBarLinks()

user_id = st.session_state["user_id"]

# Fetch all offers for this user
offers_response = requests.get(f"http://api-test:4000/offers/{user_id}")
offers = offers_response.json()

# Separate offers
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

# Set up tabs to split offers
tab1, tab2, tab3, tab4 = st.tabs(["📥 Received", "📤 Proposed", "❌ Rejected", "✅ Accepted"])

# Function to display offer card
def display_offer_card(offer, user_role, allow_status_change=False, restrict_status_options=None):
    col1, col2 = st.columns([1, 1])

    with col1:
        st.image(offer["Offered Item Image"], caption=f"Offered: {offer['Offered Item']}", use_container_width=True)
    with col2:
        st.image(offer["Requested Item Image"], caption=f"Requested: {offer['Requested Item']}", use_container_width=True)

    st.markdown(f"**Status:** {offer['Status']}")
    other_user = offer["Offering Trader"] if user_role == "received" else offer["Receiving Trader"]
    st.markdown(f"**Other Trader:** {other_user}")

    # Fairness score
    fairness_resp = requests.get(f"http://api-test:4000/offers/fairness/{offer['Offer ID']}")
    if fairness_resp.status_code == 200:
        fairness = fairness_resp.json()[0]["Fairness Score"]
        st.markdown(f"**Fairness Score:** {fairness}")
    else:
        st.warning("Couldn't fetch fairness score.")

    if allow_status_change:
        options = restrict_status_options or ["Pending", "Accepted", "Rejected"]
        new_status = st.selectbox(
            f"**Update status:**",
            options,
            index=options.index(offer["Status"]) if offer["Status"] in options else 0,
            key=f"status_select_{offer['Offer ID']}"
        )
        if st.button("💾 Update Status", key=f"update_btn_{offer['Offer ID']}"):
            update_payload = {
                "offer_id": offer["Offer ID"],
                "status": new_status,
                "offering_user": offer["Offering Trader ID"],
                "receiving_user": offer["Receiving Trader ID"],
                "offered_item": offer["Offered Item"],
                "requested_item": offer["Requested Item"]
            }
            put_resp = requests.put("http://api-test:4000/offers/update-status", json=update_payload)
            if put_resp.status_code == 200:
                st.success("Status updated. Refresh to see changes.")
            else:
                st.error("Failed to update status.")
    st.markdown("---")

# Tab 1: Received Offers (with status update options)
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
                    restrict_status_options=["Pending", "Rejected"]  # ← 🔥 Only allow these
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
            role = "received" if offer["Receiving Trader ID"] == user_id else "proposed"
            with st.container():
                display_offer_card(offer, role)