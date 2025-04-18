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

insert into Admin (first_name, last_name) values ('Mag', 'Pettyfar');
insert into Admin (first_name, last_name) values ('Lombard', 'Landsman');
insert into Admin (first_name, last_name) values ('Stacie', 'Gibbard');
insert into Admin (first_name, last_name) values ('Kristina', 'Wheelband');
insert into Admin (first_name, last_name) values ('Henryetta', 'Notman');
insert into Admin (first_name, last_name) values ('Kitti', 'Amberson');
insert into Admin (first_name, last_name) values ('Elonore', 'Brake');
insert into Admin (first_name, last_name) values ('Sayres', 'Mogra');
insert into Admin (first_name, last_name) values ('Tobit', 'Blesdill');
insert into Admin (first_name, last_name) values ('Stearne', 'McKnockiter');
insert into Admin (first_name, last_name) values ('Jemima', 'MacCurley');
insert into Admin (first_name, last_name) values ('Lynette', 'Foulks');
insert into Admin (first_name, last_name) values ('Lora', 'Reedie');
insert into Admin (first_name, last_name) values ('Carleen', 'Cavan');
insert into Admin (first_name, last_name) values ('Eadmund', 'Goodson');
insert into Admin (first_name, last_name) values ('Jen', 'Maytom');
insert into Admin (first_name, last_name) values ('Barbara', 'Tzarkov');
insert into Admin (first_name, last_name) values ('Wallis', 'Bedwell');
insert into Admin (first_name, last_name) values ('Kizzee', 'Cicchelli');
insert into Admin (first_name, last_name) values ('Pearle', 'Destouche');
insert into Admin (first_name, last_name) values ('Vernor', 'Errigo');
insert into Admin (first_name, last_name) values ('Corrie', 'Bickford');
insert into Admin (first_name, last_name) values ('Lexy', 'Borrows');
insert into Admin (first_name, last_name) values ('Lissy', 'Brachell');
insert into Admin (first_name, last_name) values ('Freddy', 'Vannet');
insert into Admin (first_name, last_name) values ('Jacynth', 'Lindwasser');
insert into Admin (first_name, last_name) values ('Rea', 'Chomley');
insert into Admin (first_name, last_name) values ('Tirrell', 'Graeber');
insert into Admin (first_name, last_name) values ('Junia', 'Slopier');
insert into Admin (first_name, last_name) values ('Raymund', 'Bellam');
insert into Admin (first_name, last_name) values ('Esme', 'Seeborne');
insert into Admin (first_name, last_name) values ('Giraldo', 'Ault');
insert into Admin (first_name, last_name) values ('Lew', 'Garratty');
insert into Admin (first_name, last_name) values ('Gladi', 'De La Coste');
insert into Admin (first_name, last_name) values ('Lydie', 'O''Cannan');
insert into Admin (first_name, last_name) values ('Hort', 'Giorgetti');
insert into Admin (first_name, last_name) values ('Tessi', 'Gowman');
insert into Admin (first_name, last_name) values ('Reggy', 'Smoth');
insert into Admin (first_name, last_name) values ('Nikolai', 'Tire');
insert into Admin (first_name, last_name) values ('Vitia', 'Meeke');
insert into Admin (first_name, last_name) values ('Garnet', 'Paine');
insert into Admin (first_name, last_name) values ('Ashlee', 'Hedylstone');
insert into Admin (first_name, last_name) values ('Phaidra', 'Parratt');
insert into Admin (first_name, last_name) values ('Katee', 'Aguirrezabala');
insert into Admin (first_name, last_name) values ('Kellsie', 'McFade');
insert into Admin (first_name, last_name) values ('Lura', 'Coutthart');
insert into Admin (first_name, last_name) values ('Codie', 'Filimore');
insert into Admin (first_name, last_name) values ('Joel', 'Cockley');
insert into Admin (first_name, last_name) values ('Willa', 'Garaway');
insert into Admin (first_name, last_name) values ('Max', 'Rivallant');


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

