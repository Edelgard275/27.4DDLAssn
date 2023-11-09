DROP DATABASE IF EXISTS soccer_leagues;

CREATE DATABASE soccer_leagues;

\c soccer_leagues;

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    team_city TEXT NOT NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    referee_name TEXT NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    player_birthday DATE NOT NULL,
    player_height INTEGER NOT NULL,
    current_team_id REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team_id REFERENCES teams ON DELETE CASCADE,
    away_team_id REFERENCES teams ON DELETE CASCADE,
    match_location TEXT NOT NULL,
    match_date DATE NOT NULL,
    match_start_time TEXT NOT NULL,
    season_id REFERENCES seasons ON DELETE CASCADE,
    head_referee_id REFERENCES referees ON DELETE CASCADE,
    assistant_referee_1_id REFERENCES references ON DELETE CASCADE,
    assistant_referee_2_id REFERENCES references ON DELETE CASCADE
);

CREATE TABLE lineups
(
    id SERIAL PRIMARY KEY,
    player_id REFERENCES players ON DELETE CASCADE,
    match_id REFERENCES matches ON DELETE CASCADE,
    team_id REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id REFERENCES players ON DELETE CASCADE,
    match_id REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id REFERENCES teams ON DELETE CASCADE,
    match_id REFERENCES matches ON DELETE CASCADE.
    result TEXT NOT NULL
);

