CREATE TABLE
    users (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        user_name VARCHAR(255), -- store email
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        email VARCHAR(255),
        dob date,
        user_contact VARCHAR(255),
        user_address VARCHAR(255),
        user_password VARCHAR(45),
        pw_salt VARCHAR(45),
        activation_token varchar(255),
        password_token varchar(255),
        isvalid bool default (0),
        reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        gender
        SET
            ('male', 'female', 'no value') NOT NULL,
    );

--  book cover image we have to upload images in cloud and provide links
CREATE TABLE
    books (
        id INT PRIMARY KEY AUTO_INCREMENT,
        author_id INT,
        categorie_id INT,
        publisher_id INT,
        lang_id INT,
        title VARCHAR(255),
        author VARCHAR(255),
        genre VARCHAR(255),
        publication_year VARCHAR(255),
        ISBN VARCHAR(255) UNIQUE NOT NULL,
        comments VARCHAR(255),
        read_status
        SET
            ('Read', 'Currently Reading', 'To Read') NOT NULL,
        FOREIGN KEY (author_id) REFERENCES authors (id),
        FOREIGN KEY (categorie_id) REFERENCES categories (id),
        FOREIGN KEY (publisher_id) REFERENCES publishers (id),
        FOREIGN KEY (lang_id) REFERENCES languages (id)
    );

CREATE TABLE
    categories (
        id INT PRIMARY KEY NOT NULL,
        catgry_name VARCHAR(255),
        descriptions VARCHAR(255)
    );
    
CREATE TABLE
    languages (
        id INT PRIMARY KEY NOT NULL,
        lang_name VARCHAR(255),
        code VARCHAR(255)
    );

CREATE TABLE
    publishers (
        id INT PRIMARY KEY NOT NULL,
        publi_name VARCHAR(255),
        email VARCHAR(255),
        phone VARCHAR(255),
        address VARCHAR(255)
    );

CREATE TABLE
    authors (
        id INT PRIMARY KEY NOT NULL,
        author_name VARCHAR(255) NOT NULL,
        auth_address VARCHAR(255)
    );

CREATE TABLE
    reviews (
        id INT PRIMARY KEY NOT NULL,
        book_id INT,
        user_id INT,
        have_read bool,
        rating INT,
        comments VARCHAR(255),
        reviews_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (book_id) REFERENCES books (id),
        FOREIGN KEY (user_id) REFERENCES users (id)
    );

