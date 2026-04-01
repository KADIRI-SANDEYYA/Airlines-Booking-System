Movie Ticket Booking System – SQL Project Document
Note: Need to be add constraints as mentions below and establish the connection between the tables

1. TABLES AND COLUMNS
        1. Movies
        •	movie_id
        •	title
        •	genre
        •	language
        •	duration
        •	release_date
        2. Theatres
        •	theatre_id
        •	name
        •	city
        •	address
        3. Screens
        •	screen_id
        •	theatre_id
        •	screen_name
        •	total_seats
        4. Shows
        •	show_id
        •	movie_id
        •	screen_id
        •	show_date
        •	show_time
        •	price
        5. Customers
        •	customer_id
        •	name
        •	email
        •	phone
        6. Bookings
        •	booking_id
        •	customer_id
        •	show_id
        •	booking_time
        •	total_amount
        7. Booking_Seats
        •	seat_id
        •	booking_id
        •	seat_number
        8. Payments
        •	payment_id
        •	booking_id
        •	amount
        •	payment_mode
        •	payment_status
        •	payment_date


Add data into each table more then 5 rows.
Constraints Primary key, foreign key, unique, not null ,check, default

Clauses – Questions
1.	Write a query to find all movies released after 2023. (WHERE)
2.	Write a query to get customers whose name starts with 'S'. (LIKE)
3.	Write a query to find shows priced between 200 and 300. (BETWEEN)
4.	Write a query to find movies of genre IN ('Action', 'Drama'). (IN)
5.	Write a query to sort all customers by name. (ORDER BY)
6.	Write a query to group shows by price and count them. (GROUP BY)
7.	Write a query to filter groups having more than 2 shows. (HAVING)
8.	Write a query to fetch only first 5 movies. (LIMIT)
Joins – Questions
1.	Write a query to display movie title and show time using a JOIN.
2.	Write a query to list all bookings with customer name.
3.	Write a query to fetch theatre name and its screens.
4.	Write a query to display bookings with payment status.
5.	Write a query to list all customers who booked a specific movie.
6.	Write a query to show all seats booked for a show.
7.	Write a query to get all shows of a theatre.
8.	Write a query to perform a LEFT JOIN between Shows and Bookings.


-- Movie Ticket Booking System - MySQL Script
-- CREATE TABLE statements with constraints, sample INSERTs (6 rows each), and require      queries.

create database Movie_Booking_System;

use Movie_Booking_System;

create table movies (
    movie_id int primary key auto_increment,
    title varchar(100) not null unique,
    genre varchar(50) not null,
    language varchar(50) not null,
    duration int check (duration > 0),
    release_date date not null
)auto_increment=1001;

insert into movies (title, genre, language, duration, release_date) values
('Interstellar', 'sci-fi', 'english', 169, '2014-11-07'),
('Baahubali: The Beginning', 'action', 'telugu', 159, '2015-07-10'),
('Premam', 'romance', 'malayalam', 156, '2015-05-29'),
('RRR', 'action', 'telugu', 187, '2022-03-25'),
('Vikram', 'action', 'tamil', 175, '2022-06-03'),
('Pathaan', 'action', 'hindi', 146, '2023-01-25'),
('Ala Vaikunthapurramuloo', 'drama', 'telugu', 163, '2020-01-12'),
('The Dark Knight', 'action', 'english', 152, '2008-07-18'),
('Master', 'action', 'tamil', 179, '2021-01-13'),
('Bangalore Days', 'drama', 'malayalam', 171, '2014-05-30');

create table theatres (
    theatre_id int primary key auto_increment,
    name varchar(100) not null unique,
    city varchar(50) not null,
    address varchar(255) not null
)auto_increment=2001;

insert into theatres (name, city, address) values
('pvr orion mall', 'bangalore', 'orion mall, rajajinagar, bangalore'),
('inox gvk one', 'hyderabad', 'gvk one mall, banjara hills, hyderabad'),
('spi escape cinemas', 'chennai', 'express avenue mall, royapettah, chennai'),
('pvr koramangala', 'bangalore', 'forum mall road, koramangala, bangalore'),
('asian radhika cinemas', 'hyderabad', 'radhika circle, ecil, hyderabad'),
('rohini silver screens', 'chennai', 'koyambedu main road, chennai'),
('pvr lulu mall', 'kochi', 'lulu mall, edappally, kochi'),
('pvr vijayawada', 'vijayawada', 'pvp mall, vijayawada, andhra pradesh'),
('cinepolis forum', 'kochi', 'forum mall, maradu, kochi'),
('pvr visakhapatnam', 'visakhapatnam', 'cmr central mall, maddilapalem, visakhapatnam');

