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

-- Insert Roles
insert into `roles` (name,description) values ('User','General User');
insert into `roles` (name,description) values ('Moderator','Forum Moderator');
insert into `roles` (name,description) values ('Admin','Forum Administrator');

-- Insert Members
insert into `members` (username,email,password,created_at,login_at,post_count,role_id) 
values ('user1','user1@example.com','5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8',now(),now(),0,1);
insert into `members` (username,email,password,created_at,login_at,post_count,role_id) 
values ('user2','user2@example.com','5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8',now(),now(),0,1);
insert into `members` (username,email,password,created_at,login_at,post_count,role_id) 
values ('moderator1','moderator1@example.com','5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8',now(),now(),0,2);
insert into `members` (username,email,password,created_at,login_at,post_count,role_id) 
values ('admin1','admin1@example.com','5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8',now(),now(),0,3);

-- Insert Categories
insert into `categories` (name,description,thread_count,post_count) 
values ('General Discussion','General Discussion about anything',0,0);
insert into `categories` (name,description,thread_count,post_count) 
values ('Programming','Programming and coding',0,0);
insert into `categories` (name,description,thread_count,post_count) 
values ('Off Topic','Off topic discussions',0,0);

-- Insert Threads
insert into `threads` (category_id,member_id,title,created_at,last_post_at,view_count,reply_count) 
values (1,1,'Hello World!',now(),now(),0,0);
insert into `threads` (category_id,member_id,title,created_at,last_post_at,view_count,reply_count) 
values (2,2,'How to code in Python',now(),now(),0,0);
insert into `threads` (category_id,member_id,title,created_at,last_post_at,view_count,reply_count) 
values (3,1,'What is your favorite hobby?',now(),now(),0,0);

-- Insert Posts
insert into `posts` (thread_id,member_id,content,created_at,updated_at) 
values (1,1,'Hello everyone! This is my first post.',now(),now());
insert into `posts` (thread_id,member_id,content,created_at,updated_at) 
values (2,2,'I am new to Python and need some help.',now(),now());
insert into `posts` (thread_id,member_id,content,created_at,updated_at) 
values (3,1,'I love playing basketball in my free time.',now(),now());