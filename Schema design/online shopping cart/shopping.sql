CREATE TABLE
    users (
        id INT PRIMARY KEY NOT NULL,
        user_name VARCHAR(255), --store email as user name
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        email VARCHAR(255),
        phone_number VARCHAR(255),
        gender
        SET
            ('male', 'female', 'no value') NOT NULL,
            dob date,
            user_address VARCHAR(255),
            user_password VARCHAR(45),
            pw_salt VARCHAR(45),
            activation_token varchar(255),
            password_token varchar(255),
            isvalid bool default (0),
            reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    products (
        id INT PRIMARY KEY NOT NULL,
        product_name VARCHAR(255),
        category VARCHAR(255),
        descriptions VARCHAR(255),
        price decimal,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    cart_items (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        product_id INT,
        product_name VARCHAR(255),
        price float,
        quantity INT,
        total_price float,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (product_id) REFERENCES products (id),
        FOREIGN KEY (user_id) REFERENCES users (id)
    );

CREATE TABLE
    order_items (
        id INT PRIMARY KEY AUTO_INCREMENT,
        order_id INT,
        product_id INT,
        product_name VARCHAR(255),
        quantity INT,
        price float,
        diccount float,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (product_id) REFERENCES products (id)
    );

CREATE TABLE
    order_details (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        item_id INT,
        subtotal decimal,
        shipping_addresss VARCHAR(255),
        shipping_charge decimal,
        expected_delivery date,
        total_amount decimal,
        order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (id),
        FOREIGN KEY (item_id) REFERENCES order_items (id)
    );

CREATE TABLE
    addresses (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        order_id INT,
        first_name VARCHAR(45),
        last_name VARCHAR(45),
        mobile_no VARCHAR(15),
        email VARCHAR(50),
        address_1 VARCHAR(75),
        address_2 VARCHAR(75),
        postal_code VARCHAR(45),
        city VARCHAR(45),
        country VARCHAR(45),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (id),
        FOREIGN KEY (order_id) REFERENCES order_items (id)
    );
CREATE TABLE
    payment_details (
        id INT PRIMARY KEY AUTO_INCREMENT,
        order_id INT,
        amount decimal,
        transcation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (order_id) REFERENCES order_details (id)
    );

CREATE TABLE
    order_history (
        id INT PRIMARY KEY AUTO_INCREMENT,
        order_id INT,
        order_status VARCHAR(255), --shipping or cancelled
        transaction_date date,
        delivery_date date,
        FOREIGN KEY (order_id) REFERENCES order_details (id)
    );  `