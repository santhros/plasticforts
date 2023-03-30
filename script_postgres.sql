CREATE TABLE star(star_id SERIAL PRIMARY KEY,
                  galaxy_id INT NOT NULL,
                  name VARCHAR(30) NOT NULL UNIQUE,
                  description TEXT NOT NULL,
                  star_type   VARCHAR(15),
                  is_black_hole   BOOLEAN,
                  diameter_kms    NUMBER(10,2),
                  distance_in_liteyrs INT,
                  quantity_of_planets INT,
                  relative_brightness NUMBER(10,2),
                  age_million_years  NUMBER(15,2),
                  orbital_period_days NUMBER(8,2),
                  CONSTRAINT fk_galaxy FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
                  );

INSERT INTO star (galaxy_id, name, description, star_type, is_black_hole, diameter_kms,
                  distance_in_liteyrs, quantity_of_planets, relative_brightness, age_million_years,
                  orbital_period_days)
VALUES (1, ‘Sun’, ‘Our Solar System Star’, ‘YELLOW MEDIAN’, FALSE, 1384000, 0, 9, 6.1, 4850),
(1, ‘K-PAX’, 
