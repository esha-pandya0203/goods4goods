SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

USE `goods4goods`;

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
