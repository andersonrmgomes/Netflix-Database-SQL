# Netflix Shows and Movies - SQL Database Project

## Overview
This project involves creating a normalized SQL database derived from a dataset of Netflix shows and movies. The original dataset was obtained from Kaggle: [Netflix Shows and Movies - Exploratory Analysis](https://www.kaggle.com/code/shivamb/netflix-shows-and-movies-exploratory-analysis/input).

The purpose of this project is to demonstrate data normalization and SQL database creation skills, transforming a flat CSV file into a structured and normalized SQL database.

## Database Structure
The database consists of multiple tables, each representing a specific aspect of the Netflix dataset. The tables are normalized to reduce redundancy and improve data integrity. The final table, `ALL_SHOW_INFO`, combines data from all these tables to provide a comprehensive overview of the dataset.

### Tables in the Database:
- `MOVIES`: Contains movie titles and their IDs.
- `DIRECTOR`: Stores director names and their IDs.
- `CAST`: Lists cast members and their IDs.
- `MISC`: Includes miscellaneous information like country and type.
- `TIME_INFO`: Contains time-related data such as date added and release year.
- `RATING`: Stores rating descriptions and their IDs.
- `LISTED_IN`: Lists genres/categories and their IDs.
- `MOVIE_DESCRIPTIONS`: Provides descriptions of shows and movies.
- `MOVIE_INFO`: Contains additional movie information like duration.
- `DATA_RATING`: Links shows to their ratings.
- `DATA_LISTED_IN`: Links shows to their genres/categories.
- `CASTING`: Connects shows to their directors and cast members.

The `ALL_SHOW_INFO` table is a comprehensive table that combines data from all the above tables using SQL joins. It includes fields like show ID, title, director name, cast members, country, date added, release year, rating description, duration, genre, description, and type.

## Usage Instructions
1. **ALL_TOGETHER.sql**: Run this file first to create the entire database with all the individual tables.
2. **final_TABLE.sql**: Execute this file to create the `ALL_SHOW_INFO` table, which consolidates all fields into a single table.
3. **Database_queries.sql**: This file contains queries to display the top 100 rows from the `ALL_SHOW_INFO` table. Running these queries will showcase that the database and the final table have been set up correctly.

This README is intended to provide a comprehensive guide to understanding and navigating the database created from the Netflix dataset. Each step is crucial for the proper setup and viewing of the data within the SQL environment.

The Entity-Relationship Diagram (ERD) below visually represents the structure and interconnections of the various tables within the database. This diagram illustrates how data is organized and related across different aspects of the Netflix shows and movies dataset. (Once I have time I will combine several tables into one such as a single MOVIES table which would contain show_id, title, description, duration, etc.)  
  
<img width="1728" alt="image" src="https://github.com/miniquinox/Netflix-Database-SQL/assets/63688331/d9f5a8b6-50ba-4197-b7a5-fb48fd73a552">  
  
## Potential Business Questions

This Netflix shows and movies database can address various business problems. Below are some potential business questions and the corresponding SQL queries that can provide insights:

### Content Strategy Development
- **Problem**: Determining which genres or types of content are most popular to inform future content acquisition or production.
- **Query**: Analyze the distribution of shows/movies across different genres (`LISTED_IN`) and ratings (`RATING`) to identify popular categories.

### Market Analysis
- **Problem**: Understanding the distribution of content across different countries to tailor marketing strategies.
- **Query**: Aggregate the number of shows/movies by country (`MISC.country_name`) to see which regions have the most content.

### Release Timing Optimization
- **Problem**: Identifying the best time of year to release new content.
- **Query**: Examine trends in `date_added` (from `TIME_INFO`) to see which months or seasons have historically had the most releases.

### Director and Cast Analysis
- **Problem**: Finding successful director and cast combinations for future projects.
- **Query**: Analyze the past collaborations between directors (`DIRECTOR`) and cast members (`CAST`) that led to highly-rated or popular shows/movies.

### Viewer Preferences Study
- **Problem**: Understanding viewer preferences based on historical data.
- **Query**: Correlate the genres (`LISTED_IN`) and ratings (`RATING`) of shows/movies with their release years (`TIME_INFO.release_year`) to spot trends over time.

### Content Longevity Analysis
- **Problem**: Assessing which types of content remain relevant or popular for longer periods.
- **Query**: Compare the release year (`TIME_INFO.release_year`) and the date added to the platform (`TIME_INFO.date_added`) to determine content longevity.

### Localization Strategy
- **Problem**: Tailoring content and marketing strategies for specific countries.
- **Query**: Identify the most common genres (`LISTED_IN`) and types (`MISC.type_name`) of shows/movies in specific countries (`MISC.country_name`).

### Budget Allocation for New Productions
- **Problem**: Determining which types of content warrant higher investment.
- **Query**: Assess the correlation between content genres (`LISTED_IN`) and their ratings/popularity to allocate budget effectively.

These queries leverage the rich data available in your Netflix shows and movies database to guide decision-making in content strategy, marketing, production, and more.