create table screens (
    screen_id int primary key auto_increment,
    theatre_id int not null,
    screen_name varchar(50) not null,
    total_seats int not null check (total_seats > 0),
    foreign key (theatre_id) references theatres(theatre_id)
)auto_increment=101;

insert into screens (theatre_id, screen_name, total_seats) values
(2001, 'screen 1 - orion imax', 320),
(2002, 'screen 2 - koramangala deluxe', 250),
(2003, 'screen 1 - inox gold', 200),
(2004, 'screen 3 - asian ultra', 180),
(2005, 'screen 1 - escape atmos', 220),
(2006, 'screen 2 - rohini super', 300),
(2007, 'screen 1 - lulu premier', 280),
(2008, 'screen 2 - forum cine', 220),
(2009, 'screen 1 - pvp dolby', 240),
(2010, 'screen 3 - vizag max', 260);

create table shows (
    show_id int primary key auto_increment,
    movie_id int not null,
    screen_id int not null,
    show_date date not null,
    show_time time not null,
    price decimal(10,2) not null check (price >= 50),
    foreign key (movie_id) references movies(movie_id),
    foreign key (screen_id) references screens(screen_id)
);

insert into shows (movie_id, screen_id, show_date, show_time, price) values
(1001, 101, '2025-12-01', '10:00:00', 150.00),
(1002, 102, '2025-12-01', '13:00:00', 250.00),
(1003, 103, '2025-12-01', '16:00:00', 350.00),
(1004, 104, '2025-12-01', '19:00:00', 150.00),
(1005, 105, '2025-12-02', '10:30:00', 250.00),
(1006, 106, '2025-12-02', '13:30:00', 400.00),
(1007, 107, '2025-12-02', '16:30:00', 150.00),
(1008, 108, '2025-12-02', '19:30:00', 350.00),
(1009, 109, '2025-12-03', '11:00:00', 250.00),
(1010, 110, '2025-12-03', '14:00:00', 150.00);


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
)auto_increment=501;

insert into customers (name, email, phone) values
('samson kadiri', 'samson.k@example.com', '9876543210'),
('sangeetha rao', 'sangeetha.r@example.com', '9876543211'),
('rohit sharma', 'rohit.s@example.com', '9876543212'),
('ananya mehta', 'ananya.m@example.com', '9876543213'),
('vikram singh', 'vikram.s@example.com', '9876543214'),
('sneha kapoor', 'sneha.k@example.com', '9876543215'),
('arjun patil', 'arjun.p@example.com', '9876543216'),
('isha gupta', 'isha.g@example.com', '9876543217'),
('saurav das', 'saurav.d@example.com', '9876543218'),
('meera nair', 'meera.n@example.com', '9876543219');

create table bookings (
    booking_id int primary key auto_increment,
    customer_id int not null,
    show_id int not null,
    booking_time datetime default current_timestamp,
    total_amount decimal(10,2) not null check (total_amount >= 0),
    foreign key (customer_id) references customers(customer_id),
    foreign key (show_id) references shows(show_id)
)auto_increment=301;

insert into bookings (customer_id, show_id, booking_time, total_amount) values
(501, 1, '2025-11-28 10:15:00', 150.00),
(502, 2, '2025-11-28 11:30:00', 250.00),
(503, 3, '2025-11-28 12:00:00', 350.00),
(504, 4, '2025-11-28 13:15:00', 150.00),
(505, 5, '2025-11-28 14:00:00', 250.00),
(506, 6, '2025-11-28 15:30:00', 400.00),
(507, 7, '2025-11-28 16:45:00', 150.00),
(508, 8, '2025-11-28 17:00:00', 350.00),
(509, 9, '2025-11-28 18:15:00', 250.00),
(510, 10, '2025-11-28 19:30:00', 150.00);

create table booking_seats (
    seat_id int primary key auto_increment,
    booking_id int not null,
    seat_number varchar(10) not null,
    foreign key (booking_id) references bookings(booking_id)
)auto_increment=201;

insert into booking_seats (booking_id, seat_number) values
(301, 'a1'),
(302, 'b1'),
(303, 'c1'),
(304, 'd1'),
(305, 'e1'),
(306, 'f1'),
(307, 'g1'),
(308, 'h1'),
(309, 'i1'),
(310, 'j1');

