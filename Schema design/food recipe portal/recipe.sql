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

CREATE TABLE
    categories (
        id INT PRIMARY KEY AUTO_INCREMENT,
        cat_name VARCHAR(45),
        descriptions VARCHAR(100),
        meal_type VARCHAR(100),
        ingredients VARCHAR(100)
    );

CREATE TABLE
    courses (
        id INT PRIMARY KEY AUTO_INCREMENT,
        instruction VARCHAR(100),
        cooking_method VARCHAR(255),
        ingredient_list VARCHAR(100),
        nutritions VARCHAR(100),
        serving_size INT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    recipes (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        recipe_name VARCHAR(45),
        descriptions VARCHAR(100),
        causine VARCHAR(100), ---if applicable
        prep_time TIME,
        cook_time TIME,
        category_id INT,
        course_id INT,
        difficulty_level
        SET
            ('easy', 'medium', 'hard', 'extreme hard') NOT NULL,
            -- img url VARCHAR(255),
            FOREIGN KEY (category_id) REFERENCES categories (id),
            FOREIGN KEY (course_id) REFERENCES courses (id),
            FOREIGN KEY (user_id) REFERENCES users (id)
    );

CREATE TABLE
    ingredients (
        id INT PRIMARY KEY AUTO_INCREMENT,
        i_name VARCHAR(45),
        calorie VARCHAR(45),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    recipe_ingredients (
        id INT PRIMARY KEY AUTO_INCREMENT,
        ingredient_id INT,
        recipe_id INT,
        quntity VARCHAR(45),
        FOREIGN KEY (ingredient_id) REFERENCES ingredients (id),
        FOREIGN KEY (recipe_id) REFERENCES recipes (id)
    );

CREATE TABLE
    reviews (
        id INT PRIMARY KEY AUTO_INCREMENT,
        recipe_id INT,
        user_id INT,
        review VARCHAR(100),
        comment VARCHAR(100),
        rating INT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (recipe_id) REFERENCES recipes (id),
        FOREIGN KEY (user_id) REFERENCES users (id)
    );