-- Create the database
CREATE DATABASE IF NOT EXISTS user_management_service;

-- Use the database
USE user_management_service;

-- Users Table
CREATE TABLE users (
    user_id VARCHAR(36) NOT NULL PRIMARY KEY, -- UUID for user ID
    username VARCHAR(50) NOT NULL UNIQUE,     -- Unique username
    email VARCHAR(100) NOT NULL UNIQUE,       -- Unique email address
    password_hash VARCHAR(255) NOT NULL,      -- Hashed password
    is_active BOOLEAN NOT NULL DEFAULT TRUE,  -- Indicates if the user account is active
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Account creation timestamp
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Last update timestamp
);


-- Indexes for performance optimization
CREATE INDEX idx_user_email ON users (email);
CREATE INDEX idx_user_username ON users (username);



-- Insert 50 dummy user records with incremental user_id starting from 10000
INSERT INTO users (user_id, username, email, password, is_active, created_at, updated_at)
VALUES
  (10000, 'john_doe', 'john.doe1@example.com', 'password123', TRUE, NOW(), NOW()),
  (10001, 'jane_smith', 'jane.smith2@example.com', 'password123', TRUE, NOW(), NOW()),
  (10002, 'alice_jones', 'alice.jones3@example.com', 'password123', TRUE, NOW(), NOW()),
  (10003, 'bob_brown', 'bob.brown4@example.com', 'password123', TRUE, NOW(), NOW()),
  (10004, 'charlie_williams', 'charlie.williams5@example.com', 'password123', TRUE, NOW(), NOW()),
  (10005, 'david_miller', 'david.miller6@example.com', 'password123', TRUE, NOW(), NOW()),
  (10006, 'emma_davis', 'emma.davis7@example.com', 'password123', TRUE, NOW(), NOW()),
  (10007, 'frank_moore', 'frank.moore8@example.com', 'password123', TRUE, NOW(), NOW()),
  (10008, 'grace_taylor', 'grace.taylor9@example.com', 'password123', TRUE, NOW(), NOW()),
  (10009, 'hannah_clark', 'hannah.clark10@example.com', 'password123', TRUE, NOW(), NOW()),
  (10010, 'ian_rodriguez', 'ian.rodriguez11@example.com', 'password123', TRUE, NOW(), NOW()),
  (10011, 'jack_harris', 'jack.harris12@example.com', 'password123', TRUE, NOW(), NOW()),
  (10012, 'karen_lewis', 'karen.lewis13@example.com', 'password123', TRUE, NOW(), NOW()),
  (10013, 'linda_martin', 'linda.martin14@example.com', 'password123', TRUE, NOW(), NOW()),
  (10014, 'michael_thompson', 'michael.thompson15@example.com', 'password123', TRUE, NOW(), NOW()),
  (10015, 'natalie_white', 'natalie.white16@example.com', 'password123', TRUE, NOW(), NOW()),
  (10016, 'oliver_hall', 'oliver.hall17@example.com', 'password123', TRUE, NOW(), NOW()),
  (10017, 'paul_lee', 'paul.lee18@example.com', 'password123', TRUE, NOW(), NOW()),
  (10018, 'quinn_gonzalez', 'quinn.gonzalez19@example.com', 'password123', TRUE, NOW(), NOW()),
  (10019, 'rachel_king', 'rachel.king20@example.com', 'password123', TRUE, NOW(), NOW()),
  (10020, 'sam_adams', 'sam.adams21@example.com', 'password123', TRUE, NOW(), NOW()),
  (10021, 'tina_harris', 'tina.harris22@example.com', 'password123', TRUE, NOW(), NOW()),
  (10022, 'ursula_allen', 'ursula.allen23@example.com', 'password123', TRUE, NOW(), NOW()),
  (10023, 'victor_scott', 'victor.scott24@example.com', 'password123', TRUE, NOW(), NOW()),
  (10024, 'wanda_young', 'wanda.young25@example.com', 'password123', TRUE, NOW(), NOW()),
  (10025, 'xander_baker', 'xander.baker26@example.com', 'password123', TRUE, NOW(), NOW()),
  (10026, 'yara_jackson', 'yara.jackson27@example.com', 'password123', TRUE, NOW(), NOW()),
  (10027, 'zane_martinez', 'zane.martinez28@example.com', 'password123', TRUE, NOW(), NOW()),
  (10028, 'aaron_roberts', 'aaron.roberts29@example.com', 'password123', TRUE, NOW(), NOW()),
  (10029, 'bradley_wilson', 'bradley.wilson30@example.com', 'password123', TRUE, NOW(), NOW()),
  (10030, 'catherine_smith', 'catherine.smith31@example.com', 'password123', TRUE, NOW(), NOW()),
  (10031, 'daniel_jones', 'daniel.jones32@example.com', 'password123', TRUE, NOW(), NOW()),
  (10032, 'ella_davis', 'ella.davis33@example.com', 'password123', TRUE, NOW(), NOW()),
  (10033, 'felix_moore', 'felix.moore34@example.com', 'password123', TRUE, NOW(), NOW()),
  (10034, 'gwendolyn_taylor', 'gwendolyn.taylor35@example.com', 'password123', TRUE, NOW(), NOW()),
  (10035, 'harrison_miller', 'harrison.miller36@example.com', 'password123', TRUE, NOW(), NOW()),
  (10036, 'isla_wilson', 'isla.wilson37@example.com', 'password123', TRUE, NOW(), NOW()),
  (10037, 'jake_clark', 'jake.clark38@example.com', 'password123', TRUE, NOW(), NOW()),
  (10038, 'kelly_lee', 'kelly.lee39@example.com', 'password123', TRUE, NOW(), NOW()),
  (10039, 'lucas_rodriguez', 'lucas.rodriguez40@example.com', 'password123', TRUE, NOW(), NOW()),
  (10040, 'maria_hall', 'maria.hall41@example.com', 'password123', TRUE, NOW(), NOW()),
  (10041, 'nina_martin', 'nina.martin42@example.com', 'password123', TRUE, NOW(), NOW()),
  (10042, 'olga_jones', 'olga.jones43@example.com', 'password123', TRUE, NOW(), NOW()),
  (10043, 'peter_smith', 'peter.smith44@example.com', 'password123', TRUE, NOW(), NOW()),
  (10044, 'quincy_harris', 'quincy.harris45@example.com', 'password123', TRUE, NOW(), NOW()),
  (10045, 'rosa_wilson', 'rosa.wilson46@example.com', 'password123', TRUE, NOW(), NOW()),
  (10046, 'sophia_king', 'sophia.king47@example.com', 'password123', TRUE, NOW(), NOW()),
  (10047, 'timothy_smith', 'timothy.smith48@example.com', 'password123', TRUE, NOW(), NOW()),
  (10048, 'uriah_white', 'uriah.white49@example.com', 'password123', TRUE, NOW(), NOW()),
  (10049, 'vicky_james', 'vicky.james50@example.com', 'password123', TRUE, NOW(), NOW());
