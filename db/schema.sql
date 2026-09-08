CREATE TABLE IF NOT EXISTS activity_logs(
    activity_log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(255),
    user_email VARCHAR(255),
    activity_log_action VARCHAR(50) NOT NULL,
    activity_log_status ENUM('success', 'failed') DEFAULT 'SUCCESS',

    -- CLIENT PARAMETERS
    activity_log_ip_address VARCHAR(45),
    activity_log_user_agent VARCHAR(255),

    -- TIMESTAMP
    activity_log_create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABLE #3 users table
CREATE TABLE IF NOT EXISTS users (
    -- Primary Key for users table
    user_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Initial user details
    user_email VARCHAR(50) UNIQUE NOT NULL,
    user_username VARCHAR(20) UNIQUE NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    user_role ENUM('admin', 'manager', 'user') NOT NULL DEFAULT 'user',

    -- User Created Timestamps default not null
    user_created_at TIMESTAMP 
        DEFAULT CURRENT_TIMESTAMP,

    -- User updated timestamp
    user_update_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP 
);

-- INSERT QUERY
INSERT INTO users
(
    user_email,
    user_username,
    user_password,
    user_role
)
VALUES
(
    'admin@example.com',
    'admin',
    '$2y$10$HNfhClczEWBxcFuJwP53iu2Y75Tba7IEtmX8vX.1tp0dZ5EVt9CbO',
    'admin'
),
(
    'manager@example.com',
    'manager',
    '$2y$10$HNfhClczEWBxcFuJwP53iu2Y75Tba7IEtmX8vX.1tp0dZ5EVt9CbO',
    'manager'
),
(
    'user@example.com',
    'user',
    '$2y$10$HNfhClczEWBxcFuJwP53iu2Y75Tba7IEtmX8vX.1tp0dZ5EVt9CbO',
    'user'
);