insert into Analyst (firstName, lastName, reports_to) values ('Rhiamon', 'Worling', 1);
insert into Analyst (firstName, lastName, reports_to) values ('Prudi', 'Hassan', 45);
insert into Analyst (firstName, lastName, reports_to) values ('Archambault', 'Cherryman', 30);
insert into Analyst (firstName, lastName, reports_to) values ('Lee', 'Woloschinski', 49);
insert into Analyst (firstName, lastName, reports_to) values ('Mikaela', 'Gavaran', 40);
insert into Analyst (firstName, lastName, reports_to) values ('Basilius', 'Edworthye', 2);
insert into Analyst (firstName, lastName, reports_to) values ('Dacy', 'Dack', 9);
insert into Analyst (firstName, lastName, reports_to) values ('Alister', 'Berre', 8);
insert into Analyst (firstName, lastName, reports_to) values ('Miller', 'Josefsson', 42);
insert into Analyst (firstName, lastName, reports_to) values ('Tim', 'Aleksandrev', 36);
insert into Analyst (firstName, lastName, reports_to) values ('Nessi', 'Wiggington', 47);
insert into Analyst (firstName, lastName, reports_to) values ('Teodora', 'Bruster', 47);
insert into Analyst (firstName, lastName, reports_to) values ('Yevette', 'Dunkley', 46);
insert into Analyst (firstName, lastName, reports_to) values ('Charmain', 'Fenne', 47);
insert into Analyst (firstName, lastName, reports_to) values ('Lionello', 'Heeron', 25);
insert into Analyst (firstName, lastName, reports_to) values ('Richmound', 'Stannett', 4);
insert into Analyst (firstName, lastName, reports_to) values ('Addy', 'Sorbie', 50);
insert into Analyst (firstName, lastName, reports_to) values ('Diego', 'Bigland', 49);
insert into Analyst (firstName, lastName, reports_to) values ('Blinny', 'Racine', 11);
insert into Analyst (firstName, lastName, reports_to) values ('Mariska', 'Pockey', 31);
insert into Analyst (firstName, lastName, reports_to) values ('Cammi', 'Geddis', 8);
insert into Analyst (firstName, lastName, reports_to) values ('Gigi', 'Bacop', 44);
insert into Analyst (firstName, lastName, reports_to) values ('Alric', 'Frohock', 31);
insert into Analyst (firstName, lastName, reports_to) values ('Tabitha', 'Macer', 47);
insert into Analyst (firstName, lastName, reports_to) values ('Hinda', 'Bownas', 40);
insert into Analyst (firstName, lastName, reports_to) values ('Vidovic', 'Alcido', 20);
insert into Analyst (firstName, lastName, reports_to) values ('Jordain', 'Daughtry', 31);
insert into Analyst (firstName, lastName, reports_to) values ('Benetta', 'Messier', 7);
insert into Analyst (firstName, lastName, reports_to) values ('Madelaine', 'Souster', 31);
insert into Analyst (firstName, lastName, reports_to) values ('Martie', 'Aindrais', 47);
insert into Analyst (firstName, lastName, reports_to) values ('Suzanne', 'Zoane', 44);
insert into Analyst (firstName, lastName, reports_to) values ('Noelle', 'Cornilleau', 43);
insert into Analyst (firstName, lastName, reports_to) values ('Emmie', 'Addy', 43);
insert into Analyst (firstName, lastName, reports_to) values ('Jemima', 'Restieaux', 32);
insert into Analyst (firstName, lastName, reports_to) values ('Clark', 'Guiso', 43);
insert into Analyst (firstName, lastName, reports_to) values ('Bidget', 'Kubas', 25);
insert into Analyst (firstName, lastName, reports_to) values ('Anne-marie', 'Harkes', 26);
insert into Analyst (firstName, lastName, reports_to) values ('Davina', 'Mathen', 49);
insert into Analyst (firstName, lastName, reports_to) values ('Lilian', 'Dohrmann', 2);
insert into Analyst (firstName, lastName, reports_to) values ('Felicity', 'Dolphin', 26);
insert into Analyst (firstName, lastName, reports_to) values ('Henrieta', 'Lowery', 9);
insert into Analyst (firstName, lastName, reports_to) values ('Constantine', 'Ennor', 46);
insert into Analyst (firstName, lastName, reports_to) values ('Edgar', 'Andren', 50);
insert into Analyst (firstName, lastName, reports_to) values ('Eugenie', 'Gives', 4);
insert into Analyst (firstName, lastName, reports_to) values ('Clarance', 'Quinnelly', 1);

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


insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-04-20 12:25:23', '2025-04-12 02:52:13', 29, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-07-28 10:01:33', '2024-06-09 01:53:14', 47, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2025-02-10 08:09:48', '2024-09-15 13:51:49', 17, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-11-21 16:04:42', '2024-07-29 10:23:24', 43, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-06-10 09:45:41', '2024-05-07 00:11:23', 13, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-08-21 08:45:35', '2024-06-30 14:20:38', 43, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-09-12 13:34:11', '2024-03-28 12:25:33', 12, 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-09-09 12:48:17', '2024-02-02 15:43:41', 34, 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-07-29 14:23:05', '2024-09-21 12:41:23', 4, 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2025-03-18 21:37:31', '2024-05-13 12:39:49', 25, 'Vivamus vestibulum sagittis sapien.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-09-20 16:31:03', '2024-11-08 06:06:34', 1, 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-11-27 17:53:36', '2024-10-12 22:37:57', 28, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2025-03-16 00:50:12', '2025-04-04 00:41:44', 18, 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-07-17 16:31:24', '2024-10-10 23:49:44', 9, 'Curabitur at ipsum ac tellus semper interdum.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-12-23 13:00:40', '2025-03-25 07:40:18', 4, 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-03-02 12:59:37', '2024-05-17 01:53:52', 41, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-08-29 01:47:47', '2024-08-04 16:50:33', 35, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-06-10 16:07:50', '2025-01-21 18:46:42', 5, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-06-06 08:47:46', '2025-01-11 16:52:44', 7, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-11-27 15:59:27', '2024-11-18 14:06:46', 12, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-11-11 07:00:03', '2024-08-02 15:09:01', 1, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-12-25 15:46:40', '2024-11-05 17:26:28', 28, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-02-10 02:48:48', '2024-07-20 17:58:47', 42, 'Morbi non quam nec dui luctus rutrum. Nulla tellus.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-12-25 19:35:47', '2025-02-03 10:02:58', 19, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2025-04-14 03:39:07', '2024-12-24 15:42:25', 8, 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-12-01 23:14:33', '2024-12-19 15:20:23', 17, 'Maecenas pulvinar lobortis est.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2025-01-13 10:11:49', '2024-09-13 12:33:03', 13, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-04-26 12:46:29', '2024-09-17 16:58:08', 16, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-03-14 14:28:18', '2024-07-07 10:28:19', 21, 'Nunc rhoncus dui vel sem.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-10-04 09:56:45', '2024-09-25 02:01:01', 12, 'Sed accumsan felis.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-10-06 23:48:14', '2025-04-04 03:11:27', 5, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2025-01-26 23:55:31', '2024-04-18 14:42:20', 21, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-11-14 04:57:53', '2024-08-05 07:17:49', 1, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2025-02-26 11:12:11', '2024-10-07 18:00:50', 30, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-11-12 17:06:56', '2024-10-10 12:05:00', 39, 'Integer ac neque.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-07-05 04:15:55', '2024-09-10 17:28:38', 5, 'Morbi a ipsum. Integer a nibh.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2025-01-09 02:40:31', '2025-03-07 16:05:32', 47, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-05-20 00:45:50', '2024-03-14 18:48:57', 13, 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-12-07 00:33:20', '2024-06-24 13:00:49', 24, 'Integer a nibh. In quis justo.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-09-25 18:29:21', '2024-03-16 07:03:59', 35, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-04-13 17:03:32', '2024-03-23 21:01:22', 18, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-11-30 19:29:32', '2024-11-21 01:39:17', 26, 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-06-14 12:40:41', '2024-06-17 15:21:41', 34, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2024-07-12 23:40:13', '2024-03-03 19:29:43', 42, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into Analysis (start_date, end_date, analyst_id, written_analysis) values ('2025-04-08 16:10:24', '2024-08-10 12:02:44', 38, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.');

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
('In-Progress');



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
(39, 'Vintage desk lamp, perfect for home office.', 'Desk Lamp', 'https://i.pinimg.com/736x/a1/2d/85/a12d8585003e9a171698980a0e859bb0.jpg', 30),
(2, 'Modern recliner in excellent condition.', 'Recliner Chair', 'https://i.pinimg.com/474x/4b/d4/09/4bd4094db0140173aa820bcb242888d8.jpg', 180),
(29, 'Stylish round dining table, slightly used.', 'Dining Table', 'https://i.pinimg.com/474x/0c/44/1c/0c441c0084f0fc0d2fe6cba8a53cd98c.jpg', 120),
(29, 'Single bed frame, lightly used with storage.', 'Bed Frame', 'https://i.pinimg.com/474x/80/64/79/806479b6c6ffb97c70590758967db3c9.jpg', 75),

