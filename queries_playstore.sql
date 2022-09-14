-- Comments in SQL Start with dash-dash --
-- 1. Find the app with an ID of 1880.
SELECT * FROM analytics WHERE id = 1880;
--  1880 | Web Browser for Android | PRODUCTIVITY |    4.3 |  144879 | Varies with device |     10000000 |     0 | Everyone       | {Productivity} | 2016-01-24   | 3.5.0           | Varies with device
--(1 row)

-- 2. Apps last updated on August 01, 2018
Select * FROM analytics WHERE last_updated = '2018-08-01';
--  9527 | EO Forum                                                                          | FINANCE             |      3 |        4 | Varies with device |          100 |     0 | Everyone       | {Finance}                       | 2018-08-01   | 1.0.2              | Varies with device
--(275 rows)

--3. Count apps in each category
SELECT category, COUNT(*) FROM analytics GROUP BY category;
--       category       | count 
---------------------+-------
-- BOOKS_AND_REFERENCE |   191
-- COMMUNICATION       |   342
-- BEAUTY              |    46
-- EVENTS              |    52
-- PARENTING           |    59
-- PHOTOGRAPHY         |   313
-- GAME                |  1110
-- BUSINESS            |   313
--... etc...
--(33 rows)

-- 4. Top 5 most reviewed apps and number of reviews
SELECT * FROM analytics ORDER BY reviews DESC LIMIT 5;
--  id |                 app_name                 |   category    | rating | reviews  |        size        | min_installs | price | content_rating |     genres      | last_updated |  current_version   |  android_version   
----+------------------------------------------+---------------
--  1 | Facebook                                 | SOCIAL        |    4.1 | 78158306 | Varies with device |   1000000000 |     0 | Teen           | {Social}        | 2018-08-03   | Varies with device | Varies with device
--  2 | WhatsApp Messenger                       | SOCIAL        |    4.1 | 78128208 | Varies with device |   1000000000 |     0 | Teen           | {Social}        | 2018-08-03   | Varies with device | Varies with device
--  3 | Instagram                                | COMMUNICATION |    4.4 | 69119316 | Varies with device |   1000000000 |     0 | Everyone       | {Communication} | 2018-08-03   | Varies with device | Varies with device
--  4 | Messenger – Text and Video Chat for Free | COMMUNICATION |    4.4 | 69119316 | Varies with device |   1000000000 |     0 | Everyone       | {Communication} | 2018-08-03   | Varies with device | Varies with device
--  5 | Clash of Clans                           | COMMUNICATION |    4.4 | 69109672 | Varies with device |   1000000000 |     0 | Everyone       | {Communication} | 2018-08-03   | Varies with device | Varies with device
--(5 rows)

--5. App with the most reviews and a rating greater than or equal to 4.8
SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;
--  260 | Chess Free | HEALTH_AND_FITNESS |    4.8 | 4559407 | Varies with device |    100000000 |     0 | Everyone       | {"Health & Fitness"} | 2018-08-01   | Varies with device | Varies with device
--(1 row)

--6. Average rating per category and ordered highest to lowest
SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY avg DESC;
--       category       |        avg         
---------------------+--------------------
-- EVENTS              |  4.395238104320708
-- EDUCATION           |   4.38903223006956
-- ART_AND_DESIGN      |  4.347540949211746
-- BOOKS_AND_REFERENCE | 4.3423728633061645
-- PERSONALIZATION     |    4.3283387457509
--etc ...
--(33 rows)

--7. Find the name, price, and rating of the most expensive app with a rating that's less than 3
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;
--       app_name      | price  | rating 
--------------------+--------+--------
-- Naruto & Boruto FR | 379.99 |    2.9
--(1 row)

-- 8. All records with a min install not more than 50, and have a rating. Ordered by highest rated first.
SELECT * FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;
--   id  |                    app_name                    |      category       | rating | reviews | size | min_install
--s | price | content_rating |        genres         | last_updated |  current_version   | android_version 
------+------------------------------------------------
-- 9468 | DT                                             | FAMILY              |      5 |       4 | 52M  |           5
--0 |     0 | Everyone       | {Education}           | 2018-04-03   | 1.1                | 4.1 and up
-- 9464 | DQ Akses                                       | PERSONALIZATION     |      5 |       4 | 31M  |           5
--0 |  0.99 | Everyone       | {Personalization}     | 2018-04-27   | 1.1                | 4.1 and up
-- etc ..--
--(57 rows)

