DROP DATABASE IF EXISTS soccer_leagues;

CREATE DATABASE soccer_leagues;

\c soccer_leagues

CREATE TABLE dates (
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE
);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name TEXT,
  ranking INTEGER,
  dates_id INTEGER REFERENCES dates
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  team_id INTEGER REFERENCES teams
);

CREATE TABLE referees (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
);

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  first_team TEXT,
  second_team TEXT,
  referee_id INTEGER REFERENCES referees,
  score TEXT
);

CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players,
  game_id INTEGER REFERENCES games
);







