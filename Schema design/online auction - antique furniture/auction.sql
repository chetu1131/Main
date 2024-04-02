create database auction;

use auction;

CREATE TABLE
    users (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        user_name VARCHAR(255),
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
    roles (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        role_name VARCHAR(45),
        role_desc VARCHAR(255),
        isActive BOOL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        user_id INT,
        FOREIGN KEY (user_id) REFERENCES users (id)
    );

CREATE TABLE
    permissions (
        id INT PRIMARY KEY AUTO_INCREMENT,
        permission_name VARCHAR(255),
        descriptions VARCHAR(255),
        is_active BOOL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    role_permissions (
        id INT PRIMARY KEY AUTO_INCREMENT,
        role_id INT,
        permission_id INT,
        FOREIGN KEY (role_id) REFERENCES roles (id),
        FOREIGN KEY (permission_id) REFERENCES permissions (id)
    );

CREATE TABLE
    login_attempt (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        role_id INT,
        is_success bool,
        attempt_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (id),
        FOREIGN KEY (role_id) REFERENCES roles (id)
    );

CREATE TABLE
    auction_listings (
        id INT PRIMARY KEY AUTO_INCREMENT,
        seller_id INT,
        auction_id INT,
        item_name VARCHAR(45),
        start_price FLOAT,
        reserve_price FLOAT,
        descriptions VARCHAR(45),
        item_origin VARCHAR(45),
        item_age INT,
        item_conditons VARCHAR(45),
        item_material VARCHAR(45),
        characteristics VARCHAR(100),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (seller_id) REFERENCES sellers (id)
    );

CREATE TABLE
    auction (
        id INT PRIMARY KEY AUTO_INCREMENT,
        item_id INT,
        descriptions VARCHAR(100),
        start_time DATETIME,
        end_time DATETIME,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (item_id) REFERENCES items (id)
    );

CREATE TABLE
    catgories (
        id INT PRIMARY KEY AUTO_INCREMENT,
        item_id INT,
        item_name VARCHAR(100),
        item_type VARCHAR(45),
        item_style VARCHAR(45),
        avail_time DATETIME,
        region VARCHAR(100),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (item_id) REFERENCES items (id)
    );

CREATE TABLE
    sellers (
        id INT PRIMARY KEY AUTO_INCREMENT,
        item_name VARCHAR(100),
        descriptions VARCHAR(100),
        start_price INT,
        reserve_price INT,
        buy_now bool,
        item_sold bool,
        item_duration DATETIME,
        auction_result VARCHAR(45),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    buyers (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        item_id INT,
        item_name VARCHAR(100),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (id),
        FOREIGN KEY (item_id) REFERENCES items (id)
    );

CREATE TABLE
    payments (
        id INT PRIMARY KEY AUTO_INCREMENT,
        buyer_id INT,
        amount FLOAT,
        transaction_code VARCHAR(100),
        payment_method VARCHAR(45),
        t_status bool, -- success or failed
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (buyer_id) REFERENCES buyers (id)
    );

CREATE TABLE
    auction_histories (
        id INT PRIMARY KEY AUTO_INCREMENT,
        auction_id INT,
        item_id INT,
        seller_id INT,
        buyer_id INT,
        payment_id INT,
        auction_result VARCHAR(45),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (auction_id) REFERENCES auction_listings (id),
        FOREIGN KEY (item_id) REFERENCES items (id),
        FOREIGN KEY (seller_id) REFERENCES sellers (id),
        FOREIGN KEY (buyer_id) REFERENCES buyers (id),
        FOREIGN KEY (payment_id) REFERENCES payments (id)
    );