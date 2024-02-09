CREATE TABLE USER(
    U_id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(50),
    City VARCHAR(50),
    Zip_code INT,
    Password VARCHAR(50),
    Active_status BOOLEAN
);

CREATE TABLE Billing(
    B_id INT PRIMARY KEY AUTO_INCREMENT,
    U_id INT NOT NULL,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    Zip_code INT,
    State VARCHAR(50),
    Card_no INT NOT NULL,
    CVV INT NOT NULL,
    ExpirationDate CHAR(5) NOT NULL CHECK (ExpirationDate LIKE '__/__'),
    Purchase_date DATE
)

CREATE TABLE Memberships(
    M_id INT PRIMARY KEY AUTO_INCREMENT,
    U_id INT,
    Plan VARCHAR(15) NOT NULL CHECK(MPlan IN('Basic', 'Pro', 'Free')),
    FOREIGN KEY U_id REFERENCES USER(U_id)
)

CREATE TABLE Query(
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(15),
    Message VARCHAR(1000)
)

-- FOOD RELATED
CREATE TABLE Restaurant(
    R_id INT PRIMARY KEY AUTO_INCREMENT,
    -- U_id to check which user posted reataurant's ad
    U_id INT NOT NULL,
    Name VARCHAR(50),
    Address VARCHAR(100),
    Description VARCHAR(500),
    Specialities VARCHAR(100),
    FOREIGN KEY U_id REFERENCES USER(U_id)
);

CREATE TABLE ITEM(
    S_id INT PRIMARY KEY AUTO_INCREMENT,
    R_id INT NOT NULL,
    Type VARCHAR(50),
    Name VARCHAR(50),
    Cuisine VARCHAR(50,)
    FOREIGN KEY R_id REFERENCES Restaurant(R_id),
    Add_date DATE
);

CREATE TABLE Review (
    S_id PRIMARY KEY
    Nutrition INT NOT NULL CHECK (Nutrition BETWEEN 1 AND 5),
    Hygiene INT NOT NULL CHECK (Hygiene BETWEEN 1 AND 5),
    Safety INT NOT NULL CHECK (Safety BETWEEN 1 AND 5),
    Organic INT NOT NULL CHECK (Organic BETWEEN 1 AND 5),
    Sustainability INT NOT NULL CHECK (Sustainability BETWEEN 1 AND 5),
    Consumer_preference INT NOT NULL CHECK (Consumer_preference BETWEEN 1 AND 5)
    FOREIGN KEY S_id REFERENCES ITEM(S_id)
);

CREATE TABLE Specs(
    S_id PRIMARY KEY,
    Spice INT NOT NULL CHECK (Spice BETWEEN 1 AND 10),
    Sweetness INT NOT NULL CHECK (Sweetness BETWEEN 1 AND 10),
    Salty INT NOT NULL CHECK (Salty BETWEEN 1 AND 10),
    Vegetables VARCHAR(3) NOT NULL CHECK(Vegetables IN('YES','NO')),
    MEAT VARCHAR(50) NOT NULL CHECK(MEAT IN('Fish','Poultry', 'Lamb', 'Beef', 'Pork', 'Turkey', 'Other')),
);

CREATE TABLE Spicy(
    U_id INT PRIMARY KEY AUTO_INCREMENT,
    S_id INT,
    Spice INT NOT NULL CHECK (Spice BETWEEN 1 AND 10),
    FOREIGN KEY S_id REFERENCES SPECS(S_id)
)

CREATE TABLE Sweetness(
    U_id INT PRIMARY KEY AUTO_INCREMENT,
    S_id INT,
    Sweetness INT NOT NULL CHECK (Spice BETWEEN 1 AND 10),
    FOREIGN KEY S_id REFERENCES SPECS(S_id)
)

CREATE TABLE Vegetarian(
    U_id INT PRIMARY KEY AUTO_INCREMENT,
    S_id INT,
   Vegetables VARCHAR(3) NOT NULL CHECK(Vegetables IN('YES','NO')),
    FOREIGN KEY S_id REFERENCES SPECS(S_id)
)

CREATE TABLE Salty(
    U_id INT PRIMARY KEY AUTO_INCREMENT,
    S_id INT,
    Saltiness INT NOT NULL CHECK (Spice BETWEEN 1 AND 10),
    FOREIGN KEY S_id REFERENCES SPECS(S_id)
)

CREATE TABLE Carnivore(
    U_id INT PRIMARY KEY AUTO_INCREMENT,
    S_id INT,
    Meat VARCHAR(50) NOT NULL CHECK(MEAT IN('Fish','Poultry', 'Lamb', 'Beef', 'Pork', 'Turkey', 'Other'))
    FOREIGN KEY S_id REFERENCES SPECS(S_id)
)

-- SUPER MARKET

CREATE TABLE Supermarket(
    S_id INT PRIMARY KEY AUTO_INCREMENT,
    -- U_id to check which user posted supermarket's ad
    U_id INT NOT NULL,
    Name VARCHAR(50),
    Address VARCHAR(100),
    Description VARCHAR(500),
    FOREIGN KEY U_id REFERENCES USER(U_id)
);

CREATE TABLE Market_ITEM(
    I_id INT PRIMARY KEY AUTO_INCREMENT,
    S_id INT NOT NULL,
    Name VARCHAR(50),
    Cuisine VARCHAR(50,)
    FOREIGN KEY R_id REFERENCES Restaurant(S_id),
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5)
    Add_date DATE
);