DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT,
  preferred_region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title TEXT,
  text TEXT,
  user_id INTEGER REFERENCES users(id),
  location TEXT,
  region_id INTEGER REFERENCES regions(id),
  categories_id INTEGER REFERENCES categories(id)
);



