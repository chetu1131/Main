--i have to make changes

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
        FOREIGN KEY (user_id) REFERENCES employees (id),
        FOREIGN KEY (role_id) REFERENCES roles (id)
    );

CREATE TABLE
    exams (
        id INT PRIMARY KEY AUTO_INCREMENT,
        exam_title VARCHAR(255),
        instructions VARCHAR(255),
        exam_date date,
        duration INT, -- times up automatic submission
        total_marks INT,
        passing_marks float,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    questions (
        id INT PRIMARY KEY AUTO_INCREMENT,
        exma_id INT,
        q_title VARCHAR(255), --quetion
        q_level VARCHAR(255),
        -- q_items VARCHAR(255), -- options 
        -- here changes - can make a separte option table defining radio check... okay okay but what if question has multiple choices.. later on..
        opt1 VARCHAR(255), -- multiple choices - checkbox & single choices - radiobox or both have same - checkbox?
        opt2 VARCHAR(255),
        opt3 VARCHAR(255),
        opt4 VARCHAR(255),
        is_active bool, -- several questions, but for one exam perticular questions remain active at a time
        q_points INT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP FOREIGN KEY (exam_id) REFERENCES exams (id),
    );

CREATE TABLE
    answers (
        id INT PRIMARY KEY AUTO_INCREMENT,
        exma_id INT,
        q_id INT,
        q_ans VARCHAR(255),
        answered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP FOREIGN KEY (exam_id) REFERENCES exams (id),
        FOREIGN KEY (q_id) REFERENCES questions (id)
    );

-- for now we consider that all questions and answeres are hard coded, can't be change the content
-- to manage exam content we have to create question_history and answers_history -->because if instructor changes the question text after the exam, then the q_id is pointing to a different question than the question on the exam.
CREATE TABLE
    student_tests (
        id INT PRIMARY KEY AUTO_INCREMENT,
        cand_id INT,
        exam_id INT,
        -- test_status SMALLINT NOT NULL DEFAULT 0, --like enrolled, started, paused, finished   
        score INT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        start_time TIMESTAMP,
        finish_time TIMESTAMP,
        FOREIGN KEY (cand_id) REFERENCES users (id),
        FOREIGN KEY (exam_id) REFERENCES exams (id)
    );

CREATE TABLE
    student_question_answer (
        id INT PRIMARY KEY AUTO_INCREMENT,
        particpt_id INT,
        q_id INT,
        is_active bool, -- attempt or not
        ans_id INT,
        is_correct bool, -- correct or not
        -- is_true SMALLINT NOT NULL DEFAULT 0,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (q_id) REFERENCES questions (id),
        FOREIGN KEY (ans_id) REFERENCES answeres (id),
    );

--based on student's answers store result 
CREATE TABLE
    results (
        id INT PRIMARY KEY NOT NULL,
        exam_id INT,
        total_marks INT,
        obtained_marks INT,
        q_id INT,
        ans_id INT,
        q_ans VARCHAR(255),
        is_correct bool,
    );