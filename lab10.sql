CREATE TABLE cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE 
);

CREATE TABLE metro_lines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT NOT NULL, 
    name VARCHAR(255) NOT NULL, 
    color VARCHAR(7), 
    FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE CASCADE 
);

CREATE TABLE stations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    line_id INT NOT NULL, 
    name VARCHAR(255) NOT NULL, 
    latitude DOUBLE, 
    longitude DOUBLE, 
    position_in_line INT, 
    FOREIGN KEY (line_id) REFERENCES metro_lines(id) ON DELETE CASCADE 
);

CREATE TABLE connections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    station1_id INT NOT NULL, 
    station2_id INT NOT NULL, 
    type ENUM('line', 'transfer') NOT NULL, 
    FOREIGN KEY (station1_id) REFERENCES stations(id) ON DELETE CASCADE, 
    FOREIGN KEY (station2_id) REFERENCES stations(id) ON DELETE CASCADE, 
    UNIQUE (LEAST(station1_id, station2_id), GREATEST(station1_id, station2_id))
);

INSERT INTO cities (name) VALUES
  ('Kyiv'),
  ('New York'),
  ('London'),
  ('Paris');

INSERT INTO metro_lines (city_id, name, color) VALUES
  (1, 'Red Line', '#FF0000'),
  (1, 'Blue Line', '#0000FF'),
  (2, '1st Avenue Line', '#00FF00'),
  (3, 'Central Line', '#FFFF00');

INSERT INTO stations (line_id, name, latitude, longitude, position_in_line) VALUES
  (1, 'Central Station', 50.4501, 30.5234, 1),
  (1, 'Victory Square', 50.4505, 30.5240, 2),
  (2, 'Times Square', 40.7580, -73.9855, 1),
  (3, 'Oxford', 51.5145, -0.1447, 1);

INSERT INTO connections (station1_id, station2_id, type) VALUES
  (1, 2, 'line'),  
  (2, 3, 'line'),  
  (1, 3, 'transfer');

SELECT 
    cities.name AS city_name,
    metro_lines.name AS line_name,
    metro_lines.color AS line_color,
    stations.name AS station_name,
    stations.latitude,
    stations.longitude,
    stations.position_in_line
FROM 
    cities
JOIN metro_lines ON cities.id = metro_lines.city_id
JOIN stations ON metro_lines.id = stations.line_id
ORDER BY cities.name, metro_lines.name, stations.position_in_line;



