(3, 'Compact microwave, works perfectly.', 'Microwave', 'https://i.pinimg.com/474x/c7/13/3d/c7133d0600780562444e21e03e8abce7.jpg', 50),
(3, 'Full-size bookshelf, light wood finish.', 'Bookshelf', 'https://i.pinimg.com/474x/f8/77/09/f877099a1aba59b8e40755ef7efed05a.jpg', 90),
(1, 'Ceramic vase with floral design.', 'Ceramic Vase', 'https://i.pinimg.com/474x/ff/dd/41/ffdd411ef13cb54eacc9ea04127efca1.jpg', 25),
(4, 'Men''s leather jacket, barely worn.', 'Leather Jacket', 'https://i.pinimg.com/474x/81/73/aa/8173aa98571a13e146605d0ee9d76837.jpg', 100),
(5, 'Set of 4 wooden dining chairs.', 'Dining Chairs', 'https://i.pinimg.com/474x/47/ac/e3/47ace362a3a9faade39e6ec1f5bbb710.jpg', 80),
(6, 'Wall-mounted coat rack with hooks.', 'Coat Rack', 'https://i.pinimg.com/474x/1e/b1/79/1eb1792d3419cf4f5627d1a5e3935603.jpg', 20),

(4, 'Bluetooth speaker, great sound.', 'Bluetooth Speaker', 'https://i.pinimg.com/474x/80/f2/47/80f2470843b704b3f6b886903a192217.jpg', 35),
(3, 'Cute succulent in ceramic pot.', 'Succulent Plant', 'https://i.pinimg.com/474x/fa/c1/69/fac1691eed8a8d84cb7be26ec3799bcd.jpg', 10),
(5, 'Throw blanket, cozy and soft.', 'Throw Blanket', 'https://i.pinimg.com/474x/30/09/c1/3009c136c0d93cf9102e27d25585b6bf.jpg', 15),
(1, 'Winter boots, waterproof, size 8.', 'Winter Boots', 'https://i.pinimg.com/474x/77/b9/d0/77b9d0417145c7309d6445646c201566.jpg', 40),
(2, 'Framed poster of vintage NYC map.', 'NYC Map Poster', 'https://i.pinimg.com/474x/85/04/81/8504816f28997ce19e812aef951a2e97.jpg', 18),
(3, 'Mini fridge in working condition.', 'Mini Fridge', 'https://i.pinimg.com/474x/e1/a1/97/e1a1971ea39dc84202607e5c8afaff0b.jpg', 95),

(6, 'Standing mirror, full length.', 'Standing Mirror', 'https://i.pinimg.com/474x/21/2a/19/212a191fdcecc79faa38ad501386dabc.jpg', 60),
(1, 'Vintage suitcase, leather straps.', 'Vintage Suitcase', 'https://i.pinimg.com/474x/8f/95/ae/8f95ae8c9d5aeb45407bc3f1fd870427.jpg', 50),
(2, 'Pet carrier backpack.', 'Pet Backpack', 'https://i.pinimg.com/474x/01/f8/1d/01f81db19e5803cac8830ffb43290847.jpg', 30),
(5, 'Gaming chair with adjustable height.', 'Gaming Chair', 'https://i.pinimg.com/474x/60/91/a7/6091a7cfdcd850c872f570a1375a52aa.jpg', 120),
(1, 'Women''s trench coat, size M.', 'Trench Coat', 'https://i.pinimg.com/474x/e2/ca/19/e2ca19d5ee51d36b06ba1dd6b6c4d9ab.jpg', 55),
(3, 'Pair of roller skates, size 9.', 'Roller Skates', 'https://i.pinimg.com/474x/7c/62/19/7c6219eda696f6222dccc86fff0bfa34.jpg', 45),

