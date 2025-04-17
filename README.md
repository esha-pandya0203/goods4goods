# Goods4Goods Project Repository

Goods4Goods is a data driven trade-based app where you can post items you no longer need and trade them for items you’ve been wanting. It’s the perfect solution for anyone looking to refresh their collection or declutter without spending money. Our platform allows users to list items they no longer need, specify what they’re looking for in return, and connect with reputable traders.

## Table of Contents

[Prerequisites](#Prerequisites)

[Current Project Components](#current-project-components)

[Installation](#Installation)

[Demo](#demo)

[Usage](#usage)

[Contributors](#Contributors)

## Prerequisites
- A GitHub Account
- A terminal-based git client or GUI Git client such as GitHub Desktop or the Git plugin for VSCode.
- VSCode with the Python Plugin
- A distribution of Python running on your laptop. The distro supported by the course is Anaconda or Miniconda.

## Current Project Components

Currently, there are three major components that will each run in their own Docker Containers:

- Streamlit App in the `./app` directory
- Flask REST api in the `./api` directory
- MySQL Database that will be initialized with SQL script files from the `./database-files` directory


## Installation

1. Clone the Project Repo to your local machine: "git clone https://github.com/esha-pandya0203/goods4goods.git"
2. Set up the `.env` file in the `api` folder based on the `.env.template` file.
3. For running the project containers:
   1. `docker compose up -d` to start all the containers in the background
   2. `docker compose down` to shutdown and delete the containers
   3. `docker compose up db -d` only start the database container (replace db with api or app for the other two services as needed)
   4. `docker compose stop` to "turn off" the containers but not delete them.
4. Once the containers have been created, and our being run, go to "localhost:8501" in the browser of your choosing to access goods4goods.


## Demo

Link to our demo: https://drive.google.com/file/d/1gsCdsV5zsWeWuaxMSI0h2tybzUaWOk5w/view?usp=drive_link


## Usage

This project uses RBAC (Role-Based Access Control) to allow users to assume different possible roles within the app without actually using user authentication. For Goods4Goods, these roles include: A User (Emma Johnson), A System Adminstrator (Chloe Smith), An App Data Analyst (Barney), and a Social Media Employee (Daniel Kimmel)

Each of these four users have their own set of pages for which they can access. 

**User (Emma Johnson)**:
As a User, Emma can view, upload, edit, and delete her items on the website, as well as view other users’ items and profiles. She can also manage or create trade offers, and report and rate trades that she has participated in.

**System Administrator (Chloe Smith)**:
As a System Administrator, Chloe has access to view all reports data. This means any reports made either by a user or an administrator of the app regarding a user, an item, or a technical issue. Chloe also has the ability to update the status of user reports, or delete them entirely as she sees fit. In addition, Chloe can create an Admin Report if she notices something herself. Finally, Chloe can delete items that are listed on the app in the case that they are reported and are found fraudulent or innapropriate in some way.

**App Data Analyst (Barney)**:
As a Data Analyst, Barney can view different metrics related to user engagement, user reports, item popularity, and offer status distribution to view ongoing trends on the app. After analyzing these metrics, Barney can write a new analysis to make note of these trends and view previous analyses to track the progress of the app. 

**Social Media Employee (Daniel Kimmel)**:
Social Media Employees, like Daniel, currently can manage all social media posts, create a new social media post, and view his own profile information. When managing all social media posts, he has the option to change post visibility (hide/show) for users, delete posts, or view a single post in more detail and edit a post's content. Editing a post requires viewing said post first.


## Contributors
Francesca Cambareri (cambareri.f@northeastern.edu)

Erika Ding (ding.er@northeastern.edu)

Anusha Narang (narang.an@northeastern.edu)

Esha Pandya (pandya.e@northeastern.edu )
