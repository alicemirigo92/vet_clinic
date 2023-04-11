/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11),
('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-09-13', 3, true, 17),
('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species(name) Values('Pokemon');
INSERT INTO species(name) Values('Digimon');

-- If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

-- All other animals are Pokemon
UPDATE animals
SET species_id = (SELECT id from species WHERE name = 'Pokemon')
WHERE species_id IS NULL;


-- Update Sam Smith owns Agumon
UPDATE animals SET owner_id = 1 WHERE name LIKE 'Agumon';
-- Jennifer Orwell owns Gabumon and Pikachu
UPDATE animals SET owner_id = 2 WHERE name LIKE 'Gabumon';
-- Jennifer Orwell owns Gabumon and Pikachu
UPDATE animals SET owner_id = 2 WHERE name LIKE 'Pikachu';
-- Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = 3 WHERE name LIKE 'Devimon';
-- Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = 3 WHERE name LIKE 'Plantmon';
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Charmander';
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Squirtle';
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Blossom';
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = 5 WHERE name LIKE 'Angemon';
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = 5 WHERE name LIKE 'Boarmon';


INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, '2008-06-08');

-- Isert into specialisations table
INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1);

INSERT INTO specializations (vet_id, species_id)
VALUES (3, 1);

INSERT INTO specializations (vet_id, species_id)
VALUES (3, 2);

INSERT INTO specializations (vet_id, species_id)
VALUES (4, 2);

--insert into visits 
INSERT INTO visits (animal_id, vet_id, date_of_visit)  
VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'),'2021-02-02');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),'2019-12-21');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'),(SELECT id FROM vets WHERE name = 'William Tatcher'),'2020-08-10');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),'2021-04-07');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),'2019-09-29');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'),'2020-10-03');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'),'2020-11-04');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),'2019-01-24');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),'2019-05-15');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),'2020-02-27');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),'2020-08-03');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),'2020-05-24');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'),'2021-01-11');