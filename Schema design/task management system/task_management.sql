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
            reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE  
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
    login_attempt (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        role_id INT,
        is_success bool,
        attempt_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES employees (id),
        FOREIGN KEY (role_id) REFERENCES roles (id)
    );

CREATE TABLE
    tasks (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        task_name VARCHAR(50),
        descriptions VARCHAR(100),
        due_date DATE,
        priority_levels INT, -- sort order number
        assignee_name VARCHAR(50), -- if applicable
        -- assigned_to VARCHAR(45),
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        deleted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        task_status
        SET
            ('to-do', 'in-progress', 'completed') NOT NULL,
        FOREIGN KEY (user_id) REFERENCES employees (id)
    );

CREATE TABLE
    teams (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        user_name VARCHAR(45),
        task_id INT,
        team_name VARCHAR(45),
        FOREIGN KEY (user_id) REFERENCES employees (id),
        FOREIGN KEY (task_id) REFERENCES tasks (id)
    );

CREATE TABLE
    activities (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        task_id INT,
        task_name VARCHAR(45),
        descriptions VARCHAR(100),
        activity VARCHAR(100),
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        deleted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        activity_status
        SET
            ('to do', 'in progress', 'completed') NOT NULL,
        FOREIGN KEY (user_id) REFERENCES employees (id),
        FOREIGN KEY (task_id) REFERENCES tasks (id)
    );

CREATE TABLE
    comments (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        task_id INT,
        title VARCHAR(45),
        activity_id INT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        deleted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES employees (id),
        FOREIGN KEY (task_id) REFERENCES tasks (id),
        FOREIGN KEY (activity_id) REFERENCES activities (id)
    );