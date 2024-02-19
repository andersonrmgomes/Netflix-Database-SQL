-- 1. Trend Analysis of Genres Over Time
SELECT 
    TIME_INFO.release_year,
    LISTED_IN.listed_name,
    COUNT(DISTINCT DATA_LISTED_IN.show_id) AS total_shows,
    RANK() OVER (PARTITION BY TIME_INFO.release_year ORDER BY COUNT(DISTINCT DATA_LISTED_IN.show_id) DESC) AS genre_rank
FROM DATA_LISTED_IN
JOIN LISTED_IN ON DATA_LISTED_IN.listed_id = LISTED_IN.listed_id
JOIN TIME_INFO ON DATA_LISTED_IN.show_id = TIME_INFO.show_id
GROUP BY TIME_INFO.release_year, LISTED_IN.listed_name
ORDER BY TIME_INFO.release_year, genre_rank;

-- 2. Rating Trends and Popularity Analysis by Genre Over Years
SELECT 
    TIME_INFO.release_year,
    LISTED_IN.listed_name AS genre,
    AVG(DATA_RATING.rating_id) AS average_rating,
    COUNT(DISTINCT DATA_RATING.show_id) AS total_shows
FROM
    DATA_RATING
        JOIN
    TIME_INFO ON DATA_RATING.show_id = TIME_INFO.show_id
        JOIN
    DATA_LISTED_IN ON DATA_RATING.show_id = DATA_LISTED_IN.show_id
        JOIN
    LISTED_IN ON DATA_LISTED_IN.listed_id = LISTED_IN.listed_id
GROUP BY TIME_INFO.release_year , LISTED_IN.listed_name
ORDER BY TIME_INFO.release_year DESC , average_rating DESC;

-- 3. Comparative Analysis of Show Duration by Genre
SELECT 
    LISTED_IN.listed_name AS genre,
    AVG(CAST(SUBSTRING(MOVIE_INFO.duration, 1, LENGTH(MOVIE_INFO.duration) - 4) AS SIGNED)) AS average_duration
FROM MOVIE_INFO
JOIN DATA_LISTED_IN ON MOVIE_INFO.show_id = DATA_LISTED_IN.show_id
JOIN LISTED_IN ON DATA_LISTED_IN.listed_id = LISTED_IN.listed_id
GROUP BY LISTED_IN.listed_name
ORDER BY average_duration DESC;

-- 4. Advanced Content Strategy Development
SELECT 
    LISTED_IN.listed_name, 
    TIME_INFO.release_year, 
    COUNT(DISTINCT TIME_INFO.show_id) AS total_shows, 
    AVG(DATA_RATING.rating_id) AS average_rating
FROM DATA_LISTED_IN
JOIN LISTED_IN ON DATA_LISTED_IN.listed_id = LISTED_IN.listed_id
JOIN TIME_INFO ON DATA_LISTED_IN.show_id = TIME_INFO.show_id
JOIN DATA_RATING ON DATA_LISTED_IN.show_id = DATA_RATING.show_id
GROUP BY LISTED_IN.listed_name, TIME_INFO.release_year
ORDER BY TIME_INFO.release_year DESC, total_shows DESC, average_rating DESC;

-- 5. Detailed Market Analysis
SELECT country_name, type_name, COUNT(DISTINCT show_id) AS total_shows
FROM MISC
GROUP BY country_name, type_name
ORDER BY total_shows DESC, country_name;

-- 6. Release Timing Optimization with Genre Focus
SELECT MONTH(TIME_INFO.date_added) AS release_month, LISTED_IN.listed_name, COUNT(DISTINCT DATA_LISTED_IN.show_id) AS total_releases
FROM TIME_INFO
JOIN DATA_LISTED_IN ON TIME_INFO.show_id = DATA_LISTED_IN.show_id
JOIN LISTED_IN ON DATA_LISTED_IN.listed_id = LISTED_IN.listed_id
GROUP BY release_month, LISTED_IN.listed_name
ORDER BY total_releases DESC, release_month;

-- 7. Content Longevity and Popularity Analysis
SELECT release_year, YEAR(TIME_INFO.date_added) AS year_added, COUNT(DISTINCT TIME_INFO.show_id) AS total_shows, AVG(DATA_RATING.rating_id) AS average_rating
FROM TIME_INFO
JOIN DATA_RATING ON TIME_INFO.show_id = DATA_RATING.show_id
GROUP BY release_year, year_added
ORDER BY release_year, year_added;

-- 8. In-Depth Localization Strategy
SELECT country_name, LISTED_IN.listed_name, COUNT(DISTINCT DATA_LISTED_IN.show_id) AS total_shows, AVG(DATA_RATING.rating_id) AS average_rating
FROM MISC
JOIN DATA_LISTED_IN ON MISC.show_id = DATA_LISTED_IN.show_id
JOIN LISTED_IN ON DATA_LISTED_IN.listed_id = LISTED_IN.listed_id
JOIN DATA_RATING ON MISC.show_id = DATA_RATING.show_id
GROUP BY country_name, LISTED_IN.listed_name
ORDER BY country_name, total_shows DESC, average_rating DESC;

-- 9. Budget Allocation for Content Types
SELECT 
    LISTED_IN.listed_name AS genre, 
    AVG(DATA_RATING.rating_id) AS average_rating, 
    COUNT(DISTINCT DATA_LISTED_IN.show_id) AS total_shows,
    AVG(CAST(SUBSTRING(MOVIE_INFO.duration, 1, LENGTH(MOVIE_INFO.duration) - 4) AS UNSIGNED)) AS average_duration
FROM DATA_LISTED_IN
JOIN LISTED_IN ON DATA_LISTED_IN.listed_id = LISTED_IN.listed_id
JOIN DATA_RATING ON DATA_LISTED_IN.show_id = DATA_RATING.show_id
JOIN MOVIE_INFO ON DATA_LISTED_IN.show_id = MOVIE_INFO.show_id
GROUP BY LISTED_IN.listed_name
ORDER BY average_rating DESC, total_shows DESC, average_duration DESC;
