drop database if exists cfforumdb;
create database cfforumdb;
use cfforumdb;

CREATE TABLE IF NOT EXISTS `MEMBERS` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(50) UNIQUE NOT NULL,
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `login_at` DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `post_count` INT NOT NULL DEFAULT 0,
  `role_id` int NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS `CATEGORIES` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT,
  `thread_count` INT NOT NULL DEFAULT 0,
  `post_count` INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `THREADS` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `category_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `last_post_at` DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `view_count` INT NOT NULL DEFAULT 0,
  `reply_count` INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `POSTS` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `thread_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE IF NOT EXISTS `Roles` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT
);

ALTER TABLE `THREADS` ADD FOREIGN KEY (`category_id`) REFERENCES `CATEGORIES` (`id`);

ALTER TABLE `THREADS` ADD FOREIGN KEY (`member_id`) REFERENCES `MEMBERS` (`id`);

ALTER TABLE `POSTS` ADD FOREIGN KEY (`thread_id`) REFERENCES `THREADS` (`id`);

ALTER TABLE `POSTS` ADD FOREIGN KEY (`member_id`) REFERENCES `MEMBERS` (`id`);

ALTER TABLE `MEMBERS` ADD FOREIGN KEY (`role_id`) REFERENCES `Roles` (`id`);

-- Insert Roles before Members due to foreign key relationship
insert into `roles` (name,description) values ('User','General User');

-- Insert fake members
INSERT INTO members (username, email, password, created_at, login_at, post_count, role_id)
VALUES 
  ('user1', 'user1@example.com', 'hashedpassword1', NOW(), NOW(), 0,1),
  ('user2', 'user2@example.com', 'hashedpassword2', NOW(), NOW(), 0,1),
  ('user3', 'user3@example.com', 'hashedpassword3', NOW(), NOW(), 0,1),
  ('user4', 'user4@example.com', 'hashedpassword4', NOW(), NOW(), 0,1),
  ('user5', 'user5@example.com', 'hashedpassword5', NOW(), NOW(), 0,1),
  ('user6', 'user6@example.com', 'hashedpassword6', NOW(), NOW(), 0,1),
  ('user7', 'user7@example.com', 'hashedpassword7', NOW(), NOW(), 0,1),
  ('user8', 'user8@example.com', 'hashedpassword8', NOW(), NOW(), 0,1),
  ('user9', 'user9@example.com', 'hashedpassword9', NOW(), NOW(), 0,1),
  ('user10', 'user10@example.com', 'hashedpassword10', NOW(), NOW(), 0,1);
