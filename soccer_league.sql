DROP DATABASE IF EXISTS league_db;
CREATE DATABASE league_db;
\c league_db


CREATE TABLE leagues (
    id SERIAL PRIMARY KEY,
    NAME TEXT UNIQUE NOT NULL,
    season_start TEXT NOT NULL,
    season_end TEXT NOT NULL
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    rank INTEGER UNIQUE NOT NULL,
    league INTEGER REFERENCES leagues
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team INTEGER REFERENCES teams NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    referee INTEGER REFERENCES referees NOT NULL,
    team_1 INTEGER REFERENCES teams NOT NULL,
    team_1_score INTEGER NOT NULL,
    team_2 INTEGER REFERENCES teams NOT NULL,
    team_2_score INTEGER NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match INTEGER NOT NULL,
    player INTEGER NOT NULL
);

INSERT INTO leagues (
       name,season_start, season_end
    )
VALUES (
        'BigLeague','2022-05-01','2022-8-20'
    );

INSERT INTO teams (
     name,
     rank,
     league
    )
VALUES (
        'AlrightDudes',2,1
    ),
    (
        'YouBetterRun',1,1
    ),
    (
        'WeTry',3,1
    );


INSERT INTO players(
    first_name, last_name, team
)
VALUES (
    'Wonder','Woman',1
    ),
    (
        'Iron','Man',2
    ),
    (
    'Average','Joe',3
    );

INSERT INTO referees (
      first_name, last_name
    )
VALUES (
        'Jim','Halpert'
    );

INSERT INTO matches (
    referee,
    team_1,
    team_1_score,
    team_2,
    team_2_score
)
VALUES (
    1,1,5,2,6
),
(1,2,6,3,3);

INSERT INTO goals(
    match, player
)
VALUES(
    1,2
), 
(2,2);