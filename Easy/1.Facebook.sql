--Creating table of the given problem


CREATE TABLE events (
    app_id INT,
    event_id TEXT,
    event_time TIMESTAMP
);

-- Inserting values in the table
-- Values are generated via chatgpt to save time

INSERT INTO events VALUES
(1, 'impression', '2019-01-01 10:00:00'),
(1, 'impression', '2019-01-01 10:01:00'),
(1, 'impression', '2019-01-01 10:02:00'),
(1, 'click',      '2019-01-01 10:03:00'),
(1, 'click',      '2019-01-01 10:04:00'),

(2, 'impression', '2019-02-01 11:00:00'),
(2, 'impression', '2019-02-01 11:01:00'),
(2, 'click',      '2019-02-01 11:02:00'),

(3, 'impression', '2019-03-01 09:00:00'),
(3, 'impression', '2019-03-01 09:01:00'),

(1, 'click',      '2018-12-31 23:59:00'),
(2, 'impression', '2020-01-01 00:00:00');


-- Question : Write a query to get the clickthrough rate per app in 2019

SELECT * FROM events;

SELECT app_id, event_id FROM events WHERE event_id ="click" GROUP BY app_id