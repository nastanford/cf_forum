-- Create MEMBER table
CREATE TABLE MEMBER (
  member_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  join_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  post_count INT NOT NULL DEFAULT 0,
  last_activity DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create CATEGORY table
CREATE TABLE CATEGORY (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  thread_count INT NOT NULL DEFAULT 0,
  post_count INT NOT NULL DEFAULT 0
);

-- Create THREAD table
CREATE TABLE THREAD (
  thread_id INT AUTO_INCREMENT PRIMARY KEY,
  category_id INT NOT NULL,
  member_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_post_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  view_count INT NOT NULL DEFAULT 0,
  reply_count INT NOT NULL DEFAULT 0,
  FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id),
  FOREIGN KEY (member_id) REFERENCES MEMBER(member_id)
);

-- Create POST table
CREATE TABLE POST (
  post_id INT AUTO_INCREMENT PRIMARY KEY,
  thread_id INT NOT NULL,
  member_id INT NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (thread_id) REFERENCES THREAD(thread_id),
  FOREIGN KEY (member_id) REFERENCES MEMBER(member_id)
);

-- Create indexes for better performance
CREATE INDEX idx_member_username ON MEMBER(username);

CREATE INDEX idx_member_email ON MEMBER(email);

CREATE INDEX idx_thread_category ON THREAD(category_id);

CREATE INDEX idx_thread_member ON THREAD(member_id);

CREATE INDEX idx_post_thread ON POST(thread_id);

CREATE INDEX idx_post_member ON POST(member_id);