(2, 'Laptop stand with adjustable angle.', 'Laptop Stand', 'https://i.pinimg.com/474x/16/2b/d1/162bd1de06ecc3ffa7d45b13f50b4c81.jpg', 20),
(6, 'Rustic wall clock, working.', 'Wall Clock', 'https://i.pinimg.com/474x/5c/fe/2d/5cfe2d8560ffe4f0a8b1e15164c734b5.jpg', 30),
(4, 'Hand-knitted scarf, warm and stylish.', 'Knitted Scarf', 'https://i.pinimg.com/474x/e5/32/35/e5323509225912ab879bffd8357172f6.jpg', 12),
(3, 'Set of ceramic bowls, 5 pcs.', 'Ceramic Bowls', 'https://i.pinimg.com/474x/ff/1c/b3/ff1cb3423943357e035d8f7e865e9cff.jpg', 25),
(5, 'Wooden jewelry box with mirror.', 'Jewelry Box', 'https://i.pinimg.com/474x/80/48/4b/80484ba76819b787cd4d9574eee42774.jpg', 20),
(1, 'Easel for painting or display.', 'Artist Easel', 'https://i.pinimg.com/736x/09/5f/c7/095fc72e8a86ea430376b62c8957b428.jpg', 35),

(4, 'Essential oil diffuser.', 'Oil Diffuser', 'https://i.pinimg.com/474x/e4/ad/a8/e4ada897c1ae38561f1a33ad75068b2c.jpg', 22),
(2, 'Board game: Settlers of Catan.', 'Board Game', 'https://i.pinimg.com/474x/fc/71/e7/fc71e7eae1d3bc6e62cfc47b5db2b173.jpg', 28),
(5, 'String lights, 20 feet, warm white.', 'String Lights', 'https://i.pinimg.com/474x/4f/9b/d1/4f9bd1a2b07ee692003c04eabfe237ad.jpg', 15),
(6, 'Mountain bike helmet, adult size.', 'Bike Helmet', 'https://i.pinimg.com/474x/8a/6b/8b/8a6b8b2fe24f655f3bf603caf70fc10c.jpg', 40),
(3, 'Acoustic guitar, lightly used.', 'Acoustic Guitar', 'https://i.pinimg.com/474x/f6/a6/be/f6a6bef36698cc60933f3a827a1fce4c.jpg', 95),
(1, 'Foldable laundry hamper.', 'Laundry Hamper', 'https://i.pinimg.com/474x/84/66/84/846684c270ef79862f9fb38336af3945.jpg', 18),

(4, 'Wool rug, 5x7 ft.', 'Wool Rug', 'https://i.pinimg.com/474x/5b/ec/0f/5bec0fc5f70c4cc4573de45360778613.jpg', 80),
(16, 'Digital alarm clock with USB port.', 'Alarm Clock', 'https://i.pinimg.com/474x/54/4c/8b/544c8bea1771be260eec2717bfb6470e.jpg', 25),
(2, 'Lava lamp, blue/purple swirl.', 'Lava Lamp', 'https://i.pinimg.com/474x/d1/3c/fb/d13cfb8696caae616433f656b49ad873.jpg', 20),
(14, 'Handcrafted wooden tray, versatile for serving or decoration.', 'Wooden Tray', 'https://i.pinimg.com/474x/fd/9c/95/fd9c9515a370e861bac30199fd63bb2e.jpg', 30),
(2, 'Electric kettle with temperature control.', 'Electric Kettle', 'https://i.pinimg.com/474x/fc/76/2f/fc762ff084d36449c56a3f20437ee63b.jpg', 55),
(3, 'Leather backpack, spacious and durable.', 'Leather Backpack', 'https://i.pinimg.com/474x/1b/dc/bf/1bdcbf8aae7ea454f5b4b73155fdd60d.jpg', 90),

(1, 'Wooden bookshelf, sturdy, with adjustable shelves.', 'Bookshelf', 'https://i.pinimg.com/474x/56/30/11/5630111539528d66e2cd41f3bcc03e38.jpg', 75),
(2, 'Vintage armchair, comfortable and in great shape.', 'Armchair', 'https://i.pinimg.com/474x/24/b0/23/24b023245387f73548a89455bbfab702.jpg', 150),
(3, 'Set of glass wine glasses, 6 pcs.', 'Wine Glasses', 'https://i.pinimg.com/474x/b2/c7/66/b2c7665b99257d3c0905ed89e9ec08be.jpg', 25),
(4, 'Lightweight travel suitcase, expandable.', 'Travel Suitcase', 'https://i.pinimg.com/474x/c5/6f/47/c56f47858be74002b676286b216b5fea.jpg', 80),
(15, 'Bluetooth headphones, noise-canceling.', 'Bluetooth Headphones', 'https://i.pinimg.com/474x/c5/2e/c0/c52ec0b68162fec8a596922e72966b91.jpg', 100),
(6, 'Wooden coffee table with sleek design.', 'Coffee Table', 'https://i.pinimg.com/474x/da/1a/11/da1a11a40191478ff1767fb728dd8296.jpg', 95),

