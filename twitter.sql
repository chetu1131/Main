CREATE TABLE `roles` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  `status` bool,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `permissions` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `permission_name` VARCHAR(255),
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `deleted_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `role_permissions` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `role_id` INT NOT NULL,
  `permission_id` INT NOT NULL
);

CREATE TABLE `logs` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(255),
  `status` bool,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `users` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `user_email` VARCHAR(255) NOT NULL,
  `user_password` VARCHAR(255) NOT NULL,
  `full_name` VARCHAR(255) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `img_url` VARCHAR(255),
  `cover_img` VARCHAR(255),
  `bio` VARCHAR(255),
  `location` VARCHAR(255),
  `activatin_code` VARCHAR(100),
  `p_salt` VARCHAR(45),
  `status` bool,
  `role_id` INT,
  `is_private` bool,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `deleted_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `followers` (
  `user_id` INT NOT NULL,
  `follower_id` INT NOT NULL,
  `is_blocked` bool,
  PRIMARY KEY (`user_id`, `follower_id`)
);

CREATE TABLE `tweets` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `img_url` VARCHAR(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `deleted_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `drafts` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `tweet_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `retweets` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tweet_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `retweet_message` VARCHAR(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `deleted_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `tweet_comments` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` INT,
  `tweet_id` INT,
  `content` VARCHAR(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `deleted_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `reply_comments` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  `comment` VARCHAR(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `deleted_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `tweet_likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT,
  `tweet_id` INT,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (`user_id`, `tweet_id`)
);

CREATE TABLE `comment_likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (`comment_id`, `user_id`)
);

CREATE TABLE `hashtag_lists` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `hashtag_name` VARCHAR(50) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `hashtag_tweet_map` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hashtag_id` INT NOT NULL,
  `tweet_id` INT NOT NULL,
  `status` bool,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `bookmarks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tweet_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `status` bool,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `notifications` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `tweet_id` INT NOT NULL,
  `noti_type` VARCHAR(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `mentions` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `tweet_id` INT NOT NULL,
  `mentioner_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `messages` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `sender_id` INT NOT NULL,
  `receiver_id` INT NOT NULL,
  `content` VARCHAR(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE UNIQUE INDEX `hashtag_lists_index_0` ON `hashtag_lists` (`hashtag_name`);

ALTER TABLE `role_permissions` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

ALTER TABLE `role_permissions` ADD FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

ALTER TABLE `followers` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `followers` ADD FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`);

ALTER TABLE `tweets` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `retweets` ADD FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`);

ALTER TABLE `retweets` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `tweet_comments` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `tweet_comments` ADD FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`);

ALTER TABLE `reply_comments` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `reply_comments` ADD FOREIGN KEY (`comment_id`) REFERENCES `tweet_comments` (`id`);

ALTER TABLE `tweet_likes` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `tweet_likes` ADD FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`);

ALTER TABLE `comment_likes` ADD FOREIGN KEY (`comment_id`) REFERENCES `tweet_comments` (`id`);

ALTER TABLE `comment_likes` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `hashtag_tweet_map` ADD FOREIGN KEY (`hashtag_id`) REFERENCES `hashtag_lists` (`id`);

ALTER TABLE `hashtag_tweet_map` ADD FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`);

ALTER TABLE `bookmarks` ADD FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`);

ALTER TABLE `bookmarks` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `notifications` ADD FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`);

ALTER TABLE `notifications` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `mentions` ADD FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`);

ALTER TABLE `mentions` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `mentions` ADD FOREIGN KEY (`mentioner_id`) REFERENCES `users` (`id`);

ALTER TABLE `messages` ADD FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

ALTER TABLE `messages` ADD FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`);
