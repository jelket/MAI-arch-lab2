use archdb; 

CREATE TABLE IF NOT EXISTS `User` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `last_name` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `email` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
    `phone_number` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
    `login` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
    `password` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
    PRIMARY KEY (`id`),
    INDEX `fn` (`first_name`),
    INDEX `ln` (`last_name`));

CREATE TABLE IF NOT EXISTS `Conference` (
    `id` INT NOT NULL AUTO_INCREMENT, 
    `location` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `title` VARCHAR(2048) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `description` VARCHAR(4096) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `format` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `Lecture` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(2048) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `description` VARCHAR(4096) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `record_permission` BOOLEAN NOT NULL,
    `author_id` INT NOT NULL,
    `conference_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`author_id`) REFERENCES `User` (`id`),
    FOREIGN KEY (`conference_id`) REFERENCES `Conference` (`id`)
);

INSERT INTO `User` (first_name, last_name, email, phone_number, `login`, `password`) values
('Svetlana', 'Semyonova', 'semyonova@example.com', '+79918882233', 'ssemyonova', '123456234'),
('Pavel', 'Pavlov', 'pavlov@example.net', '+79929993344', 'ppavlov', '1234234'),
('Irina', 'Ivanova', 'ivanovairina@example.org', '+79931114455', 'iivanova', '1232342'),
('Alexey', 'Alexandrov', 'alexandrov@example.com', '+79942225566', 'aalexandrov', '1234234'),
('Yulia', 'Yurievna', 'yurievna@example.info', '+79953336677', 'yyurievna', '2234234'),
('Vladimir', 'Vladimirov', 'vladimirov@example.net', '+79964447788', 'vladimirv', '324234'),
('Marina', 'Mironova', 'mironova@example.org', '+79975558899', 'mmironova', '1234'),
('Denis', 'Denisov', 'denisov@example.com', '+79986669900', 'ddenisov', '567834'),
('Yury', 'Yuriev', 'yuriev@example.info', '+79997771011', 'yyuriev', '904353'),
('Nadezhda', 'Nikitina', 'nikitina@example.net', '+79908881122', 'nnikitina', '0345345435'),
('Anton', 'Antonov', 'antonov@example.org', '+79919992233', 'antonov1', '1145435'),
('Ksenia', 'Kuznetsova', 'kuznetsova@example.com', '+79921113344', 'kuznetsk', '2212213'),
('Viktor', 'Viktorov', 'viktorov@example.net', '+79932224455', 'vviktorov', '123123'),
('Lyudmila', 'Lyubimova', 'lyubimova@example.org', '+79943335566', 'lyubimova', '203203'),
('Gleb', 'Glebov', 'glebov@example.com', '+79954446677', 'glebik', '203012301'),
('Nina', 'Nikolaeva', 'nikolaevanina@example.info', '+79965557788', 'nnikolaeva', '203120301'),
('Artem', 'Artemov', 'artemov@example.net', '+79976668899', 'artemov1', '3090193021');

INSERT INTO Conference (`location`, `title`, `description`, `format`) VALUES
(
    'AI Innovations Center',
    'Neural Networks Revolution',
    'This summit is dedicated to the latest advancements in artificial intelligence. We will explore cutting-edge technologies, discuss breakthroughs in AI development, and showcase innovative applications of neural networks and machine learning.',
    'virtual and interactive'
);

SET @last_conference_id = LAST_INSERT_ID();


INSERT INTO Lecture (`title`, `description`, record_permission, author_id, conference_id) values
('Cybersecurity Essentials: Protecting Your Digital Fortress',
'Learn the fundamental strategies to safeguard your online assets against cyber threats.',
TRUE,
1,
@last_conference_id),

('Artificial Intelligence Unleashed: From Theory to Practice',
'Dive into the realm of AI applications and discover how to implement them in real-world scenarios.',
TRUE,
2,
@last_conference_id),

('Blockchain Demystified: Building Trust in a Trustless World',
'Explore the revolutionary technology behind blockchain and its impact on securing transactions.',
TRUE,
3,
@last_conference_id),

('Cloud Computing Power: Harnessing the Future of IT Infrastructure',
'Explore the scalability and flexibility of cloud computing for optimizing your IT operations.',
TRUE,
4,
@last_conference_id),

('Data Science Insights: Unraveling the Secrets of Big Data',
'Unlock the potential of data science and its role in extracting valuable insights from large datasets.',
TRUE,
5,
@last_conference_id),

('DevOps Culture: Bridging the Gap Between Development and Operations',
'Learn how to streamline software development processes and enhance collaboration within your team.',
TRUE,
6,
@last_conference_id),

('Ethical Hacking 101: The Art of Testing Security Defenses',
'Discover the ethical hacking principles and techniques to identify vulnerabilities in your systems.',
TRUE,
7,
@last_conference_id),

('IoT Revolution: Building a Connected Future',
'Explore the Internet of Things landscape and its transformative impact on industries worldwide.',
TRUE,
8,
@last_conference_id),

('Machine Learning Mastery: From Algorithms to Applications',
'Master the principles of machine learning and unleash its potential in various domains.',
TRUE,
9,
@last_conference_id),

('Quantum Computing Frontier: Navigating the Next Generation Computing',
'Delve into the world of quantum computing and its implications for solving complex computational problems.',
TRUE,
10,
@last_conference_id);