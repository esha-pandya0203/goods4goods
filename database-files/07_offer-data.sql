SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

USE `goods4goods`;

# ---------------------------------------------------------------------- #
# Insert Into "Offer"                                                 #
# ---------------------------------------------------------------------- #

INSERT INTO Offer (offering_user, receiving_user, status, item_offered_id, item_requested_id) VALUES
(1, 2, 3, 1, 2),
(2, 3, 2, 3, 1),
(3, 1, 1, 2, 3);
