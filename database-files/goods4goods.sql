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
# Insert into "Admin"                                                 #
# ---------------------------------------------------------------------- #

INSERT INTO Admin (first_name, last_name) VALUES
('Alice', 'Smith'),
('Bob', 'Williams'),
('Charlie', 'Davis');

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
# Insert into "Analyst"                                                 #
# ---------------------------------------------------------------------- #

INSERT INTO Analyst (firstName, lastName, reports_to) VALUES
('Barney', 'Johnson', 2),
('Kaitlin', 'Moore', 1),
('Greg', 'Erikson', 3);


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
# Insert into "Analysis"                                                 #
# ---------------------------------------------------------------------- #
INSERT INTO Analysis (start_date,end_date,written_analysis,analyst_id) VALUES
('2024-03-01 08:30:00', '2024-03-02 17:00:00', 'Top Performing Sellers for September 2024: Frannie, Esha, Anusha, Erika, and Emma.', 3),
( '2024-03-05 10:00:00', '2024-03-06 15:30:00', 'Total Items Traded in the month of February 2025: 72', 2),
('2024-03-10 09:45:00', '2024-03-12 12:00:00', 'Most trusted users (best ratings): Emma, Erika, Esha', 1);


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
# Insert into "User"                                                 #
# ---------------------------------------------------------------------- #
INSERT INTO User (firstName, lastName, bio, email) VALUES
('Emma', 'Johnson', 'Looking for new decorations and furniture to decorate my apartment, looking to trade my old furniture for new!', 'emma.johnson@example.com'),
('Sabrina', 'Matts', 'Looking to trade my old wardrobe for new clothes!', 'sabrina.matts@example.com'),
('Chris', 'Smith', 'Have a ton of old stuff I don''t use anymore, looking to trade it out.', 'chris.smith@example.com');

# ---------------------------------------------------------------------- #
# Add table "StatusCodes"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `StatusCodes` (
    `status_code_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `status_name` varchar(100) NOT NULL
);

# ---------------------------------------------------------------------- #
# Insert into "StatusCodes"                                                 #
# ---------------------------------------------------------------------- #
INSERT INTO StatusCodes (status_name) VALUES
('Pending'),
('Accepted'),
('Rejected'),
('In Progress');

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
    CHECK ( target_price > 0 )
);

# ---------------------------------------------------------------------- #
# Insert into "Item"                                                 #
# ---------------------------------------------------------------------- #
INSERT INTO Item (posted_by, description, product_name, image_url, target_price) VALUES
(1, 'Used coffee table in good condition.', 'Coffee Table', 'https://i.pinimg.com/736x/d8/c2/c9/d8c2c97d1ad844f0064afe00e3516920.jpg', 50),
(2, 'Gently used sofa set, comfortable.', 'Sofa Set', 'https://i.pinimg.com/736x/18/08/dc/1808dcedf3ad854977805c15d45d557c.jpg', 200),
(3, 'Vintage desk lamp, perfect for home office.', 'Desk Lamp', 'https://i.pinimg.com/736x/a1/2d/85/a12d8585003e9a171698980a0e859bb0.jpg', 30);

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
    FOREIGN KEY (item_offered_id) REFERENCES Item (item_id) ON DELETE RESTRICT,
    FOREIGN KEY (item_requested_id) REFERENCES Item (item_id) ON DELETE RESTRICT
);

# ---------------------------------------------------------------------- #
# Insert Into "Offer"                                                 #
# ---------------------------------------------------------------------- #

INSERT INTO Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) VALUES
(1, 2, 1, 1, 2),
(2, 3, 2, 3, 1),
(3, 1, 3, 2, 3);

# ---------------------------------------------------------------------- #
# Add table "Rating"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE Rating(
    rating_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rating_number float,
    rated_by int NOT NULL,
    rating_for int NOT NULL,
    offer_id int NOT NULL,
    FOREIGN KEY (rated_by) REFERENCES User(user_id),
    FOREIGN KEY (rating_for) REFERENCES User(user_id),
    FOREIGN KEY (offer_id) REFERENCES Offer(offer_id)
);

# ---------------------------------------------------------------------- #
# Insert into "Rating"                                                 #
# ---------------------------------------------------------------------- #
INSERT INTO Rating (rating_number,rated_by,rating_for, offer_id) VALUES
( 4, 2, 1,2),
( 5, 1, 2,1),
(4, 3, 1,3);

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
# Insert into "SME"                                                 #
# ---------------------------------------------------------------------- #
INSERT INTO SME (firstName,lastName,email, street, city, state, zipcode) VALUES
('Daniel', 'Kimmel', 'dkimm@gmail.com','Spruce Street', 'Boston','Massachusetts', '02115'),
('Scarlett', 'Cole', 'scole@gmail.com','Hillside Street', 'Boston', 'Massachusetts', '02120'),
('Jim', 'Scorn', 'jscorn@gmail.com','Maple Avenue','Bedford', 'New York', '10506');



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
# Insert into "Posts"                                                 #
# ---------------------------------------------------------------------- #
INSERT INTO Posts (post_title,description,`show`, posted_by) VALUES
('Sellers to Watch Out For', 'Based on app analyst data, I will be telling you who some of the highest performing users have been over the last week.', TRUE,2),
('Hottest Items to Trade Right Now', 'Based on app analyst data, here are some items that are always being traded for.', TRUE,1),
( 'Employee Picks: Top Items Looking for a Trade', 'Here are some of my favorite items from the Employee Picks Section - Check them out while they are available.', FALSE,3);
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "ErrorCodes"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `ErrorCodes` (
    `error_code_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `error_name` varchar(100) NOT NULL
);
INSERT INTO ErrorCodes (error_name) VALUES
('Invalid Item'),
('Expired Offer'),
('Broken Transaction');

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
INSERT INTO AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) VALUES
(1, 'Invalid item reported', 2, 1, 2, 2),
(2, 'Expired offer not processed', 1, 3, 1, 1);

# ---------------------------------------------------------------------- #
# Add table "UserReport"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `UserReport` (
    `report_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `report_code` INTEGER NOT NULL,
    `description` tinytext,
    `status` INTEGER NOT NULL,
    `reporter_id` INTEGER NOT NULL,
    `reported_id` INTEGER NOT NULL,
    `offer_id` INTEGER NOT NULL,
    `reviewer_id` INTEGER NOT NULL,
    createdDate datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (report_code) REFERENCES ErrorCodes (error_code_id),
    FOREIGN KEY (status) REFERENCES StatusCodes (status_code_id),
    FOREIGN KEY (reporter_id) REFERENCES User (user_id),
    FOREIGN KEY (reported_id) REFERENCES User (user_id),
    FOREIGN KEY (reviewer_id) REFERENCES Admin (admin_id)
);
INSERT INTO UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) VALUES
(3, 'Item condition not as described', 1, 2, 3, 1, 1),
(1, 'User made an offensive comment', 2, 1, 2, 3, 3);

# ---------------------------------------------------------------------- #
# Add table "FavoriteItems"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `FavoriteItems` (
    `item_id` INTEGER NOT NULL,
    `sme_id` INTEGER NOT NULL,
     PRIMARY KEY(item_id, sme_id),
     FOREIGN KEY(item_id) REFERENCES Item (item_id),
     FOREIGN KEY(sme_id) REFERENCES SME (sme_id)
);
INSERT INTO FavoriteItems (item_id, sme_id) VALUES
(1, 1),
(2, 2),
(3, 3);