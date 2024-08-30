-- PART 1: Medical Center
DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

\c medical

CREATE TABLE medical_centers
(
    id SERIAL PRIMARY KEY,
);

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    diagnosis TEXT NOT NULL
);

-- part 2: Craigslist
DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    preferred_region TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT NOT NULL,
    post_location TEXT NOT NULL,
    user_id INTEGER REFERENCES users (id),
    region_id INTEGER REFERENCES regions (id)
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    cat_name TEXT NOT NULL
);

-- Part 3: Soccer league
DROP DATABASE IF EXISTS soccer_leagues;

CREATE DATABASE soccer_leagues;

\c soccer_leagues

CREATE TABLE leagues
(
    id SERIAL PRIMARY KEY,
    league TEXT NOT NULL,
    date_start_id INTEGER REFERENCES dates (id)
    date_end_id INTEGER REFERENCES dates (id)
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    league_id INTEGER REFERENCES leagues (id),
    ranking INTEGER NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams (id)
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    ref_name TEXT NOT NULL,
    --num_games...
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    --how to do the teams that played?
    num_goals INTEGER NOT NULL --?
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    --num_goals??
    match_id INTEGER REFERENCES matches (id)
);