-- x --> admin ? "all functionality" : user
CREATE TABLE
  roles (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    role_name VARCHAR(45) NOT NULL,
    status bool,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

CREATE TABLE
  permissions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    permission_name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

CREATE TABLE
  role_permissions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    role_id INT NOT NULL,
    permission_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles (id),
    FOREIGN KEY (permission_id) REFERENCES permissions (id)
  );

CREATE TABLE
  logs (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_email VARCHAR(255),
    status bool,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  )
CREATE TABLE
  users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    -- phone_number VARCHAR(15) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    img_url VARCHAR(255),
    cover_img VARCHAR(255),
    bio VARCHAR(255),
    location VARCHAR(255),
    activatin_code VARCHAR(100),
    p_salt VARCHAR(45),
    status bool, --is active
    role_id INT is_private bool,
    FOREIGN KEY (role_id) REFERENCES roles (id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

--id, username, verified,accounts, tweets, likes, comments 
CREATE TABLE
  followers (
    user_id INT NOT NULL,
    follower_id INT NOT NULL,
    is_blocked bool,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (follower_id) REFERENCES users (id),
    PRIMARY KEY (user_id, follower_id)
  );

CREATE TABLE
  tweets (
    id INT NOT NULL AUTO_INCREMENT, -- tweet id
    user_id INT NOT NULL,
    content VARCHAR(255) NOT NULL, -- tweet text
    img_url VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id),
    PRIMARY KEY (id)
  );

CREATE TABLE
  medias (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tweet_id INT NOT NULL,
    media_url VARCHAR(255),
    media_type VARCHAR(255),
    description VARCHAR(255),
    FOREIGN KEY (tweet_id) REFERENCES tweets (id)
  );

CREATE TABLE
  drafts (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    tweet_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

CREATE TABLE
  retweets (
    id INT NOT NULL AUTO_INCREMENT,
    tweet_id INT NOT NULL, -- original post
    user_id INT NOT NULL,
    -- status bool,
    retweet_message VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tweet_id) REFERENCES tweets (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    PRIMARY KEY (id)
  );

CREATE TABLE
  tweet_comments (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    tweet_id INT,
    content VARCHAR(255),
    -- img_url VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (tweet_id) REFERENCES tweets (id),
    PRIMARY KEY (id)
  );

CREATE TABLE
  reply_comments (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    comment_id INT NOT NULL,
    comment VARCHAR(255),
    status bool,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (comment_id) REFERENCES tweet_comments (id)
  );

CREATE TABLE
  tweet_likes (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    tweet_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (tweet_id) REFERENCES tweets (id),
    PRIMARY KEY (user_id, tweet_id)
  );

CREATE TABLE
  comment_likes (
    id INT NOT NULL AUTO_INCREMENT,
    comment_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (comment_id) REFERENCES tweet_comments (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    PRIMARY KEY (comment_id, user_id)
  );

CREATE TABLE
  sharings (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tweet_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (tweet_id) REFERENCES tweets (id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  );

CREATE TABLE
  hashtag_lists (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    hashtag_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (hashtag_name)
  );

--creating instance of hash tags
CREATE TABLE
  hashtag_tweet_map (
    id INT NOT NULL AUTO_INCREMENT,
    hashtag_id INT NOT NULL,
    tweet_id INT NOT NULL,
    status bool,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (hashtag_id) REFERENCES hashtag_lists (id),
    FOREIGN KEY (tweet_id) REFERENCES tweets (id)
  );

CREATE TABLE
  bookmarks (
    id INT NOT NULL AUTO_INCREMENT,
    tweet_id INT NOT NULL,
    user_id INT NOT NULL,
    status bool,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tweet_id) REFERENCES tweets (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
  );

CREATE TABLE
  notifications (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    tweet_id INT NOT NULL,
    noti_type VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tweet_id) REFERENCES tweets (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
  );

CREATE TABLE
  mentions (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    tweet_id INT NOT NULL,
    mentioner_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tweet_id) REFERENCES tweets (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (mentioner_id) REFERENCES users (id)
  );

CREATE TABLE
  messages (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    content VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users (id),
    FOREIGN KEY (receiver_id) REFERENCES users (id)
  );
