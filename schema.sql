/* Database schema to keep the structure of entire database. */


CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL(5,2) NOT NULL);

ALTER TABLE animals
ADD species VARCHAR(50);

CREATE TABLE owners (
id SERIAL PRIMARY KEY,
full_name VARCHAR(50) NOT NULL,
age INTEGER NOT NULL
);

CREATE TABLE species (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL
);


ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals ADD species_id INT;

ALTER TABLE animals DROP COLUMN species_id;

ALTER TABLE animals DROP COLUMN owner_id;

ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);