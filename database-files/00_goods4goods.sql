DROP DATABASE IF EXISTS goods4goods;

CREATE DATABASE IF NOT EXISTS goods4goods;

USE goods4goods;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "Admin"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `Admin` (
    `admin_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL
);

# ---------------------------------------------------------------------- #
# Add table "Analyst"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE Analyst(
    analyst_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstName varchar(50),
    lastName varchar(50),
    reports_to int NOT NULL,
    FOREIGN KEY (reports_to) REFERENCES Admin(admin_id)
);

# ---------------------------------------------------------------------- #
# Add table "Analysis"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE Analysis(
    analysis_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    start_date datetime,
    end_date datetime,
    written_analysis TEXT,
    analyst_id int NOT NULL,
    FOREIGN KEY (analyst_id) REFERENCES Analyst(analyst_id)
);

# ---------------------------------------------------------------------- #
# Add table "User"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE User(
    user_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstName varchar(50),
    lastName varchar(50),
    bio tinytext,
    createdDate datetime DEFAULT CURRENT_TIMESTAMP,
    email varchar(75) NOT NULL UNIQUE,
    street varchar(50),
    city varchar(50),
    state varchar(50),
    zipcode varchar(50)
);

# ---------------------------------------------------------------------- #
# Add table "StatusCodes"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `StatusCodes` (
    `status_code_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `status_name` varchar(100) NOT NULL
);

# ---------------------------------------------------------------------- #
# Add table "Item"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `Item` (
    `item_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `posted_by` INTEGER NOT NULL,
    `description` tinytext,
    `product_name` varchar(200),
    `image_url` varchar(700),
    active tinyint(1) DEFAULT 1 NOT NULL,
    `target_price` INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (posted_by) REFERENCES User (user_id),
    CHECK ( target_price > 0 )
);

# ---------------------------------------------------------------------- #
# Add table "Offer"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `Offer` (
    `offer_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `offering_user` INTEGER NOT NULL,
    `receiving_user` INTEGER NOT NULL,
    `status` INTEGER NOT NULL,
    `item_offered_id` INTEGER NOT NULL,
    `item_requested_id` INTEGER NOT NULL,
    createdDate datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (offering_user) REFERENCES User (user_id),
    FOREIGN KEY (receiving_user) REFERENCES User (user_id),
    FOREIGN KEY (status) REFERENCES StatusCodes (status_code_id),
    FOREIGN KEY (item_offered_id) REFERENCES Item (item_id) ON DELETE CASCADE,
    FOREIGN KEY (item_requested_id) REFERENCES Item (item_id) ON DELETE CASCADE
);

# ---------------------------------------------------------------------- #
# Add table "Rating"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE Rating(
    rating_number float,
    rated_by int NOT NULL,
    rating_for int NOT NULL,
    offer_id int NOT NULL,
    FOREIGN KEY (rated_by) REFERENCES User(user_id),
    FOREIGN KEY (rating_for) REFERENCES User(user_id),
    FOREIGN KEY (offer_id) REFERENCES Offer(offer_id),
    PRIMARY KEY (rated_by, rating_for, offer_id)
);

# ---------------------------------------------------------------------- #
# Add table "SME"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE SME(
    sme_id int NOT NULL PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    firstName varchar(50),
    lastName varchar(50),
    email varchar(75) NOT NULL UNIQUE,
    street varchar(50),
    city varchar(50),
    state varchar(50),
    zipcode varchar(50)
);

# ---------------------------------------------------------------------- #
# Add table "Posts"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE Posts(
    post_id int NOT NULL PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    post_title varchar(75) NOT NULL,
    description tinytext,
    `show` bool,
    posted_by int NOT NULL,
    createdDate datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (posted_by) REFERENCES SME(sme_id)
);

# ---------------------------------------------------------------------- #
# Add table "ErrorCodes"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `ErrorCodes` (
    `error_code_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `error_name` varchar(100) NOT NULL
);

# ---------------------------------------------------------------------- #
# Add table "AdminReport"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `AdminReport` (
    `report_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `report_code` INTEGER NOT NULL,
    `description` tinytext,
    `status` INTEGER NOT NULL,
    `reporter_id` INTEGER NOT NULL,
    `reported_id` INTEGER NOT NULL,
    `offer_id` INTEGER NOT NULL,
    createdDate datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (report_code) REFERENCES ErrorCodes (error_code_id),
    FOREIGN KEY (status) REFERENCES StatusCodes (status_code_id),
    FOREIGN KEY (reporter_id) REFERENCES Admin (admin_id),
    FOREIGN KEY (reported_id) REFERENCES User (user_id)
);

# ---------------------------------------------------------------------- #
# Add table "UserReport"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `UserReport` (
    `report_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `report_code` INTEGER NOT NULL,
    `description` tinytext,
    `status` INTEGER NOT NULL DEFAULT 1,
    `reporter_id` INTEGER NOT NULL,
    `reported_id` INTEGER NOT NULL,
    `offer_id` INTEGER NOT NULL,
    `reviewer_id` INTEGER,
    createdDate datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (report_code) REFERENCES ErrorCodes (error_code_id),
    FOREIGN KEY (status) REFERENCES StatusCodes (status_code_id),
    FOREIGN KEY (reporter_id) REFERENCES User (user_id),
    FOREIGN KEY (reported_id) REFERENCES User (user_id),
    FOREIGN KEY (reviewer_id) REFERENCES Admin (admin_id)
);

# ---------------------------------------------------------------------- #
# Add table "FavoriteItems"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `FavoriteItems` (
    `item_id` INTEGER NOT NULL,
    `sme_id` INTEGER NOT NULL,
     PRIMARY KEY(item_id, sme_id),
     FOREIGN KEY(item_id) REFERENCES Item (item_id) ON DELETE CASCADE,
     FOREIGN KEY(sme_id) REFERENCES SME (sme_id)
);
