CREATE TABLE users (
	userID INT AUTO_INCREMENT,
	login_ID VARCHAR(32) NOT NULL,
	password VARCHAR(64) NOT NULL,
	PRIMARY KEY (userID)
);

CREATE TABLE billingAddress (
	bAddress INT AUTO_INCREMENT,
	userId INT,
	address VARCHAR(128) NOT NULL,
	city VARCHAR(64) NOT NULL,
	state VARCHAR(32) NOT NULL,
	zip VARCHAR(16) NOT NULL,
	CONSTRAINT fk_user FOREIGN KEY (userID) REFERENCES users(userID),
	PRIMARY KEY (bAddress)
);

CREATE TABLE shippingAddress (
	sAddress INT AUTO_INCREMENT,
	userId INT,
	address VARCHAR(128),
	city VARCHAR(64),
	state VARCHAR(32),
	zip VARCHAR(16),
	CONSTRAINT fk_user1 FOREIGN KEY (userID) REFERENCES users(userID),
	PRIMARY KEY (sAddress)
);

CREATE TABLE creditCard (
	cardID INT AUTO_INCREMENT,
	userId INT,
	cName VARCHAR(128) NOT NULL,
	cNumber VARCHAR(32) NOT NULL,
	eDate VARCHAR(8) NOT NULL,
	cvcCode VARCHAR(8) NOT NULL,
	CONSTRAINT fk_user2 FOREIGN KEY (userID) REFERENCES users(userID),
	PRIMARY KEY (cardID)
);

CREATE TABLE products (
	productID INT AUTO_INCREMENT,
	name VARCHAR(256) NOT NULL,
	description VARCHAR(4096) NOT NULL,
	price FLOAT NOT NULL,
	picFileName VARCHAR(64),
	PRIMARY KEY (productID),
	inventory INT NOT NULL
);

CREATE TABLE shoppingCart (
	cartID INT AUTO_INCREMENT,
	userId INT,
        sAddress INT,
	CONSTRAINT fk_user3 FOREIGN KEY (userID) REFERENCES users(userID),
	CONSTRAINT fk_shippingAddress FOREIGN KEY (sAddress) REFERENCES shippingAddress(sAddress),
	PRIMARY KEY (cartID)
);

CREATE TABLE shopCartItem (
	cartItemID INT AUTO_INCREMENT,
	productID INT,
	cartID INT,
	CONSTRAINT fk_product FOREIGN KEY (productID) REFERENCES products(productID),
	CONSTRAINT fk_cart FOREIGN KEY (cartID) REFERENCES shoppingCart(cartID),
	quantity INT NOT NULL,
	PRIMARY KEY (cartItemID) 
);