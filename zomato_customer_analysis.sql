CREATE DATABASE zomato_analysis;
USE zomato_analysis;

-- Total Restaurants
SELECT COUNT(*) AS total_restaurants
FROM zomato;

-- Average Restaurant Rating

SELECT ROUND(AVG(rate),2) AS average_rating
FROM zomato;

-- Online Order Availability
-- This helps answer:
-- Are restaurants without online ordering less competitive?


SELECT online_order,
       COUNT(*) AS total_restaurants
FROM zomato
GROUP BY online_order;

-- Top Locations by Restaurant Count

SELECT location,
       COUNT(*) AS total_restaurants
FROM zomato
GROUP BY location
ORDER BY total_restaurants DESC
LIMIT 10;

-- High-Risk Restaurants


SELECT customer_loss_risk,
       COUNT(*) AS total_restaurants
FROM zomato
GROUP BY customer_loss_risk;

-- Average Votes by Restaurant Popularity

SELECT restaurant_popularity,
       ROUND(AVG(votes),2) AS avg_votes
FROM zomato
GROUP BY restaurant_popularity;

-- Top Rated Restaurant Types

SELECT rest_type,
       ROUND(AVG(rate),2) AS avg_rating
FROM zomato
GROUP BY rest_type
ORDER BY avg_rating DESC
LIMIT 10;

-- Most Expensive Restaurant Areas

SELECT location,
       ROUND(AVG(`approx_cost(for two people)`),2) AS avg_cost
FROM zomato
GROUP BY location
ORDER BY avg_cost DESC
LIMIT 10;

-- Online Order vs Ratings

SELECT online_order,
       ROUND(AVG(rate),2) AS avg_rating
FROM zomato
GROUP BY online_order;

-- Top Restaurants by Votes

SELECT name,
       SUM(votes) AS total_votes
FROM zomato
GROUP BY name
ORDER BY total_votes DESC
LIMIT 10;

-- Customer Loss Risk by Location

SELECT location,
       COUNT(*) AS high_risk_restaurants
FROM zomato
WHERE customer_loss_risk = 'High Risk'
GROUP BY location
ORDER BY high_risk_restaurants DESC
LIMIT 10;

-- Table Booking Impact
SELECT book_table,
       ROUND(AVG(votes),2) AS avg_votes,
       ROUND(AVG(rate),2) AS avg_rating
FROM zomato
GROUP BY book_table;


--  Cuisine Popularity

SELECT cuisines,
       COUNT(*) AS total_restaurants
FROM zomato
GROUP BY cuisines
ORDER BY total_restaurants DESC
LIMIT 10;

-- Revenue Proxy Analysis
-- Estimated Revenue Proxy=Approx Cost×Votes

SELECT name,
       SUM(`approx_cost(for two people)` * votes) AS estimated_revenue
FROM zomato
GROUP BY name
ORDER BY estimated_revenue DESC
LIMIT 10;