create table payments (
    payment_id int primary key auto_increment,
    booking_id int not null,
    amount decimal(10,2) not null,
    payment_mode varchar(20) not null check (payment_mode in ('upi','card','cash')),
    payment_status varchar(20) default 'pending' check (payment_status in ('success','failed','pending')),
    payment_date datetime default current_timestamp,
    foreign key (booking_id) references bookings(booking_id)
)auto_increment=5001;

insert into payments (booking_id, amount, payment_mode, payment_status, payment_date) values
(301, 150.00, 'upi', 'success', '2025-11-28 10:20:00'),
(302, 250.00, 'card', 'success', '2025-11-28 11:35:00'),
(303, 350.00, 'cash', 'pending', '2025-11-28 12:05:00'),
(304, 150.00, 'upi', 'failed', '2025-11-28 13:20:00'),
(305, 250.00, 'card', 'success', '2025-11-28 14:05:00'),
(306, 400.00, 'cash', 'failed', '2025-11-28 15:35:00'),
(307, 150.00, 'upi', 'success', '2025-11-28 16:50:00'),
(308, 350.00, 'card', 'pending', '2025-11-28 17:05:00'),
(309, 250.00, 'upi', 'success', '2025-11-28 18:20:00'),
(310, 150.00, 'cash', 'pending', '2025-11-28 19:35:00');


select * from movies;
select * from theatres;
select * from screens;
select * from shows;
select * from customers;
select * from bookings;
select * from booking_seats;
select * from payments;

-- Clauses – Questions

-- 1.	Write a query to find all movies released after 2023. (WHERE)
select * from movies where release_date>'2020-12-31';

-- 2.	Write a query to get customers whose name starts with 'S'. (LIKE)
select * from customers where name like ‘s%’;

-- 3.	Write a query to find shows priced between 200 and 300. (BETWEEN)
select * from shows where price between 200 and 300;

-- 4.	Write a query to find movies of genre IN ('Action', 'Drama'). (IN)
select * from movies where genre in ('action','drama');

-- 5.	Write a query to sort all customers by name. (ORDER BY)
select * from customers order by name asc;

-- 6.	Write a query to group shows by price and count them. (GROUP BY)
select price Ticket_Price,count(*) Total_Shows from shows group by price;

-- 7.	Write a query to filter groups having more than 2 shows. (HAVING)
select price Ticket_Price,count(*) Total_Shows from shows group by price having Total_Shows>2;

-- 8.	Write a query to fetch only first 5 movies. (LIMIT)
select * from movies limit 5;


-- Joins – Questions

-- 1.	Write a query to display movie title and show time using a JOIN.
select movies.title MovieName,shows.show_time ShowTime from movies join shows on movies.movie_id=shows.movie_id;

-- 2.	Write a query to list all bookings with customer name.
select bookings.booking_id,bookings.show_id,customers.name CustomerName,bookings.booking_time,bookings.total_amount
from bookings join customers on bookings.customer_id=customers.customer_id;

-- 3.	Write a query to fetch theatre name and its screens.
select screens.screen_id,screens.theatre_id,theatres.name TheatreName,screens.screen_name,screens.total_seats 
from theatres join screens on theatres.theatre_id=screens.theatre_id;

-- 4.	Write a query to display bookings with payment status.
select bookings.booking_id,customers.name CustomerName,payments.amount,payments.payment_mode,payments.payment_status from bookings join customers on bookings.customer_id=customers.customer_id
join payments on bookings.booking_id=payments.booking_id;

-- 5.	Write a query to list all customers who booked a specific movie.
select customers.customer_id,customers.name
CustomerName,customers.email,customers.phone from bookings join customers on
customers.customer_id=bookings.customer_id join shows on bookings.show_id=shows.show_id join movies on shows.movie_id=movies.movie_id
where movies.title='Jawan';

-- 6.	Write a query to show all seats booked for a show.
select bookings.booking_id,customers.name CustomerName,booking_seats.seat_number,movies.title MovieName
from movies join shows on movies.movie_id =shows.movie_id 
join bookings on shows.show_id=bookings.show_id join customers on
bookings.customer_id=customers.customer_id join booking_seats on bookings.booking_id=booking_seats.booking_id;

-- 7.	Write a query to get all shows of a theatre.
select shows.show_id,theatres.name TheatreName,screens.screen_name,movies.title MovieName from  theatres join screens on theatres.theatre_id=screens.theatre_id join
shows on shows.screen_id=screens.screen_id join movies on
movies.movie_id=shows.movie_id;

-- 8.	Write a query to perform a LEFT JOIN between Shows and Bookings.
select * from shows left join bookings on shows.show_id=bookings.show_id;
