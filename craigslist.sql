DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db 

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    region_preference INTEGER REFERENCES regions
 
);
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT NOT NULL,
    user_id INTEGER REFERENCES users NOT NULL,
    region_id INTEGER REFERENCES regions NOT NULL,
    location_name TEXT NOT NULL,
    post_date TEXT NOT NULL,
    category_id INTEGER REFERENCES categories NOT NULL
);

INSERT INTO regions (
     name
    )
VALUES (
        'Seattle'
    ),
    (
        'New York'
    );
INSERT INTO users (
       username
      
    )
VALUES (
        'notcraig'
    ),
    (
        'alsonotcraig'
    );
INSERT INTO categories(
    name
)
VALUES (
    'Missed connections'
    ),
    (
        'Services'
    );
INSERT INTO posts (
        title,
        post_text,
        user_id,
        region_id,
        location_name,
        post_date,
        category_id
    )
VALUES (
        'Lady with cheeseburger',
        'Where did you get that cheeseburger',
        1,
        1,
        'Renton',
        '2022-11-15',
        1
    ),
     (
        'Need a lift?',
        'I can lift heavy things',
        2,
        2,
        'anywhere',
        '2022-11-14',
        2
    );

