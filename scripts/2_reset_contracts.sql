-- Drop table

DROP TABLE IF EXISTS contracts;

-- Drop enum type

DROP TYPE IF EXISTS contract_analysis_status;

-- Create enum type

CREATE TYPE contract_analysis_status AS ENUM (
    'PENDING',
    'ANALYZING',
    'ANALYZED',
    'FAILED'
);

-- Create table

CREATE TABLE contracts (

    id SERIAL PRIMARY KEY,

    -- Owner
    user_id INTEGER NOT NULL REFERENCES users(id),

    -- Contract Information
    name VARCHAR(255) NOT NULL,

    -- S3
    s3_key VARCHAR(500) NOT NULL,

    -- Analysis
    status contract_analysis_status NOT NULL DEFAULT 'PENDING',

    -- Timestamp
    created_at TIMESTAMP NOT NULL DEFAULT NOW()

);
