DROP TABLE IF EXISTS dream_homes;

CREATE TABLE dream_homes (
  id SERIAL8 PRIMARY KEY,
  address VARCHAR(255),
  value INT8,
  number_of_bedrooms INT2,
  year_built INT4
); 
