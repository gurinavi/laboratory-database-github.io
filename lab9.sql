CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE projects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE project_users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  project_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES projects(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  UNIQUE (project_id, user_id) 
);

CREATE TABLE tasks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  project_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  author_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (project_id) REFERENCES projects(id),
  FOREIGN KEY (author_id) REFERENCES users(id) 
);

CREATE TABLE task_users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  task_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (task_id) REFERENCES tasks(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  UNIQUE (task_id, user_id) 
);

CREATE TABLE files (
  id INT AUTO_INCREMENT PRIMARY KEY,
  project_id INT,
  task_id INT,
  file_url VARCHAR(255) NOT NULL,
  uploaded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (project_id) REFERENCES projects(id),
  FOREIGN KEY (task_id) REFERENCES tasks(id)
);

INSERT INTO users (id, name, email) VALUES
  (1, 'Alice Bear', 'alice@bear.com'),
  (2, 'Bob Smith', 'bob@smith.com'),
  (3, 'Charlie Davis', 'charlie@davis.com'),
  (4, 'Diana Moore', 'diana@moore.com');

INSERT INTO projects (id, name, description, created_at) VALUES
  (1, 'Website Redesign', 'Redesign the company website.', '2024-11-01 10:00:00'),
  (2, 'Mobile App Development', 'Develop a cross-platform mobile application.', '2024-11-10 12:30:00');

INSERT INTO project_users (id, project_id, user_id) VALUES
  (1, 1, 1), 
  (2, 1, 2), 
  (3, 2, 3), 
  (4, 2, 4); 

INSERT INTO tasks (id, project_id, title, description, author_id, created_at) VALUES
  (1, 1, 'Create Wireframes', 'Design wireframes for the new website layout.', 1, '2024-11-05 09:00:00'),
  (2, 1, 'Develop Frontend', 'Implement the frontend based on approved wireframes.', 2, '2024-11-15 14:00:00'),
  (3, 2, 'Set Up Backend', 'Set up the backend infrastructure for the app.', 3, '2024-11-20 16:00:00');

INSERT INTO task_users (id, task_id, user_id) VALUES
  (1, 1, 2), 
  (2, 2, 1), 
  (3, 3, 4);

INSERT INTO files (id, project_id, task_id, file_url, uploaded_at) VALUES
  (1, 1, 1, 'https://balsamiq.com/assets/learn/articles/account-setup-wireframe.png', '2024-11-05 10:00:00'),
  (2, 1, NULL, 'https://itproger.com/img/news/1617555057.jpg', '2024-11-01 11:00:00'),
  (3, 2, 3, 'https://highload.today/wp-content/uploads/2022/02/image1-16.png', '2024-11-20 17:00:00');

SELECT 
    projects.id AS project_id,
    projects.name AS project_name,
    projects.description AS project_description
FROM 
    projects;

SELECT 
    files.file_url AS related_file,
    files.uploaded_at AS file_uploaded_at,
    files.task_id AS task_id,
    files.project_id AS project_id
FROM 
    files;




