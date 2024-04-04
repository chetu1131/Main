CREATE TABLE
    users (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
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

--  inventory table
CREATE TABLE
    items (
        id INT PRIMARY KEY AUTO_INCREMENT,
        supplier_id INT,
        product_id INT,
        order_id INT,
        SKU VARCHAR(255),
        --SKU (Stock Keeping Unit)
        descriptions VARCHAR(255),
        unit_cost FLOAT,
        discount FLOAT,
        price FLOAT,
        quntity INT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (supplier_id) REFERENCES suppliers (id),
        FOREIGN KEY (product_id) REFERENCES products (id),
        FOREIGN KEY (order_id) REFERENCES orders (id)
    );

--product table
CREATE TABLE
    products (
        id INT PRIMARY KEY AUTO_INCREMENT,
        p_name VARCHAR(55),
        p_details VARCHAR(255),
        supplier_id INT,
        FOREIGN KEY (supplier_id) REFERENCES suppliers (id),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    );

CREATE TABLE
    suppliers (
        id INT PRIMARY KEY AUTO_INCREMENT,
        s_name VARCHAR(45),
        s_contact VARCHAR(45),
        s_email VARCHAR(45),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    );

CREATE TABLE
    orders (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        sub_total FLOAT,
        discount FLOAT,
        shipping_cost FLOAT,
        total FLOAT,
        -- if coupon add discount and grand total
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (id)
    );

CREATE TABLE
    order_items (
        id INT PRIMARY KEY AUTO_INCREMENT,
        item_id INT,
        order_id INT,
        SKU VARCHAR(255),
        price FLOAT,
        discount FLOAT,
        quntity INT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (item_id) REFERENCES items (id),
        FOREIGN KEY (order_id) REFERENCES orders (id)
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
        FOREIGN KEY (order_id) REFERENCES orders (id)
    );

CREATE TABLE
    transactions (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        order_id INT,
        amount FLOAT,
        transaction_code VARCHAR(100),
        t_mode bool, -- online/offine if method -> credit, debit,COD, net banking
        t_status bool,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (id),
        FOREIGN KEY (order_id) REFERENCES orders (id)
    );

CREATE TABLE
    stock_adjustments (
        id INT PRIMARY KEY AUTO_INCREMENT,
        product_id INT,
        adjust_date date,
        adjust_desc VARCHAR(100) --receiving, transferring, and disposing of inventory items
        quantity_adjust INT,
        barcode_id VARCHAR(100),
        stock_quantity_before INT,
        stock_quantity_after INT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (product_id) REFERENCES products (id)
    );

CREATE TABLE
    stock_history (
        id INT PRIMARY KEY AUTO_INCREMENT,
        product_id INT,
        transaction_id INT,
        stock_quantity_before INT,
        stock_quantity_after INT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (product_id) REFERENCES products (id),
        FOREIGN KEY (transaction_id) REFERENCES transactions (id)
    );