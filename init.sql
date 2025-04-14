-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS homer_db;

-- Use the database
USE homer_db;

-- Create the 'users' table
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255),
  `email` VARCHAR(255),
  `role` ENUM('admin', 'user', 'guest') NOT NULL DEFAULT 'user',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert default admin user
INSERT INTO users (username, password, name, email, role, created_at, updated_at)
VALUES 
  ('admin', MD5('sipcapture'), 'Admin', 'admin@localhost', 'admin', NOW(), NOW());

-- Create other necessary tables, like sessions and calls, if required by HOMER

-- Example of creating a 'sessions' table
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `session_id` VARCHAR(255) NOT NULL UNIQUE,
  `start_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `end_time` TIMESTAMP,
  `user_id` INT,
  FOREIGN KEY (`user_id`) REFERENCES users(`id`)
);

-- Example of creating a 'calls' table
CREATE TABLE IF NOT EXISTS `calls` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `caller_id` VARCHAR(255) NOT NULL,
  `callee_id` VARCHAR(255) NOT NULL,
  `start_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `end_time` TIMESTAMP,
  `session_id` INT,
  FOREIGN KEY (`session_id`) REFERENCES sessions(`id`)
);

-- Optionally, create more tables depending on the requirements for logging or stats
