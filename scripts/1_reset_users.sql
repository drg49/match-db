-- Drop dependent table first
DROP TABLE IF EXISTS contracts;

-- Drop table
DROP TABLE IF EXISTS users;

-- Create table (MATCHES FLASK MODEL)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,

  -- Auth
  email VARCHAR(150) UNIQUE NOT NULL,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  phone_number VARCHAR(20),

  -- Password hashes (scrypt/bcrypt hashes can exceed 105 chars)
  password VARCHAR(255) NOT NULL,

  -- Profile
  bio VARCHAR(1000),

  location VARCHAR(100),

  -- Account Status
  is_active BOOLEAN DEFAULT TRUE,

  -- Timestamp
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
