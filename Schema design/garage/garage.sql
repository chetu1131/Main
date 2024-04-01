 
CREATE TABLE users (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	role_id int,
    user_name VARCHAR(255), -- store email
    first_name varchar(255),
    last_name varchar(255),
    email varchar(255),
    dob date,
    user_contact VARCHAR(255),
    gender SET('male', 'female', 'no value') NOT NULL,
    address VARCHAR(255),
    user_password VARCHAR(45),
    pw_salt VARCHAR(45),
	activation_token varchar (255),
    password_token varchar(255),
	isvalid bool default (0),
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE current_timestamp
);

 CREATE TABLE roles (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    role_name VARCHAR(45),
    role_desc VARCHAR(255),
    isActive BOOL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES users (id)
);

CREATE TABLE permissions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    permission_name VARCHAR(255),
    descriptions VARCHAR(255),
    is_active BOOL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE role_permissions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    role_id INT,
    permission_id INT,
    FOREIGN KEY (role_id)
        REFERENCES roles (id),
    FOREIGN KEY (permission_id)
        REFERENCES permissions (id)
);

 
CREATE TABLE appointments (
    appoint_id INT PRIMARY KEY AUTO_INCREMENT,
    date_created TIMESTAMP,
    customer_id INT,
    employee_id INT,
    garage_id INT,
    start_time TIMESTAMP,
    expected_end_time TIMESTAMP,
    cancelled BOOL,
    cancellation_reason VARCHAR(255),
    FOREIGN KEY (employee_id)
        REFERENCES employees (id),
    FOREIGN KEY (customer_id)
        REFERENCES users (id),
    FOREIGN KEY (garage_id)
        REFERENCES garages (garage_id)
);

CREATE TABLE garages (
    garage_id INT AUTO_INCREMENT PRIMARY KEY,
    garage_location VARCHAR(50),
    garage_name VARCHAR(30),
    owner_id INT,
  --   FOREIGN KEY (owner_id)
--         REFERENCES registers (id),
    FOREIGN KEY (garage_id)
        REFERENCES employees (id)
);

CREATE TABLE vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_detail VARCHAR(255),
    vehicle_problem varchar(255),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES users (id)
);

-- can add more coloumns in vehicle details like licence plate 
-- model id name manufacture details and other details
-- can add vehicle problems   

CREATE TABLE payment_bills (
    bill_no INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    expected_bill FLOAT,
    discount FLOAT,
    final_bill FLOAT,
    mode_of_payment VARCHAR(45),
    FOREIGN KEY (customer_id)
        REFERENCES users (id),
    FOREIGN KEY (employee_id)
        REFERENCES employees (id)
);

