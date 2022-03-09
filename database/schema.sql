-- psql -u pgmsvyk psql < database/schema.sql

-- DROP DATABASE reviewsDB IF EXISTS;

CREATE TABLE reviews (
  id SERIAL NOT NULL,
  product_id INT NOT NULL,
  rating INT NOT NULL,
  date BIGINT NOT NULL,
  summary VARCHAR NOT NULL,
  body TEXT NOT NULL,
  recommend BOOLEAN NOT NULL,
  reported BOOLEAN NOT NULL,
  reviewer_name VARCHAR (50) NOT NULL,
  reviewer_email VARCHAR (80) NOT NULL,
  response TEXT NOT NULL,
  helpfulness BIGINT NOT NULL,
  PRIMARY KEY (id)
);

COPY reviews FROM '/home/msvyk/HR2201/SDC/CSV_data/data/reviews.csv' DELIMITER ',' CSV HEADER;

CREATE INDEX ON reviews (id);
CREATE INDEX ON reviews (product_id);
CREATE INDEX ON reviews (rating);
CREATE INDEX ON reviews (recommend);

CREATE TABLE reviews_photos (
  id SERIAL,
  review_id INT,
  url VARCHAR,
  PRIMARY KEY (id)
);

COPY reviews_photos FROM '/home/msvyk/HR2201/SDC/CSV_data/data/reviews_photos.csv' DELIMITER ',' CSV HEADER;

CREATE INDEX ON reviews_photos (review_id);

CREATE TABLE char_reviews (
  id SERIAL,
  characteristics_id INT,
  review_id INT,
  value INT,
  PRIMARY KEY (id)
);

COPY char_reviews FROM '/home/msvyk/HR2201/SDC/CSV_data/data/characteristic_reviews.csv' DELIMITER ',' CSV HEADER;

CREATE INDEX ON char_reviews (review_id);

CREATE TABLE characteristics (
  id SERIAL,
  product_id INT,
  name VARCHAR (60),
  PRIMARY KEY (id)
);

COPY characteristics FROM '/home/msvyk/HR2201/SDC/CSV_data/data/characteristics.csv' DELIMITER ',' CSV HEADER;

CREATE INDEX ON characteristics (product_id);