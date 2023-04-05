/* Database schema to keep the structure of entire database. */


CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL(5,2) NOT NULL);
