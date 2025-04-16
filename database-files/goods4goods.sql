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


insert into Admin (first_name, last_name) values ('sapien', 'platea');
insert into Admin (first_name, last_name) values ('eget', 'convallis');
insert into Admin (first_name, last_name) values ('bibendum', 'accumsan');
insert into Admin (first_name, last_name) values ('aliquet', 'vel');
insert into Admin (first_name, last_name) values ('a', 'sed');
insert into Admin (first_name, last_name) values ('tortor', 'libero');
insert into Admin (first_name, last_name) values ('molestie', 'quisque');
insert into Admin (first_name, last_name) values ('nascetur', 'pede');
insert into Admin (first_name, last_name) values ('tempor', 'sit');
insert into Admin (first_name, last_name) values ('primis', 'augue');
insert into Admin (first_name, last_name) values ('rutrum', 'eget');
insert into Admin (first_name, last_name) values ('id', 'nisi');
insert into Admin (first_name, last_name) values ('platea', 'pellentesque');
insert into Admin (first_name, last_name) values ('suspendisse', 'ante');
insert into Admin (first_name, last_name) values ('varius', 'sit');
insert into Admin (first_name, last_name) values ('enim', 'aliquet');
insert into Admin (first_name, last_name) values ('cubilia', 'vestibulum');
insert into Admin (first_name, last_name) values ('morbi', 'pretium');
insert into Admin (first_name, last_name) values ('posuere', 'luctus');
insert into Admin (first_name, last_name) values ('ut', 'elit');
insert into Admin (first_name, last_name) values ('at', 'lobortis');
insert into Admin (first_name, last_name) values ('in', 'in');
insert into Admin (first_name, last_name) values ('at', 'odio');
insert into Admin (first_name, last_name) values ('varius', 'elit');
insert into Admin (first_name, last_name) values ('primis', 'ac');
insert into Admin (first_name, last_name) values ('platea', 'suspendisse');
insert into Admin (first_name, last_name) values ('nulla', 'metus');
insert into Admin (first_name, last_name) values ('posuere', 'turpis');
insert into Admin (first_name, last_name) values ('magna', 'in');
insert into Admin (first_name, last_name) values ('volutpat', 'tristique');
insert into Admin (first_name, last_name) values ('vivamus', 'ipsum');
insert into Admin (first_name, last_name) values ('dapibus', 'phasellus');
insert into Admin (first_name, last_name) values ('nulla', 'turpis');
insert into Admin (first_name, last_name) values ('venenatis', 'ac');
insert into Admin (first_name, last_name) values ('in', 'nulla');
insert into Admin (first_name, last_name) values ('vel', 'in');
insert into Admin (first_name, last_name) values ('sapien', 'ridiculus');
insert into Admin (first_name, last_name) values ('lorem', 'nam');
insert into Admin (first_name, last_name) values ('id', 'sapien');
insert into Admin (first_name, last_name) values ('convallis', 'praesent');
insert into Admin (first_name, last_name) values ('accumsan', 'nulla');
insert into Admin (first_name, last_name) values ('praesent', 'pellentesque');
insert into Admin (first_name, last_name) values ('tempus', 'maecenas');
insert into Admin (first_name, last_name) values ('proin', 'porttitor');
insert into Admin (first_name, last_name) values ('cras', 'nunc');
insert into Admin (first_name, last_name) values ('amet', 'cras');
insert into Admin (first_name, last_name) values ('in', 'libero');
insert into Admin (first_name, last_name) values ('in', 'parturient');
insert into Admin (first_name, last_name) values ('hac', 'vel');
insert into Admin (first_name, last_name) values ('adipiscing', 'non');
insert into Admin (first_name, last_name) values ('ipsum', 'consectetuer');
insert into Admin (first_name, last_name) values ('leo', 'elementum');
insert into Admin (first_name, last_name) values ('quam', 'vitae');
insert into Admin (first_name, last_name) values ('vivamus', 'et');
insert into Admin (first_name, last_name) values ('nisi', 'pede');



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
('Chris', 'Smith', 'Have a ton of old stuff I don''t use anymore, looking to trade it out.', 'chris.smith@example.com'),
('Rio', 'Sanchez', 'Moving soon so looking to trade away lots of stuff.', 'rio.sanchez@example.com'),
('Jeremy', 'Boyer', 'Have way too much stuff! Open to any kinds of trades', 'jeremy.boyer@example.com'),
('Susan', 'Buckley', 'My two kids grow up way too fast, so I''m making space in their closets!', 'susan.buckley@example.com'),
('Tanya', 'Bradley', 'Lots of my items are from hobbies I picked up and stopped doing 2 weeks later haha!', 'tanya.bradley@example.com'),
('Liyana', 'Caldwell', 'Full-time thrifter and love a good deal', 'liyana.caldwell@example.com'),
('Melvin', 'Nash', 'Love making pottery but never have enough space!', 'melvin.nash@example.com'),
('Angelina', 'Peterson', 'Die-hard book lover!!', 'angelina.peterson@example.com');

