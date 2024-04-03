CREATE TABLE
    users (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        user_name VARCHAR(255), --store email as user name
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        email VARCHAR(255),
        phone_number VARCHAR(255),        
        gender SET ('male', 'female', 'no value') NOT NULL,
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

CREATE TABLE recipes(
        id INT PRIMARY KEY AUTO_INCREMENT,
        recipe_name VARCHAR(45),
        descriptions VARCHAR(100),
        meal_type VARCHAR(100),
        ingredients VARCHAR(100),
        cooking_method VARCHAR(255),
        cooking_time TIME,
        nutritions VARCHAR(100),
        difficulty_level SET ('easy','medium','hard','extreme hard') NOT NULL,
        popularity 
  
);