--9. Name of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;
--  The Wall Street Journal: Business & Market News
-- Vikings: an Archer’s Journey
-- Shoot Em Down Free
--(3 rows)

--10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT * FROM analytics WHERE price BETWEEN 0.1 and 1 ORDER BY reviews DESC LIMIT 10;
--  id  |                  app_name                   |    category     | rating | reviews | size | min_installs | price | content_rating |            genres             | last_updated | current_version | android_version 
+-----------------+-----------------
-- 1144 | Free Slideshow Maker & Video Editor         | GAME            |    4.6 |  408292 | 29M  |     10000000 |  0.99 | Mature 17+     | {Action}                      | 2018-07-12   | 1.7.110758      | 4.1 and up
-- 2298 | Couple - Relationship App                   | GAME            |    4.3 |   85468 | 36M  |      1000000 |  0.99 | Everyone       | {Arcade}                      | 2018-06-08   | 2.4.1.485300    | 4.0.3 and up
-- 2315 | Anime X Wallpaper                           | FAMILY          |    4.6 |   84114 | 23M  |       500000 |  0.99 | Everyone 10+   | {Puzzle}                      | 2018-07-05   | 1.13.108869     | 2.3.3 and up
-- 2603 | Dance On Mobile                             | FAMILY          |    4.6 |   61264 | 43M  |      1000000 |  0.99 | Everyone       | {Puzzle}                      | 2018-06-19   | 3.7.0           | 4.1 and up
-- 2645 | Marvel Unlimited                            | PERSONALIZATION |    4.3 |   58617 | 26M  |      1000000 |  0.99 | Everyone       | {Personalization}             | 2016-12-07   | 4.3.2           | 4.4 and up
--... etc... (10 rows)

-- 11. Find the most out of date app.
SELECT * FROM analytics ORDER BY last_updated LIMIT 1;
--   id  |  app_name  | category | rating | reviews | size | min_installs | price | content_rating |     genres      | last_updated | current_version | android_version 
------+------------+----------+--------+---------+------
-- 5701 | CP Clicker | FAMILY   |    4.2 |    1415 | 209k |       100000 |     0 | Everyone       | {Entertainment} | 2010-05-21   | 3.1             | 1.5 and up
--(1 row)

--12. Find the most expensive app
SELECT * FROM analytics ORDER BY price DESC LIMIT 1;
--  id  |      app_name      | category  | rating | reviews | size | min_installs | price | content_rating |   genres    | last_updated | current_version | android_version 
------+--------------------+-----------+--------+---------+------
-- 6766 | Cardi B Piano Game | LIFESTYLE |    3.6 |     275 | 7.3M |        10000 |   400 | Everyone       | {Lifestyle} | 2018-05-03   | 1.0.1           | 4.1 and up
--(1 row)

--13. Count all the reviews
SELECT SUM(reviews) AS "Reviews SUM" FROM analytics;
--  Reviews SUM 
-------------
--  4814575866
--(1 row)

-- 14. Find all the categories that have more than 300 apps in them.
SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;
-- -----------------
-- COMMUNICATION
-- PHOTOGRAPHY
-- GAME
-- BUSINESS
-- MEDICAL
-- TOOLS
-- LIFESTYLE
-- PRODUCTIVITY
-- PERSONALIZATION
-- FINANCE
-- SPORTS
-- FAMILY
--(12 rows)

-- 15. Find the name, num reviews, min_installs and proportion of the app that has the highest number of reviews to min_installs, among apps that have been installed at least 100,000 times.
SELECT app_name, reviews, min_installs,  min_installs / reviews AS proportion FROM analytics WHERE min_installs >= 100000 ORDER BY proportion DESC LIMIT 1;
-- ------------------+---------+--------------+------------
-- Kim Bu Youtuber? |      66 |     10000000 |     151515
--(1 row)

