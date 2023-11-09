DROP DATABASE IF EXISTS craiglist;

CREATE DATABASE craigslist;

\c craiglist;

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    encrypted_password TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    body_text TEXT NOT NULL,
    location TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES regions ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories on DELETE CASCADE
);
