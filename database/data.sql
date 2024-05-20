USE anime_db;

CREATE TABLE quote (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(255)
);

INSERT INTO quote (Content) VALUES
('The world is cruel but also very beautiful — Attack on Titan'),
('Revenge is just the path you take to escape your suffering — Bleach'),
('Simplicity is the easiest path to true beauty - Seishuu Handa Barakamon'),
('A dropout will beat a genius through hard work - Rock Lee'),
('Knowing what it feels to be in pain, is exactly why we try to be kind to others - Jiraiya'),
('Hurt me with the truth. But never comfort me with a lie - Erza Scarlet'),
('Power comes in response to a need, not a desire. You have to create that need - Goku'),
('Being lonely is more painful than getting hurt - Monkey D. Luffy'),
('I refuse to let my fear control me anymore - Maka Albarn'),
('Life is not a game of luck. If you wanna win, work hard- Sora');