(12, 'Classic rocking chair, perfect for a cozy corner.', 'Rocking Chair', 'https://i.pinimg.com/474x/d7/2d/02/d72d02ac3787547ed6ea3af9c02d1115.jpg', 60),
(32, 'Compact desk organizer, multi-functional.', 'Desk Organizer', 'https://i.pinimg.com/474x/a2/8b/e4/a28be4b5ed7ba7f63b5929ab022af9f2.jpg', 18),
(3, 'Handmade wool scarf, soft and warm.', 'Wool Scarf', 'https://i.pinimg.com/474x/8c/41/ac/8c41acb3cfdfe0ee24d1b9a655d55b31.jpg', 22),
(4, 'Outdoor patio chair, weather-resistant.', 'Patio Chair', 'https://i.pinimg.com/474x/49/11/57/491157e68aa602b20412da5d3a6891fc.jpg', 120),
(5, 'Modern area rug, 6x9 ft.', 'Area Rug', 'https://i.pinimg.com/474x/fa/ad/07/faad07dffd9e3b42cdfa30daccd4c975.jpg', 150),
(6, 'Desk lamp with adjustable brightness.', 'Desk Lamp', 'https://i.pinimg.com/474x/62/12/d5/6212d5b44a66f644f728ca7461f76173.jpg', 40),

(1, 'Set of 4 ceramic mugs, dishwasher safe.', 'Ceramic Mugs', 'https://i.pinimg.com/474x/14/dc/b7/14dcb7bf0c69302b63a5e2b370517015.jpg', 20),
(2, 'King-size mattress, lightly used, in great condition.', 'Mattress', 'https://i.pinimg.com/474x/e7/27/d7/e727d727636f67ef86b4d2e6f56f6986.jpg', 250),
(23, 'Portable speaker, waterproof and durable.', 'Portable Speaker', 'https://i.pinimg.com/474x/0f/b9/17/0fb917780808597c25597f7d688d6f3c.jpg', 65),
(4, 'Full-length mirror, sleek design.', 'Full-Length Mirror', 'https://i.pinimg.com/474x/22/ac/43/22ac43fc966ec5817f1c67a686bd20e2.jpg', 55),
(53, 'Comfortable memory foam pillow, queen size.', 'Memory Foam Pillow', 'https://i.pinimg.com/474x/14/56/5a/14565a124b530a153242b08c9f395d9c.jpg', 40),
(60, 'Ceramic plant pot with drainage hole.', 'Plant Pot', 'https://i.pinimg.com/474x/a3/3c/d7/a33cd7c1a92d3190abc7dde28e33bbb5.jpg', 12);


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
# Insert Into "Offer"                                                 #
# ---------------------------------------------------------------------- #

INSERT INTO Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) VALUES
(1, 2, 1, 1, 2),
(2, 3, 2, 3, 1),
(3, 1, 3, 2, 3);

insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (38, 11, 2, 2, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (34, 7, 2, 4, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (8, 30, 4, 5, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (21, 6, 1, 7, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (27, 6, 2, 6, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (22, 15, 3, 4, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (32, 15, 1, 4, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (16, 40, 4, 5, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (32, 10, 2, 3, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (5, 13, 4, 5, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (7, 37, 3, 2, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (14, 36, 3, 6, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (17, 26, 4, 7, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (37, 25, 2, 3, 2);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (7, 36, 2, 6, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (13, 17, 1, 7, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (19, 19, 2, 1, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (6, 35, 2, 7, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (14, 3, 4, 2, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (17, 14, 4, 2, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (32, 20, 4, 8, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (28, 12, 1, 5, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (25, 2, 1, 4, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (8, 24, 3, 3, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (8, 38, 3, 8, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (31, 24, 2, 2, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (31, 2, 2, 1, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (39, 30, 1, 3, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (3, 9, 4, 3, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (5, 29, 4, 7, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (7, 37, 1, 5, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (15, 11, 2, 3, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (21, 14, 3, 3, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (26, 9, 2, 6, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (17, 16, 4, 2, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (13, 36, 4, 7, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (13, 31, 4, 2, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (38, 31, 1, 1, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (17, 17, 4, 8, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (6, 38, 1, 5, 1);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (1, 35, 4, 4, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (25, 33, 3, 1, 6);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (12, 3, 4, 3, 3);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (17, 29, 1, 4, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (17, 12, 4, 7, 8);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (14, 15, 1, 7, 2);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (28, 32, 2, 5, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (27, 26, 3, 6, 5);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (2, 38, 4, 8, 4);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (2, 29, 2, 6, 7);
insert into Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) values (29, 1, 1, 6, 9);

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
    FOREIGN KEY (offer_id) REFERENCES Offer(offer_id) ON DELETE CASCADE
);

# ---------------------------------------------------------------------- #
# Insert into "Rating"                                                 #
# ---------------------------------------------------------------------- #
INSERT INTO Rating (rating_number,rated_by,rating_for, offer_id) VALUES
( 4, 2, 1,2),
( 5, 1, 2,1),
(4, 3, 1,3);

insert into Rating (rating_number, rated_by, rating_for, offer_id) values (5, 13, 36, 48);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (4, 26, 16, 27);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 26, 35, 25);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 12, 25, 24);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 37, 28, 32);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 23, 27, 28);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 24, 18, 25);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 26, 13, 31);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (4, 38, 10, 36);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 23, 28, 31);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (4, 40, 3, 10);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 19, 29, 14);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 7, 19, 16);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (4, 13, 21, 36);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 4, 32, 28);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (5, 20, 13, 35);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 5, 21, 15);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (5, 27, 16, 36);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 19, 29, 42);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 33, 36, 5);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 5, 33, 7);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 5, 12, 34);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 6, 21, 44);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 6, 16, 21);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (4, 26, 37, 8);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (5, 30, 9, 6);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 20, 8, 28);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 18, 22, 10);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 15, 24, 26);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 22, 20, 10);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 39, 3, 38);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 6, 9, 19);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (4, 37, 28, 16);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 13, 34, 4);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (5, 13, 40, 3);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 37, 25, 48);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 25, 38, 44);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 29, 40, 12);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 14, 28, 39);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 1, 14, 4);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (5, 32, 6, 46);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (1, 37, 2, 15);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (5, 12, 20, 26);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (5, 5, 3, 26);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 10, 11, 12);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 21, 12, 14);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 14, 31, 7);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (5, 3, 21, 32);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (3, 8, 27, 48);
insert into Rating (rating_number, rated_by, rating_for, offer_id) values (2, 3, 23, 33);

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
INSERT INTO SME (firstName, lastName, email, street, city, state, zipcode) VALUES
('Daniel', 'Kimmel', 'dkimm@gmail.com','Spruce Street', 'Boston','Massachusetts', '02115'),
('Scarlett', 'Cole', 'scole@gmail.com','Hillside Street', 'Boston', 'Massachusetts', '02120'),
('Jim', 'Scorn', 'jscorn@gmail.com','Maple Avenue','Bedford', 'New York', '10506');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Alisa', 'Strowan', 'astrowan0@fastcompany.com', '369 Carioca Court', 'Houston', 'Texas', '77095');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Bent', 'Moulsdall', 'bmoulsdall1@google.es', '035 Eagle Crest Hill', 'Washington', 'District of Columbia', '20337');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Adrian', 'Mulvenna', 'amulvenna2@altervista.org', '7771 Manufacturers Court', 'Omaha', 'Nebraska', '68144');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Louis', 'Stedall', 'lstedall3@noaa.gov', '5250 Laurel Road', 'Evanston', 'Illinois', '60208');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Hilario', 'Fairbrother', 'hfairbrother4@arizona.edu', '05131 Vernon Trail', 'Las Vegas', 'Nevada', '89120');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Zak', 'Cecere', 'zcecere5@statcounter.com', '2 Bartillon Point', 'Bakersfield', 'California', '93305');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Lorenzo', 'Knowler', 'lknowler6@photobucket.com', '816 Blackbird Crossing', 'Charleston', 'West Virginia', '25331');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Nelly', 'Chipps', 'nchipps7@latimes.com', '51457 Schiller Circle', 'Sacramento', 'California', '94291');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Vilma', 'Banisch', 'vbanisch8@census.gov', '9 Paget Junction', 'Brooklyn', 'New York', '11220');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Danila', 'Tuck', 'dtuck9@google.ru', '4 Muir Center', 'Toledo', 'Ohio', '43610');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Lorianna', 'Glaister', 'lglaistera@nih.gov', '45 Utah Circle', 'Los Angeles', 'California', '90071');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Marcello', 'Nester', 'mnesterb@posterous.com', '30521 Glacier Hill Parkway', 'Raleigh', 'North Carolina', '27626');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Estevan', 'Pepon', 'epeponc@umn.edu', '919 Grasskamp Hill', 'Providence', 'Rhode Island', '02905');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Harrietta', 'Pitceathly', 'hpitceathlyd@economist.com', '66 Corben Alley', 'El Paso', 'Texas', '79923');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Dell', 'MacGregor', 'dmacgregore@flickr.com', '05 Rusk Street', 'New York City', 'New York', '10160');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Raddy', 'Caroline', 'rcarolinef@dyndns.org', '68 4th Drive', 'Naperville', 'Illinois', '60567');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Hersch', 'Jouannot', 'hjouannotg@dell.com', '420 Linden Center', 'Cleveland', 'Ohio', '44125');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Stefan', 'McFayden', 'smcfaydenh@stumbleupon.com', '77 Victoria Way', 'Seattle', 'Washington', '98109');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Jud', 'Doherty', 'jdohertyi@mtv.com', '8642 Golden Leaf Plaza', 'Sioux City', 'Iowa', '51105');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Juliana', 'Hutcheson', 'jhutchesonj@state.tx.us', '672 High Crossing Court', 'Naperville', 'Illinois', '60567');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Erminia', 'Ellerman', 'eellermank@census.gov', '47 Stoughton Avenue', 'San Francisco', 'California', '94164');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Sella', 'O''Dunniom', 'sodunnioml@weather.com', '5874 Amoth Pass', 'Pasadena', 'California', '91199');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Odille', 'Kynsey', 'okynseym@google.ru', '4 Mandrake Drive', 'Little Rock', 'Arkansas', '72204');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Alene', 'Emnoney', 'aemnoneyn@trellian.com', '0 Declaration Alley', 'Tampa', 'Florida', '33647');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Jarvis', 'Bernade', 'jbernadeo@yellowpages.com', '77748 Morrow Road', 'Memphis', 'Tennessee', '38168');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Ivett', 'Vellacott', 'ivellacottp@forbes.com', '94220 Merrick Circle', 'Wilkes Barre', 'Pennsylvania', '18763');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Erica', 'Jerdon', 'ejerdonq@aboutads.info', '75802 Hanover Pass', 'Kansas City', 'Missouri', '64149');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Danyelle', 'Trye', 'dtryer@unblog.fr', '08 Sommers Parkway', 'Lubbock', 'Texas', '79415');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Briney', 'Vagg', 'bvaggs@miibeian.gov.cn', '00883 Westerfield Lane', 'Greensboro', 'North Carolina', '27499');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Roz', 'Jillard', 'rjillardt@booking.com', '52 Crownhardt Place', 'San Francisco', 'California', '94164');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Alejandro', 'Stairmond', 'astairmondu@salon.com', '314 Troy Alley', 'Sacramento', 'California', '95865');
insert into SME (firstName, lastName, email, street, city, state, zipcode) values ('Torrie', 'Shoebottom', 'tshoebottomv@domainmarket.com', '7485 Mockingbird Junction', 'Newark', 'New Jersey', '07104');

