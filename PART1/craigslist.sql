DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

DROP TABLE IF EXISTS regions CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS categories CASCADE;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    preferred_region_id INTEGER NOT NULL REFERENCES regions
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users,
    region_id INTEGER NOT NULL REFERENCES regions,
    category_id INTEGER NOT NULL REFERENCES categories
);



INSERT INTO regions (name) VALUES ('Baltimore');
INSERT INTO regions (name) VALUES ('Washington DC');

INSERT INTO users (username, password, preferred_region_id) VALUES ('Oloye', '1234abc', 1);

INSERT INTO categories (name) VALUES ('Housing offered');

INSERT INTO posts (title, text, user_id, region_id, category_id) VALUES ('Housing', 'This is the latest house in the neigborhood', 1, 1, 1);
