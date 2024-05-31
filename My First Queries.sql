USE lab_mysql;

SELECT *
FROM applestore2;

/* QUESTION 1: Which are the different genres? */
SELECT DISTINCT prime_genre
FROM applestore2;

/* QUESTION 2: Which is the genre with more apps rated? */
SELECT DISTINCT prime_genre, SUM(rating_count_tot)
FROM applestore2
GROUP BY prime_genre
ORDER BY SUM(rating_count_tot) DESC;
-- Games is the genre with more apps rated. Total ratings received 52630139

/* QUESTION 3: Which is the genre with more apps? */
SELECT DISTINCT prime_genre, COUNT(Prime_genre)
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(Prime_genre) DESC;
-- Games is the genre with more apps. Total number of apps 3808

/* QUESTION 4: Which is the one with less? */
SELECT DISTINCT prime_genre, COUNT(Prime_genre)
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(Prime_genre) ASC;
-- Catalogs is the genre with least number of apps. Total number of apps 10

/* QUESTION 5: Take the 10 apps most rated. */
SELECT track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;
-- These 10 apps received ratings from more users

/* QUESTION 6: Take the 10 apps best rated by users. */
SELECT track_name, user_rating
FROM applestore2
WHERE user_rating = 5
ORDER BY user_rating DESC;
-- 490 apps received 5/5 rating but some apps were rated by more users than others

SELECT track_name, rating_count_tot, user_rating
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;
-- Top 10 apps which received 5/5 rating and also they were rated by most number of users

/* QUESTION 7: Take a look on the data you retrieved in the question 5. Give some insights. */
SELECT track_name, rating_count_tot, user_rating
FROM applestore2
ORDER BY rating_count_tot DESC, user_rating DESC
LIMIT 10;
-- Top 10 apps that were rated by most number of users have received mostly a rating of 3.5

SELECT DISTINCT track_name, rating_count_tot, user_rating, `ipadSc_urls.num`,`sup_devices.num`, `lang.num`, `price`, prime_genre
FROM applestore2
ORDER BY rating_count_tot DESC, user_rating DESC
LIMIT 10;
-- Social networking, gaming and music apps are among the apps reviewed by most users
-- All of these apps are free
-- All of these apps are available in more than 37 devices 
-- Almost all of them are available in more than 10 languages
-- Almost all of them use 4 or 5 screenshots in their display

/* QUESTION 8: Take a look on the data you retrieved in the question 6. Give some insights. */
SELECT DISTINCT track_name, rating_count_tot, user_rating, `ipadSc_urls.num`,`sup_devices.num`, `lang.num`, `price`, prime_genre
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;
-- Except for one, all the 5-star rated apps are games
-- 4 of the apps require paid subscription
-- 7 of these apps are available in less than 10 languages
-- All of these apps are available in more than 37 devices
-- All of them use 5 screenshots on their display

SELECT DISTINCT prime_genre, rating_count_tot, user_rating, track_name
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;

/* QUESTION 9. Now compare the data from questions 5 and 6. What do you see? */
-- Looked at five columns: number of screen shots on display, number of supporting devices, number of languages supported, price and genre 
-- Following conclusions can be drawn:
-- Social media and music are reviewd by most people. Gaming apps get better reviews and they are also as popular as the aforementioned genres 
-- Apps that were free received more reviews. The top ten most reviewed apps are all free.
-- Apps that are available in more languages received more reviews. 
-- Almost both the top rated apps and the apps that received most reviews are supported by the same number of devices
-- Almost both the top rated apps and the apps that received most reviews have the same number of screenshots on display
-- Apps that are free to use gets more reviews

/* QUESTION 10. How could you take the top 3 regarding the user ratings but also the number of votes? */
SELECT track_name, rating_count_tot, user_rating
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/* QUESTION 11. Does people care about the price? */
-- All the top-10 most reviewed apps were found to be free
-- While 4/10 apps that were rated 5-stars and also reviewed by many users required paid subscription
-- In conclusion, people use and review free apps more than paid apps