INSERT INTO User (firstName, lastName, bio, email) VALUES ('Ardys', 'Brownlow', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 'abrownlow0@ftc.gov');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Sidoney', 'Killock', 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis', 'skillock1@discovery.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Sammie', 'Kauble', 'quisque porta volutpat erat quisque erat eros viverra eget congue eget', 'skauble2@java.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Kennie', 'Prator', 'venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam', 'kprator3@goo.gl');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Salvatore', 'Hallex', 'luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 'shallex4@typepad.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Conrade', 'Gillebride', 'odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis', 'cgillebride5@thetimes.co.uk');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Kain', 'Dursley', 'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam', 'kdursley6@1688.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Kimmy', 'Duchart', 'eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse', 'kduchart7@simplemachines.org');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Jaynell', 'Lattie', 'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 'jlattie8@harvard.edu');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Maurits', 'Castelli', 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque', 'mcastelli9@java.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Michel', 'Cantillon', 'sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper', 'mcantillona@shop-pro.jp');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Herschel', 'Petto', 'pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', 'hpettob@shutterfly.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Rana', 'O''Sheils', 'tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim', 'rosheilsc@businessweek.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Dalton', 'Hune', 'nec dui luctus rutrum nulla tellus in sagittis dui vel nisl', 'dhuned@icio.us');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Ezmeralda', 'Realph', 'elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas', 'erealphe@squidoo.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Carlie', 'Becom', 'consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 'cbecomf@vk.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Jamie', 'Campbell', 'diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed', 'jcampbellg@columbia.edu');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Hugibert', 'Mager', 'nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus', 'hmagerh@angelfire.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Arly', 'Dickons', 'in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod', 'adickonsi@harvard.edu');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('David', 'Axtonne', 'odio cras mi pede malesuada in imperdiet et commodo vulputate justo in', 'daxtonnej@nationalgeographic.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Bunnie', 'Laing', 'in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit', 'blaingk@vk.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Susann', 'Scawn', 'ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat', 'sscawnl@prweb.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Doroteya', 'Lewsy', 'consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae', 'dlewsym@un.org');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Mandy', 'Riby', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio', 'mribyn@slashdot.org');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Margette', 'McCully', 'diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut', 'mmccullyo@yelp.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Tiffie', 'Langmaid', 'cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui', 'tlangmaidp@webnode.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Hannis', 'Spindler', 'vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque', 'hspindlerq@skyrock.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Rebecca', 'Tippell', 'pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est', 'rtippellr@flickr.com');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Aldrich', 'Beiderbecke', 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in', 'abeiderbeckes@aboutads.info');
INSERT INTO User (firstName, lastName, bio, email) VALUES ('Bronson', 'Gavigan', 'magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien', 'bgavigant@nbcnews.com');

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

