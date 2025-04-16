SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

USE `goods4goods`;


-- Dumping data for table 'users'

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
