CREATE TABLE
    employees (
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
            reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    );

CREATE TABLE
    roles (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        role_name VARCHAR(45),
        role_desc VARCHAR(255),
        isActive BOOL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        user_id INT,
        FOREIGN KEY (user_id) REFERENCES employees (id)
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
    attendances (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        is_present bool DEFAULT (0),
        present_date date,
        checked_in TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        checked_out TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES employees (id)
    );

CREATE TABLE
    breaks (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        break_in TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        break_reason VARCHAR(255), --('lunch','tea/coffee','phone calls','other') can use   drop down
        break_out TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES employees (id)
    );

CREATE TABLE
    attendsummary (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        present_date date,
        entry_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        exit_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        break_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        --working_hours - count on entry, break and exit
    );

CREATE TABLE
    audit_logs (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        activity_type VARCHAR(255),
        activaty_description VARCHAR(255),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES employees (id)
    );