# ---------------------------------------------------------------------- #
# Add table "Posts"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE Posts(
    post_id int NOT NULL PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    post_title varchar(75) NOT NULL,
    description tinytext,
    full_post varchar(1000),
    `show` bool,
    posted_by int NOT NULL,
    createdDate datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (posted_by) REFERENCES SME(sme_id)
);

# ---------------------------------------------------------------------- #
# Insert into "Posts"                                                 #
# ---------------------------------------------------------------------- #
INSERT INTO Posts (post_title,description, full_post, `show`, posted_by) VALUES
('Sellers to Watch Out For', 'Based on app analyst data, I will be telling you who some of the highest performing users have been over the last week.', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', TRUE, 2),
('Hottest Items to Trade Right Now', 'Based on app analyst data, here are some items that are always being traded for.', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', TRUE,1),
('Employee Picks: Top Items Looking for a Trade', 'Here are some of my favorite items from the Employee Picks Section - Check them out while they are available.', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', FALSE,3);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('What''s Hot This Week: Trending Trades You Don''t Want to Miss!', 'condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', false, 9);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Couch Goals: The Most Wanted Furniture on the Marketplace', 'luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', true, 29);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Top 5 Fashion Finds Everyone''s Trying to Trade For', 'porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', true, 3);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('These Items Are Blowing Up Right Now-Are You Trading Them?', 'vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', false, 17);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('From Closet to Hot Commodity: The Surprising Item Everyone Wants', 'at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', true, 21);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Shoutout to Our Top Trader of the Week!', 'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', false, 9);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Meet the Seller Getting the Most Offers Right Now', 'egestas metus aenean fermentum donec ut mauris eget massa tempor convallis', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', false, 33);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Power Traders: These Users Know How to Seal a Deal', 'sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', false, 5);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Want More Offers? Here''s What Our Top Sellers Are Doing Differently', 'turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', false, 32);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('The Top 3 Most Active Traders-Are You One of Them?', 'consequat lectus in est risus auctor sed tristique in tempus sit amet sem', 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', false, 1);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Employee Picks: Our Favorite Items Posted This Week', 'interdum venenatis turpis enim blandit mi in porttitor pede justo', 'Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', true, 16);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Staff Spotlight: 5 Must-See Items That Just Dropped', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', true, 34);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Hidden Gems: Marketplace Picks You''ll Regret Missing', 'eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc', 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', true, 29);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('This Week''s Staff-Approved Trade-Worthy Finds', 'curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien', 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', false, 13);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('The Official "Would Trade For" Wishlist From Our Team', 'eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', false, 2);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('What''s the Coolest Thing You''ve Traded On Our App?', 'pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula', 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', false, 7);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Trade Flex: Share Your Favorite Trade With Us!', 'augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', false, 19);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Best Trade Ever? We Want To Hear Your Story', 'lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque', 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', true, 17);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Tag a Friend You''d Trust With a Trade!', 'congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', false, 5);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('This Or That: Would You Trade a Desk for a Bike?', 'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', false, 17);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Monthly Marketplace Recap: Most Traded Items & Top Sellers', 'sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', true, 4);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Fall Finds: Cozy Items You Can Trade Right Now', 'in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', true, 10);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Summer Vibes: Top Outdoor Gear in the Marketplace', 'tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien', 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', true, 11);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Spooky Good Trades: Best October Swaps', 'consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', false, 16);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Holiday Highlight: Top 10 Gift-Worthy Items to Trade', 'elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', false, 15);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('How to Make Your Listing Stand Out and Get More Offers', 'feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst', 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', false, 31);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Top 5 Tips to Become a Power Seller on the Marketplace', 'volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', false, 27);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Smarter Trading: Timing Your Posts for Maximum Views', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', true, 4);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Did You Know? You Can Trade These Categories Too!', 'adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', true, 30);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Behind the Trade: Why Some Items Get More Love Than Others', 'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', false, 25);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('What''s Hot This Week: Trending Trades You Don''t Want to Miss!', 'velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium', 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', false, 32);
insert into Posts (post_title, description, full_post, `show`, posted_by) values ('Couch Goals: The Most Wanted Furniture on the Marketplace', 'eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante', 'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', false, 2);

# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "ErrorCodes"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `ErrorCodes` (
    `error_code_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `error_name` varchar(100) NOT NULL
);
INSERT INTO ErrorCodes (error_name) VALUES
('User Bio'),
('Item Error'),
('Technical Error'),
('Invalid Item'),
('Expired Offer');


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

insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'adipiscing lorem vitae mattis', 4, 6, 10, 50);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'nibh', 1, 1, 6, 31);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'sociis natoque penatibus et magnis', 3, 35, 35, 33);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'nisl', 3, 32, 30, 35);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'id', 2, 12, 28, 22);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (5, 'mattis nibh ligula', 1, 33, 33, 4);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'libero rutrum ac lobortis vel', 2, 34, 3, 40);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (4, 'amet eros suspendisse', 4, 34, 32, 42);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'auctor sed tristique in', 3, 14, 5, 26);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (4, 'rutrum neque', 3, 33, 28, 19);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (1, 'mauris', 4, 3, 20, 22);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (5, 'erat volutpat in congue', 3, 31, 16, 21);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (1, 'pulvinar', 4, 11, 20, 32);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (5, 'id', 4, 4, 37, 47);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (5, 'aenean sit amet justo morbi', 4, 16, 29, 15);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (1, 'leo pellentesque ultrices mattis odio', 2, 23, 31, 26);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'nam nulla integer', 4, 28, 40, 32);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'in', 2, 38, 6, 13);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (5, 'aliquet pulvinar sed nisl nunc', 2, 24, 32, 44);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (5, 'consectetuer eget rutrum', 4, 32, 29, 18);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'ante', 4, 1, 18, 33);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'consequat morbi a ipsum', 1, 32, 11, 38);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (5, 'donec vitae', 2, 23, 36, 45);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'hac habitasse platea', 4, 31, 7, 31);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'nunc', 3, 13, 7, 30);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'vulputate', 3, 18, 9, 7);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (1, 'mauris morbi non lectus', 3, 38, 27, 27);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (5, 'in blandit', 3, 1, 9, 45);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'est', 3, 18, 15, 29);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'phasellus in', 3, 35, 17, 11);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (4, 'vestibulum', 1, 2, 31, 25);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (1, 'felis', 2, 31, 24, 22);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (1, 'amet turpis', 4, 28, 40, 5);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'platea dictumst morbi', 2, 2, 27, 38);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'tellus nisi', 1, 7, 24, 45);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (1, 'eleifend quam a odio', 1, 5, 32, 23);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'potenti nullam porttitor lacus at', 2, 17, 34, 2);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (4, 'elementum', 2, 4, 27, 29);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'commodo', 4, 17, 5, 25);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (1, 'orci luctus', 1, 23, 4, 22);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'amet sem fusce', 2, 25, 34, 41);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'in sagittis dui', 1, 15, 5, 44);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (4, 'ante ipsum primis in', 4, 23, 5, 47);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (1, 'platea dictumst', 3, 34, 19, 17);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (4, 'nulla', 3, 13, 11, 18);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (4, 'fusce posuere felis', 4, 12, 24, 5);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'nulla quisque arcu libero rutrum', 3, 37, 33, 28);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (2, 'nunc viverra dapibus nulla', 4, 2, 12, 11);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (1, 'massa tempor convallis nulla neque', 4, 31, 25, 43);
insert into AdminReport (report_code, description, status, reporter_id, reported_id, offer_id) values (3, 'morbi non lectus', 4, 1, 14, 45);

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
    `reviewer_id` INTEGER ,
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

insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'dapibus nulla suscipit', 4, 6, 5, 49, 39);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'aliquet pulvinar sed nisl', 4, 25, 8, 31, 35);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (4, 'ipsum primis in', 4, 9, 37, 8, 7);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'quisque id justo', 4, 1, 6, 43, 30);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'convallis nunc', 4, 28, 33, 9, 25);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (4, 'metus arcu', 1, 24, 36, 3, 27);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'vestibulum eget vulputate', 3, 1, 35, 19, 37);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'pretium nisl ut volutpat', 4, 31, 3, 35, 16);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'ac lobortis vel dapibus at', 3, 10, 13, 48, 31);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'potenti in eleifend quam', 1, 11, 38, 23, 36);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'nulla ac enim in tempor', 4, 4, 22, 24, 6);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'faucibus orci', 3, 23, 37, 44, 1);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'bibendum morbi', 1, 23, 34, 45, 35);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'fusce consequat nulla nisl nunc', 2, 27, 27, 35, 34);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (4, 'natoque penatibus et magnis', 3, 9, 18, 16, 22);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (1, 'felis', 4, 2, 29, 33, 1);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (1, 'at diam nam tristique tortor', 2, 26, 29, 23, 33);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'sed augue aliquam erat volutpat', 2, 13, 2, 34, 8);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'aenean', 4, 10, 36, 28, 30);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'justo sollicitudin', 1, 36, 34, 7, 37);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (4, 'nam dui', 2, 24, 38, 23, 22);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (4, 'et ultrices posuere cubilia curae', 3, 18, 29, 49, 11);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'rutrum neque', 3, 27, 5, 47, 40);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'potenti cras', 4, 31, 32, 11, 15);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (1, 'pede justo', 4, 29, 6, 49, 10);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'pretium', 1, 21, 7, 28, 36);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'vehicula consequat morbi a', 4, 5, 24, 10, 26);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'viverra diam vitae quam suspendisse', 3, 38, 15, 24, 38);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (4, 'congue risus semper', 2, 4, 5, 9, 23);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'vestibulum sed magna', 1, 7, 4, 22, 25);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'aenean fermentum', 3, 7, 31, 2, 40);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'sit amet nunc', 3, 18, 35, 38, 12);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (4, 'at feugiat non pretium quis', 1, 15, 14, 29, 15);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'accumsan', 4, 22, 7, 38, 30);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (3, 'quis turpis sed ante', 4, 5, 11, 44, 6);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'ut at dolor', 1, 28, 40, 6, 10);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'suscipit nulla', 3, 12, 35, 13, 22);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (1, 'nulla eget eros elementum pellentesque', 1, 35, 35, 10, 9);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'odio consequat', 1, 7, 31, 31, 25);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (1, 'nulla ultrices', 1, 19, 8, 29, 5);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'integer tincidunt ante vel ipsum', 3, 14, 35, 6, 29);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'mi sit amet', 4, 15, 35, 11, 22);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'quam nec dui luctus rutrum', 3, 5, 7, 38, 9);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (4, 'suscipit ligula', 4, 28, 28, 11, 25);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'neque vestibulum eget vulputate', 3, 20, 27, 26, 27);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (4, 'augue', 3, 4, 29, 24, 3);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (5, 'ornare', 3, 36, 14, 10, 39);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (1, 'maecenas tincidunt', 4, 8, 31, 4, 29);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (4, 'porttitor pede justo', 1, 35, 21, 36, 1);
insert into UserReport (report_code, description, status, reporter_id, reported_id, offer_id, reviewer_id) values (2, 'quam sollicitudin vitae', 3, 7, 28, 21, 7);