insert into StatusCodes (status_name) values ('pede venenatis non');
insert into StatusCodes (status_name) values ('nec molestie');
insert into StatusCodes (status_name) values ('duis mattis');
insert into StatusCodes (status_name) values ('sit amet nulla');
insert into StatusCodes (status_name) values ('sapien dignissim vestibulum');
insert into StatusCodes (status_name) values ('sapien');
insert into StatusCodes (status_name) values ('molestie nibh in');
insert into StatusCodes (status_name) values ('quis orci eget orci');
insert into StatusCodes (status_name) values ('a pede posuere nonummy');
insert into StatusCodes (status_name) values ('justo maecenas rhoncus aliquam lacus');
insert into StatusCodes (status_name) values ('nec');
insert into StatusCodes (status_name) values ('est risus auctor sed tristique');
insert into StatusCodes (status_name) values ('magnis');
insert into StatusCodes (status_name) values ('eget tincidunt eget tempus');
insert into StatusCodes (status_name) values ('erat nulla tempus vivamus in');
insert into StatusCodes (status_name) values ('turpis sed ante');
insert into StatusCodes (status_name) values ('cursus id turpis integer aliquet');
insert into StatusCodes (status_name) values ('ridiculus mus');
insert into StatusCodes (status_name) values ('dictumst morbi vestibulum velit id');
insert into StatusCodes (status_name) values ('consequat');
insert into StatusCodes (status_name) values ('sapien placerat');
insert into StatusCodes (status_name) values ('feugiat');
insert into StatusCodes (status_name) values ('sit amet nulla quisque');
insert into StatusCodes (status_name) values ('dapibus duis at velit');
insert into StatusCodes (status_name) values ('volutpat in congue etiam justo');
insert into StatusCodes (status_name) values ('mollis molestie lorem quisque');
insert into StatusCodes (status_name) values ('in hac');
insert into StatusCodes (status_name) values ('id');
insert into StatusCodes (status_name) values ('nisi nam ultrices libero');
insert into StatusCodes (status_name) values ('quis');
insert into StatusCodes (status_name) values ('euismod scelerisque quam');
insert into StatusCodes (status_name) values ('tellus');
insert into StatusCodes (status_name) values ('consequat ut nulla sed');
insert into StatusCodes (status_name) values ('ornare consequat lectus');
insert into StatusCodes (status_name) values ('pede');
insert into StatusCodes (status_name) values ('congue diam id ornare');
insert into StatusCodes (status_name) values ('luctus et ultrices posuere cubilia');
insert into StatusCodes (status_name) values ('phasellus id sapien');
insert into StatusCodes (status_name) values ('sit amet cursus');
insert into StatusCodes (status_name) values ('venenatis non sodales sed');
insert into StatusCodes (status_name) values ('non quam nec dui luctus');
insert into StatusCodes (status_name) values ('nisi vulputate');
insert into StatusCodes (status_name) values ('mi');
insert into StatusCodes (status_name) values ('donec diam neque vestibulum eget');
insert into StatusCodes (status_name) values ('ultrices libero non mattis pulvinar');
insert into StatusCodes (status_name) values ('pede ac');
insert into StatusCodes (status_name) values ('nascetur ridiculus mus');
insert into StatusCodes (status_name) values ('faucibus cursus urna ut tellus');
insert into StatusCodes (status_name) values ('proin eu mi nulla ac');
insert into StatusCodes (status_name) values ('nisi eu');
insert into StatusCodes (status_name) values ('pharetra magna vestibulum aliquet ultrices');
insert into StatusCodes (status_name) values ('ut odio cras mi');
insert into StatusCodes (status_name) values ('praesent blandit lacinia erat vestibulum');
insert into StatusCodes (status_name) values ('tristique fusce');
insert into StatusCodes (status_name) values ('in sagittis dui vel');


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
(3, 'Vintage desk lamp, perfect for home office.', 'Desk Lamp', 'https://i.pinimg.com/736x/a1/2d/85/a12d8585003e9a171698980a0e859bb0.jpg', 30),
(2, 'Modern recliner in excellent condition.', 'Recliner Chair', 'https://i.pinimg.com/474x/4b/d4/09/4bd4094db0140173aa820bcb242888d8.jpg', 180),
(2, 'Stylish round dining table, slightly used.', 'Dining Table', 'https://i.pinimg.com/474x/0c/44/1c/0c441c0084f0fc0d2fe6cba8a53cd98c.jpg', 120),
(2, 'Single bed frame, lightly used with storage.', 'Bed Frame', 'https://i.pinimg.com/474x/80/64/79/806479b6c6ffb97c70590758967db3c9.jpg', 75),
(3, 'Compact microwave, works perfectly.', 'Microwave', 'https://i.pinimg.com/474x/c7/13/3d/c7133d0600780562444e21e03e8abce7.jpg', 50),
(3, 'Full-size bookshelf, light wood finish.', 'Bookshelf', 'https://i.pinimg.com/474x/f8/77/09/f877099a1aba59b8e40755ef7efed05a.jpg', 90);;

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


insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (37, 12, 40, 7, 2);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (20, 11, 48, 3, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (34, 38, 44, 3, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (40, 21, 42, 1, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (40, 10, 30, 2, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (40, 35, 42, 1, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (5, 13, 19, 3, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (24, 29, 18, 7, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (6, 9, 44, 6, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (38, 8, 25, 8, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (4, 35, 22, 4, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (27, 32, 50, 6, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (16, 29, 48, 2, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (21, 12, 7, 3, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (13, 32, 7, 2, 2);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (31, 14, 5, 7, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (27, 20, 28, 2, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (23, 16, 47, 2, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (36, 26, 44, 7, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (22, 7, 7, 7, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (33, 17, 29, 8, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (11, 38, 6, 8, 2);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (34, 32, 11, 6, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (1, 35, 30, 4, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (32, 29, 10, 4, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (9, 15, 3, 7, 2);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (39, 22, 16, 4, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (22, 7, 18, 6, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (35, 18, 33, 4, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (1, 15, 1, 3, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (22, 23, 24, 7, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (30, 6, 10, 6, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (39, 12, 5, 4, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (24, 20, 41, 1, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (40, 31, 25, 8, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (2, 10, 42, 4, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (8, 37, 48, 6, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (14, 3, 34, 7, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (2, 26, 2, 6, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (1, 18, 31, 8, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (5, 25, 47, 7, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (5, 33, 46, 7, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (32, 8, 35, 1, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (5, 37, 43, 8, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (35, 34, 22, 7, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (4, 37, 45, 6, 2);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (34, 22, 50, 8, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (36, 38, 35, 4, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (17, 7, 9, 8, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (9, 29, 7, 6, 6);

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

insert into ErrorCodes (error_name) values ('risus semper porta volutpat');
insert into ErrorCodes (error_name) values ('vestibulum velit');
insert into ErrorCodes (error_name) values ('ipsum primis in faucibus');
insert into ErrorCodes (error_name) values ('interdum mauris non');
insert into ErrorCodes (error_name) values ('vivamus vestibulum');
insert into ErrorCodes (error_name) values ('nisl venenatis');
insert into ErrorCodes (error_name) values ('posuere cubilia curae nulla');
insert into ErrorCodes (error_name) values ('orci eget');
insert into ErrorCodes (error_name) values ('ultrices');
insert into ErrorCodes (error_name) values ('vehicula condimentum');
insert into ErrorCodes (error_name) values ('aliquam');
insert into ErrorCodes (error_name) values ('fusce congue diam');
insert into ErrorCodes (error_name) values ('maecenas leo odio');
insert into ErrorCodes (error_name) values ('tincidunt');
insert into ErrorCodes (error_name) values ('ac tellus semper interdum mauris');
insert into ErrorCodes (error_name) values ('arcu libero');
insert into ErrorCodes (error_name) values ('condimentum');
insert into ErrorCodes (error_name) values ('volutpat erat quisque');
insert into ErrorCodes (error_name) values ('a libero nam');
insert into ErrorCodes (error_name) values ('non mattis pulvinar');
insert into ErrorCodes (error_name) values ('consequat ut nulla');
insert into ErrorCodes (error_name) values ('eget congue');
insert into ErrorCodes (error_name) values ('mauris');
insert into ErrorCodes (error_name) values ('dui vel');
insert into ErrorCodes (error_name) values ('auctor gravida');
insert into ErrorCodes (error_name) values ('nulla suspendisse potenti');
insert into ErrorCodes (error_name) values ('ante vestibulum');
insert into ErrorCodes (error_name) values ('ut erat id');
insert into ErrorCodes (error_name) values ('donec ut mauris eget');
insert into ErrorCodes (error_name) values ('rutrum at lorem integer tincidunt');
insert into ErrorCodes (error_name) values ('turpis sed ante vivamus');
insert into ErrorCodes (error_name) values ('ligula pellentesque ultrices phasellus');
insert into ErrorCodes (error_name) values ('sed ante vivamus');
insert into ErrorCodes (error_name) values ('mi in');
insert into ErrorCodes (error_name) values ('semper rutrum nulla nunc');
insert into ErrorCodes (error_name) values ('eu');
insert into ErrorCodes (error_name) values ('pretium');
insert into ErrorCodes (error_name) values ('faucibus orci luctus et');
insert into ErrorCodes (error_name) values ('in felis');
insert into ErrorCodes (error_name) values ('in sapien iaculis');
insert into ErrorCodes (error_name) values ('eleifend donec ut dolor');
insert into ErrorCodes (error_name) values ('consequat ut nulla');
insert into ErrorCodes (error_name) values ('sapien');
insert into ErrorCodes (error_name) values ('pede malesuada in imperdiet');
insert into ErrorCodes (error_name) values ('tortor duis mattis egestas');
insert into ErrorCodes (error_name) values ('pede ullamcorper augue');
insert into ErrorCodes (error_name) values ('varius nulla facilisi cras non');
insert into ErrorCodes (error_name) values ('diam');
insert into ErrorCodes (error_name) values ('gravida sem praesent id');
insert into ErrorCodes (error_name) values ('odio curabitur convallis duis');
insert into ErrorCodes (error_name) values ('ornare imperdiet sapien urna pretium');
insert into ErrorCodes (error_name) values ('condimentum curabitur in');
insert into ErrorCodes (error_name) values ('nisi venenatis tristique fusce congue');
insert into ErrorCodes (error_name) values ('nulla');
insert into ErrorCodes (error_name) values ('ipsum');


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


insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (42, 'platea dictumst', 13, 6, 26, 1);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (28, 'vestibulum eget vulputate ut ultrices', 30, 39, 31, 9);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (47, 'amet nulla', 51, 9, 25, 43);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'vulputate', 22, 40, 13, 1);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (45, 'eros suspendisse accumsan tortor', 42, 1, 8, 25);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'nullam porttitor lacus at turpis', 17, 12, 10, 35);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (14, 'vel sem sed', 48, 13, 34, 41);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (15, 'nulla elit ac nulla sed', 27, 15, 12, 2);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'felis fusce posuere', 33, 17, 38, 24);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (14, 'eget orci vehicula condimentum', 2, 34, 26, 41);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (8, 'cras non velit', 49, 20, 11, 4);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (54, 'libero nam dui proin leo', 12, 40, 6, 3);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (11, 'sapien quis libero nullam sit', 45, 9, 27, 11);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (35, 'eleifend luctus', 16, 19, 21, 8);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (29, 'et', 16, 18, 15, 18);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (36, 'amet turpis elementum ligula vehicula', 54, 28, 31, 13);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (31, 'nisi venenatis tristique fusce', 37, 29, 15, 32);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (13, 'mauris non ligula pellentesque', 25, 26, 14, 38);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (38, 'in magna bibendum imperdiet', 48, 35, 11, 25);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (18, 'justo', 51, 13, 12, 42);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (39, 'etiam pretium', 48, 11, 29, 8);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (36, 'nisl venenatis lacinia aenean sit', 42, 38, 15, 26);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (17, 'non pretium quis', 15, 12, 7, 41);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (21, 'ornare imperdiet sapien urna', 55, 17, 17, 7);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (9, 'hendrerit at vulputate vitae', 2, 34, 27, 38);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (12, 'vivamus tortor', 9, 11, 34, 46);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (42, 'ipsum integer a', 31, 12, 17, 28);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (35, 'posuere cubilia curae mauris viverra', 24, 32, 7, 7);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (21, 'sed magna at', 11, 6, 24, 13);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (47, 'rutrum nulla', 52, 13, 7, 30);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (32, 'felis sed', 42, 11, 32, 31);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (32, 'ipsum praesent blandit lacinia erat', 23, 30, 10, 4);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (38, 'at ipsum', 37, 31, 16, 34);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'vestibulum', 12, 39, 30, 16);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (55, 'augue', 5, 24, 36, 31);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (42, 'velit eu est congue', 6, 3, 14, 9);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (42, 'vel nulla eget eros elementum', 24, 13, 34, 22);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (23, 'risus praesent', 17, 12, 38, 23);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (17, 'erat', 48, 31, 14, 32);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (50, 'id ornare imperdiet', 49, 6, 32, 31);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (7, 'fermentum justo nec', 55, 31, 11, 34);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (4, 'id sapien in sapien iaculis', 16, 16, 36, 20);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (19, 'pellentesque eget nunc', 36, 16, 33, 6);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (24, 'ac nulla sed', 15, 35, 24, 35);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (29, 'blandit', 34, 25, 26, 16);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (25, 'cursus urna', 28, 11, 36, 26);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (15, 'ipsum', 19, 12, 8, 40);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (52, 'id sapien in sapien', 8, 26, 19, 11);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (51, 'maecenas leo odio condimentum', 26, 14, 20, 30);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (7, 'in imperdiet et', 52, 24, 17, 15);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (26, 'morbi non quam nec', 3, 25, 4, 27);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (18, 'posuere cubilia curae', 14, 39, 9, 44);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (27, 'ut ultrices', 10, 21, 8, 10);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (8, 'at nibh in hac', 36, 17, 34, 43);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (40, 'nec euismod scelerisque', 42, 40, 31, 3);

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

insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (38, 'habitasse platea dictumst morbi', 8, 12, 22, 13, 9);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (46, 'pede malesuada in', 2, 9, 12, 10, 25);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (48, 'ut nulla sed accumsan', 20, 18, 9, 26, 22);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (8, 'ultrices aliquet maecenas', 26, 1, 21, 14, 40);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (22, 'elementum nullam', 43, 5, 27, 22, 16);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (45, 'at', 42, 21, 6, 31, 38);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (39, 'mi', 7, 33, 11, 35, 30);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (54, 'interdum mauris ullamcorper', 50, 40, 8, 15, 13);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (55, 'donec diam neque vestibulum eget', 47, 20, 7, 13, 34);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (24, 'justo in hac habitasse', 25, 34, 24, 35, 28);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (46, 'cum sociis', 20, 23, 11, 16, 4);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (24, 'erat volutpat in', 23, 30, 35, 44, 24);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (44, 'tempus semper est quam', 26, 8, 5, 36, 8);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (22, 'hac habitasse platea dictumst aliquam', 37, 39, 36, 8, 16);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (45, 'nibh in', 25, 19, 10, 37, 19);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (7, 'bibendum morbi', 10, 27, 40, 38, 39);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (35, 'ultrices posuere cubilia curae', 31, 6, 17, 11, 26);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (34, 'habitasse platea dictumst morbi vestibulum', 17, 5, 17, 38, 39);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (41, 'purus aliquet', 50, 20, 22, 43, 19);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (53, 'eros vestibulum ac est', 53, 12, 27, 36, 3);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (10, 'erat quisque erat', 1, 13, 8, 34, 6);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'penatibus et', 51, 38, 1, 26, 38);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (8, 'eu est', 51, 10, 16, 12, 35);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'lacus', 27, 30, 35, 36, 4);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (40, 'bibendum imperdiet', 47, 26, 33, 35, 37);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (36, 'vulputate justo', 12, 29, 9, 26, 2);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (25, 'mauris', 22, 26, 8, 5, 2);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (21, 'bibendum morbi', 55, 29, 11, 48, 12);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'velit', 42, 21, 40, 14, 12);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (30, 'ut suscipit a feugiat', 50, 2, 36, 8, 3);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (39, 'sagittis sapien cum sociis', 41, 24, 19, 29, 28);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (40, 'libero non mattis pulvinar nulla', 50, 14, 12, 10, 37);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (25, 'tortor quis turpis sed', 47, 6, 9, 39, 21);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (31, 'augue', 39, 5, 36, 33, 17);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (31, 'sodales scelerisque mauris sit', 4, 30, 37, 37, 3);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (15, 'dui proin leo odio porttitor', 36, 39, 25, 5, 28);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (45, 'id sapien in', 26, 35, 3, 42, 17);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (32, 'integer', 20, 2, 29, 36, 15);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (24, 'suspendisse potenti nullam porttitor', 18, 36, 26, 11, 33);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'erat id mauris vulputate', 24, 8, 27, 15, 30);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (34, 'viverra pede ac diam', 47, 3, 3, 24, 21);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (36, 'odio', 28, 37, 15, 2, 26);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (54, 'proin eu mi', 24, 35, 20, 4, 18);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (44, 'tortor duis mattis', 31, 23, 14, 43, 28);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (39, 'justo', 20, 9, 9, 45, 36);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (28, 'nulla suscipit', 15, 38, 23, 46, 17);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'ut tellus nulla ut', 14, 26, 16, 38, 17);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (36, 'nibh quisque', 5, 5, 40, 23, 29);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'in hac', 44, 6, 20, 37, 18);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (6, 'sed interdum', 53, 24, 21, 21, 31);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (50, 'erat volutpat in', 2, 7, 37, 7, 36);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (21, 'sapien non mi integer', 27, 4, 1, 46, 40);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (48, 'felis sed interdum', 48, 17, 24, 20, 24);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (19, 'lacus at turpis donec posuere', 38, 27, 17, 20, 25);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (18, 'potenti', 44, 12, 39, 12, 36);

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