SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

USE `goods4goods`;

# ---------------------------------------------------------------------- #
# Insert into "Rating"                                                 #
# ---------------------------------------------------------------------- #
INSERT INTO Rating (rating_number,rated_by,rating_for, offer_id) VALUES
( 4, 2, 1,2),
( 5, 1, 2,1),
(4, 3, 1,3);