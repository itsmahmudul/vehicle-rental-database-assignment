
# Vehicle Rental System - Database Design & SQL Queries

## Project Overview

This project is a simplified Vehicle Rental System database design assignment.  
The main goal of this project is to design database tables, define relationships using primary keys and foreign keys, and write SQL queries using JOIN, EXISTS, WHERE, GROUP BY, and HAVING.

## Database Tables

The system contains three main tables:

1. Users
2. Vehicles
3. Bookings

## Users Table

The Users table stores user information such as name, email, password, phone number, and role.  
Each user has a unique email address. A user can be either an Admin or a Customer.

## Vehicles Table

The Vehicles table stores vehicle information such as vehicle name, type, model, registration number, rental price, and availability status.  
Each vehicle has a unique registration number.

## Bookings Table

The Bookings table stores rental booking information.  
Each booking is connected to one user and one vehicle using foreign keys.

## Relationships

- One user can have many bookings.
- One vehicle can have many bookings.
- Each booking belongs to exactly one user.
- Each booking is connected to exactly one vehicle.

## ERD Relationship Summary

Users 1 → Many Bookings  
Vehicles 1 → Many Bookings

## SQL Queries Included

The `queries.sql` file includes:

1. Table creation queries
2. Sample data insertion queries
3. INNER JOIN query
4. NOT EXISTS query
5. WHERE query
6. GROUP BY and HAVING query

## Query Descriptions

### Query 1: INNER JOIN

This query retrieves booking information along with customer name and vehicle name.

### Query 2: NOT EXISTS

This query finds all vehicles that have never been booked.

### Query 3: WHERE

This query retrieves all available vehicles of a specific type, such as cars.

### Query 4: GROUP BY and HAVING

This query finds the total number of bookings for each vehicle and displays only vehicles that have more than two bookings.

## Tools Used

- PostgreSQL
- Beekeeper Studio
- Lucidchart
- GitHub
