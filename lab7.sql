CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE news (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE comments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  news_id INT NOT NULL,
  user_ip VARCHAR(45) NOT NULL,
  content TEXT,
  comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (news_id) REFERENCES news(id)
);

CREATE TABLE ratings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  news_id INT NOT NULL,
  user_ip VARCHAR(45) NOT NULL,
  rating TINYINT CHECK (rating BETWEEN 1 AND 5),
  UNIQUE (news_id, user_ip),
  FOREIGN KEY (news_id) REFERENCES news(id)
);

INSERT INTO categories (name) VALUES
  ('Sports'),
  ('Business'),
  ('News'),
  ('Economic');

INSERT INTO news (title, content, category_id) VALUES
  ('New 1', 'Перемога на олімпійських іграх', 1),
  ('New 2', 'Новина про бізнес', 2),
  ('New 3', 'Інша новина', 3),
  ('New 4', 'Новина про економіку', 4);

INSERT INTO comments (news_id, user_ip, content, comment_date) VALUES
  (1, '105.134.0.1', 'Це чудова новина!', '2024-11-26 10:00:00'),
  (2, '192.168.1.10', 'Цікава інформація.', '2024-11-26 11:00:00'),
  (3, '203.0.113.5', 'Не зовсім актуально', '2024-11-26 12:00:00'),
  (4, '198.51.100.8', 'Актуальна новина.', '2024-11-26 13:00:00');

INSERT INTO ratings (news_id, user_ip, rating) VALUES
  (1, '105.134.0.1', 5),
  (2, '192.168.1.10', 4),
  (3, '203.0.113.5', 3),
  (4, '198.51.100.8', 4);

SELECT 
    categories.id AS category_id,
    categories.name AS category_name,
    news.id AS news_id,
    news.title AS news_title,
    news.content AS news_content
FROM categories
INNER JOIN news ON categories.id = news.category_id;

SELECT 
    news.id AS news_id,
    news.title AS news_title,
    comments.id AS comment_id,
    comments.user_ip AS comment_user_ip,
    comments.content AS comment_content,
    comments.comment_date AS comment_date
FROM news
INNER JOIN comments ON news.id = comments.news_id;

SELECT 
    news.id AS news_id,
    news.title AS news_title,
    ratings.id AS rating_id,
    ratings.user_ip AS rating_user_ip,
    ratings.rating AS rating_value
FROM news
INNER JOIN ratings ON news.id = ratings.news_id;




