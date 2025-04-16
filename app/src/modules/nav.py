# Idea borrowed from https://github.com/fsmosca/sample-streamlit-authenticator

# This file has function to add certain functionality to the left side bar of the app

import streamlit as st


#### ------------------------ General ------------------------
def HomeNav():
    st.sidebar.page_link("Home.py", label="Home", icon="🏠")


def AboutPageNav():
    st.sidebar.page_link("pages/30_About.py", label="About", icon="🧠")

#### ------------------------ Examples for Role of user ------------------------
def UserHomeNav():
    st.sidebar.page_link(
        "pages/User_Home.py", label="User Home", icon="🏠"
    )

def UserProfileNav():
    st.sidebar.page_link(
        "pages/User_Profile.py", label="User Profile", icon="👤"
    )

def UserItemsNav():
    st.sidebar.page_link(
        "pages/View_User_Items.py", label="View User Items", icon="📦"
    )

def UserOffersNav():
    st.sidebar.page_link("pages/User_Offers.py", label="View Offers", icon="🔀")

def UserFindItemsNav():
    st.sidebar.page_link("pages/User_Find_Items.py", label="View Other Items", icon="🪞")


# #### ------------------------ Examples for Role of pol_strat_advisor ------------------------
# def PolStratAdvHomeNav():
#     st.sidebar.page_link(
#         "pages/00_Pol_Strat_Home.py", label="Political Strategist Home", icon="👤"
#     )

# def NewProductNav():
#     st.sidebar.page_link("pages/14_NewProduct.py", label="New Product", icon="💻")

# def WorldBankVizNav():
#     st.sidebar.page_link(
#         "pages/01_World_Bank_Viz.py", label="World Bank Visualization", icon="🏦"
#     )


# def MapDemoNav():
#     st.sidebar.page_link("pages/02_Map_Demo.py", label="Map Demonstration", icon="🗺️")


# ## ------------------------ Examples for Role of usaid_worker ------------------------
# def ApiTestNav():
#     st.sidebar.page_link("pages/12_API_Test.py", label="Test the API", icon="🛜")


# def PredictionNav():
#     st.sidebar.page_link(
#         "pages/11_Prediction_Page.py", label="Regression Prediction", icon="📈"
#     )

def PredictionNav():
    st.sidebar.page_link(
        "pages/11_ML_Prediction.py", label="Regression Prediction", icon="📈"
    )


# def ClassificationNav():
#     st.sidebar.page_link(
#         "pages/13_Classification.py", label="Classification Demo", icon="🌺"
#     )

#### ------------------------ Role of Data Analyst ------------------------
def DataAnalystHomeNav():
    st.sidebar.page_link(
        "pages/Data_Analyst_Home.py", label="Data Analyst Home", icon="💻"
    )

def DataAnalystWriteReportNav(): 
    st.sidebar.page_link(
        "pages/Data_Analyst_Write_Report.py", label="Write Analysis", icon="📃"
    )

def DataAnalystGetReportNav(): 
    st.sidebar.page_link(
        "pages/Data_Analyst_View_Reports.py", label="Get Analysis", icon="📁"
    )

#### ------------------------ System Admin Role ------------------------
def AdminPageNav():
    st.sidebar.page_link("pages/20_Admin_Home.py", label="System Admin", icon="🖥️")
    st.sidebar.page_link(
        "pages/21_ML_Model_Mgmt.py", label="ML Model Management", icon="🏢"
    )
    st.sidebar.page_link("pages/System_Admin_Home.py", label="System Admin Home", icon="🖥️")
    st.sidebar.page_link("pages/User_Reports.py", label="View Reports Data", icon="📈")
    st.sidebar.page_link("pages/Update_User_Reports.py", label="Update User Reports", icon="👤")
    st.sidebar.page_link("pages/Admin_Report.py", label = "Admin Reports", icon = "🏦")
    st.sidebar.page_link("pages/Item_Delete.py", label = "Delete Items", icon = "❌")

#### ------------------------ System Admin Role ------------------------
def SocialMediaEmployeePageNav():
    st.sidebar.page_link("pages/SME_Home.py", label="SME Homepage", icon="🖥️")
    st.sidebar.page_link(
        "pages/SME_New_Post.py", label="Create New Post", icon="🖥️"
    )

# --------------------------------Links Function -----------------------------------------------
def SideBarLinks(show_home=False):
    """
    This function handles adding links to the sidebar of the app based upon the logged-in user's role, which was put in the streamlit session_state object when logging in.
    """

    # add a logo to the sidebar always
    st.sidebar.image("assets/logo.png", width=150)

    # If there is no logged in user, redirect to the Home (Landing) page
    if "authenticated" not in st.session_state:
        st.session_state.authenticated = False
        st.switch_page("Home.py")

    if show_home:
        # Show the Home page link (the landing page)
        HomeNav()

    # Show the other page navigators depending on the users' role.
    if st.session_state["authenticated"]:

        if st.session_state["role"] == "user":
            # Show User Home page link
            UserHomeNav()

            # Show User Profile page link
            UserProfileNav()

            # Show User Items page link
            UserItemsNav()

            # Show User Offers page link
            UserOffersNav()

            # Show Find Items page link
            UserFindItemsNav()

        # If the user is an administrator, give them access to the administrator pages
        if st.session_state["role"] == "administrator":
            AdminPageNav()
        
        if st.session_state["role"] == "data_analyst": 
            DataAnalystHomeNav()
            DataAnalystGetReportNav() 
            DataAnalystWriteReportNav()
            

        if st.session_state["role"] == "sme":
            SocialMediaEmployeePageNav()


    # Always show the About page at the bottom of the list of links
    AboutPageNav()

    if st.session_state["authenticated"]:
        # Always show a logout button if there is a logged in user
        if st.sidebar.button("Logout"):
            del st.session_state["role"]
            del st.session_state["authenticated"]
            st.switch_page("Home.py")

