-- 1. Database Tables (Schema Design)
-- ----------------------------------------------
create database airline_booking;
use airline_booking;
drop database airline_booking;

-- 2. DDL QUESTIONS (CREATE, ALTER, DROP)
-- ----------------------------------------------
-- create all tables with proper primary and foreign keys.
create table airport (
    airport_id int primary key auto_increment,
    airport_name varchar(100),
    city varchar(50),
    country varchar(50)
);
insert into airport (airport_name, city, country) values
('IGI Airport','Delhi','India'),
('RGIA','Hyderabad','India'),
('Kempegowda','Bangalore','India'),
('CSMIA','Mumbai','India'),
('Chennai Airport','Chennai','India'),
('Netaji Subhash','Kolkata','India'),
('Cochin Airport','Kochi','India'),
('Trivandrum Airport','Trivandrum','India'),
('Pune Airport','Pune','India'),
('Jaipur Airport','Jaipur','India'),
('Goa Airport','Goa','India'),
('Amritsar Airport','Amritsar','India'),
('Lucknow Airport','Lucknow','India'),
('Patna Airport','Patna','India'),
('Indore Airport','Indore','India');

create table aircraft (
    aircraft_id int primary key auto_increment,
    model varchar(50),
    total_seats int
);
insert into aircraft (model, total_seats) values
('Airbus A320',180),
('Boeing 737',160),
('ATR 72',70),
('Airbus A321',200),
('Boeing 787',250),
('Embraer E190',100),
('Bombardier Q400',78),
('Airbus A330',260),
('Boeing 777',300),
('Airbus A220',130),
('Boeing 737 MAX',180),
('ATR 42',48),
('CRJ 900',90),
('Airbus A350',325),
('Boeing 767',220);

create table flight (
    flight_id int primary key auto_increment,
    flight_number varchar(20),
    source_airport_id int,
    destination_airport_id int,
    departure_time datetime,
    arrival_time datetime,
    aircraft_id int,
    foreign key (source_airport_id) references airport(airport_id),
    foreign key (destination_airport_id) references airport(airport_id),
    foreign key (aircraft_id) references aircraft(aircraft_id)
);
insert into flight
(flight_number, source_airport_id, destination_airport_id, departure_time, arrival_time, aircraft_id)
values
('AI101',1,2,'2025-01-10 06:00','2025-01-10 08:00',1),
('AI102',2,3,'2025-01-10 09:00','2025-01-10 11:00',2),
('AI103',3,4,'2025-01-11 12:00','2025-01-11 14:30',3),
('AI104',4,5,'2025-01-11 15:00','2025-01-11 17:00',4),
('AI105',5,6,'2025-01-12 18:00','2025-01-12 20:30',5),
('AI106',6,7,'2025-01-12 07:00','2025-01-12 09:00',6),
('AI107',7,8,'2025-01-13 10:00','2025-01-13 12:00',7),
('AI108',8,9,'2025-01-13 13:00','2025-01-13 15:00',8),
('AI109',9,10,'2025-01-14 16:00','2025-01-14 18:00',9),
('AI110',10,11,'2025-01-14 19:00','2025-01-14 21:00',10),
('AI111',11,12,'2025-01-15 06:00','2025-01-15 08:30',11),
('AI112',12,13,'2025-01-15 09:30','2025-01-15 11:30',12),
('AI113',13,14,'2025-01-16 12:00','2025-01-16 14:00',13),
('AI114',14,15,'2025-01-16 15:00','2025-01-16 17:00',14),
('AI115',15,1,'2025-01-17 18:00','2025-01-17 20:30',15);

create table passenger (
    passenger_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    gender char(1),
    date_of_birth date,
    passport_number varchar(20),
    email varchar(50)
);
insert into passenger
(first_name, last_name, gender, date_of_birth, passport_number, email)
values
('Rahul','Sharma','M','1996-04-12','P1001','rahul@gmail.com'),
('Anita','Verma','F','1998-07-19','P1002','anita@gmail.com'),
('Kiran','Reddy','M','1995-02-10','P1003','kiran@gmail.com'),
('Sneha','Patel','F','1999-11-23','P1004','sneha@gmail.com'),
('Amit','Singh','M','1994-06-30','P1005','amit@gmail.com'),
('Neha','Gupta','F','2000-01-15','P1006','neha@gmail.com'),
('Vikas','Mehta','M','1997-03-05','P1007','vikas@gmail.com'),
('Pooja','Iyer','F','1996-09-09','P1008','pooja@gmail.com'),
('Arjun','Nair','M','1993-12-21','P1009','arjun@gmail.com'),
('Divya','Joshi','F','1998-05-17','P1010','divya@gmail.com'),
('Rohit','Malik','M','1995-08-25','P1011','rohit@gmail.com'),
('Kavya','Rao','F','2001-02-02','P1012','kavya@gmail.com'),
('Suresh','Yadav','M','1992-10-10','P1013','suresh@gmail.com'),
('Meena','Das','F','1997-01-01','P1014','meena@gmail.com'),
('Nikhil','Kapoor','M','1999-06-18','P1015','nikhil@gmail.com');

create table booking (
    booking_id int primary key auto_increment,
    passenger_id int,
    flight_id int,
    booking_date date,
    seat_number varchar(5),
    booking_status varchar(20),
    foreign key (passenger_id) references passenger(passenger_id),
    foreign key (flight_id) references flight(flight_id)
);
insert into booking 
(booking_id, passenger_id, flight_id, booking_date, seat_number, booking_status)
values
(1,1,5,'2025-01-01','A1','Active'),
(2,2,2,'2025-01-01','A2','Confirmed'),
(3,1,1,'2025-01-02','B1','Pending'),
(4,4,4,'2025-01-02','B2','Cancelled'),
(5,5,5,'2025-01-03','C1','Completed'),
(6,3,3,'2025-01-03','C2','Active'),
(7,4,7,'2025-01-04','D1','Confirmed'),
(8,9,9,'2025-01-04','D2','Pending'),
(9,4,4,'2025-01-05','E1','Cancelled'),
(10,3,3,'2025-01-05','E2','Active'),
(11,1,1,'2025-01-06','F1','Completed'),
(12,9,9,'2025-01-06','F2','Expired'),
(13,1,1,'2025-01-07','G1','Confirmed'),
(14,5,5,'2025-01-07','G2','Pending'),
(15,5,5,'2025-01-08','H1','Active');

create table payment (
    payment_id int primary key auto_increment,
    booking_id int,
    payment_date date,
    amount decimal(10,2),
    payment_method varchar(30),
    foreign key (booking_id) references booking(booking_id)
);
insert into payment
(booking_id, payment_date, amount, payment_method)
values
(1,'2025-01-01',4500,'Credit Card'),
(2,'2025-01-01',5200,'UPI'),
(3,'2025-01-02',4800,'Debit Card'),
(1,'2025-01-02',6000,'Net Banking'),
(5,'2025-01-03',7500,'Credit Card'),
(6,'2025-01-03',4200,'UPI'),
(9,'2025-01-04',3900,'Debit Card'),
(1,'2025-01-04',6800,'Credit Card'),
(9,'2025-01-05',7200,'Net Banking'),
(10,'2025-01-05',5100,'UPI'),
(8,'2025-01-06',4600,'Debit Card'),
(2,'2025-01-06',5500,'Credit Card'),
(10,'2025-01-07',6300,'UPI'),
(10,'2025-01-07',7100,'Net Banking'),
(5,'2025-01-08',8000,'Credit Card');

create table crew (
    crew_id int primary key auto_increment,
    crew_name varchar(100),
    role varchar(50)
);
insert into crew (crew_name, role) values
('Captain Rao','Pilot'),
('Captain Singh','Pilot'),
('Anil Kumar','Co-Pilot'),
('Ramesh','Co-Pilot'),
('Sita','Air Hostess'),
('Priya','Air Hostess'),
('John','Engineer'),
('Raj','Engineer'),
('Neel','Cabin Crew'),
('Kiran','Cabin Crew'),
('Sunita','Cabin Crew'),
('Aakash','Navigator'),
('Pankaj','Ground Staff'),
('Manoj','Ground Staff'),
('Deepa','Air Hostess');

create table flight_crew (
    flight_id int,
    crew_id int,
    primary key (flight_id, crew_id),
    foreign key (flight_id) references flight(flight_id),
    foreign key (crew_id) references crew(crew_id)
);
insert into flight_crew (flight_id, crew_id) values
(1,1),(1,5),
(2,2),(2,6),
(3,3),(3,7),
(4,4),(4,8),
(5,1),(5,9),
(6,2),(6,10),
(7,3),(7,11),
(8,4),(8,12),
(9,1),(9,13);

select * from airport;
select * from aircraft;
select * from flight;
select * from passenger;
select * from booking;
select * from crew;
select * from flight_crew;
select * from payment;

-- add a new column email to the passenger table.
alter table passenger add email varchar(50);
select * from passenger;

-- modify the data type of seat_number to varchar(10).
alter table booking modify seat_number varchar(10);
select * from booking;

-- rename table crew to flight_crew_member.
alter table crew rename to flight_crew_member;
 select * from crew;
 select * from flight_crew_member;
 
-- 3. DML QUESTIONS (INSERT, UPDATE, DELETE)
-- ----------------------------------------------
-- The above DML operations (INSERT, UPDATE, DELETE) have also been completed.

-- insert 5 records into airport and aircraft tables.
-- The above insert 5 records into airport and aircraft tables have also been completed.
select * from airport;
select * from aircraft;

-- insert flight and passenger details.
-- The above insert flight and passenger details have also been completed.
select * from flight;
select * from passenger;

-- update booking status to cancelled for a given booking_id.
update booking set booking_status='cancelled' where booking_id=4 or booking_id=7;

-- increase payment amount by 10% for all bookings.
select b.*,p.amount `Original Amount`,(p.amount*(110/100)) `Updated Amount` from booking b join payment p on b.booking_id=p.booking_id;

-- delete passengers who have never made a booking.
delete p from passenger p left join booking b on p.passenger_id=b.passenger_id where b.passenger_id is null;
set sql_safe_updates = 0;
 
-- 4. SQL CLAUSES QUESTIONS
-- ----------------------------------------------
-- display all flights departing from a specific city.
select f.* from airport a join flight f on a.airport_id=f.source_airport_id where a.city='mumbai';

-- list passengers born after 1995.
select * from passenger where date_of_birth>'1995-12-31';

-- show total number of bookings per flight using group by.
select f.flight_number `Flight Number`, count(*) `Total Bookings` from flight f 
join booking b on f.flight_id = b.flight_id group by f.flight_id;

-- display flights with more than 50 bookings using having.
select f.flight_number `Flight Number`, count(*) `Total Bookings` from flight f 
join booking b on f.flight_id = b.flight_id group by f.flight_id having `Total Bookings`>50;

-- order passengers by last name in ascending order.
select * from passenger order by last_name asc;
 
-- 5. JOINS QUESTIONS
-- ----------------------------------------------
-- display passenger name and flight number using inner join.
select p.first_name `First Name`,p.last_name `Last Name`,f.flight_number `Flight Number` from passenger p 
join booking b on p.passenger_id=b.passenger_id join flight f on b.flight_id=f.flight_id;

-- show all flights and their passengers (include flights with no bookings) using left join.
select f.flight_number `Flight Number`, p.first_name `First Name`, p.last_name `Last Name` from flight f 
left join booking b on f.flight_id=b.flight_id left join passenger p on p.passenger_id=b.passenger_id;


-- list flights with payment details using join between flight, booking, payment.
select f.flight_number `Flight Number`, p.amount `Ticket Price`, p.payment_method `Payment Methods` from flight f 
join booking b on f.flight_id=b.flight_id 
join payment p on b.booking_id=p.booking_id;


-- display crew members assigned to each flight.
select c.crew_name `Pilot Name` ,f.flight_number `Flight Number` from flight_crew_member c 
join flight_crew fc on c.crew_id=fc.crew_id 
join flight f on fc.flight_id=f.flight_id group by c.crew_name,f.flight_number;

-- show passenger details along with airport source and destination.
select p.first_name `First Name`,p.last_name `Last Name`,a1.airport_name `Source Airport Name`,
a2.airport_name `Destinantion Airport Name` from passenger p 
join booking b on p.passenger_id=b.passenger_id
join flight f on b.flight_id=f.flight_id 
join airport a1 on a1.airport_id=f.source_airport_id
join airport a2 on a2.airport_id=f.destination_airport_id;


-- 6. SUBQUERIES QUESTIONS
-- ----------------------------------------------
-- find passengers who booked the same flight more than once.
select p.first_name `First Name`,p.last_name `Last Name`,count(*) `Total Bookings` from passenger p
join booking b on p.passenger_id=b.passenger_id
join flight f on b.flight_id=f.flight_id
group by p.passenger_id,f.flight_id
having `Total Bookings`>1;

-- display flights having bookings more than the average bookings per flight.

-- find the most expensive booking.
select b.* from booking b join payment p on b.booking_id=p.booking_id where amount=(select max(amount) from payment);

-- list passengers who have never made any payment.
select p.* from passenger p left join booking b on p.passenger_id=b.passenger_id 
left join payment pay on b.booking_id=pay.booking_id where pay.payment_id is null;

-- display flight details for flights with maximum duration.
with flight_duration as (select *,sec_to_time(timestampdiff(second,departure_time,arrival_time)) `Maximum Duration` from flight)
select * from flight_duration where `maximum duration`=(select max(`maximum duration`) from flight_duration);

-- 7. VIEWS QUESTIONS
-- ----------------------------------------------
-- create a view showing passenger name, flight number, and seat number.
create view passeneger_booking_details as select p.first_name `First Name`,p.last_name `Last Name`,
f.flight_number `Flight Number`,b.seat_number `Seat Number` from passenger p
join booking b on p.passenger_id=b.passenger_id join flight f on b.flight_id=f.flight_id;
select * from passeneger_booking_details;

-- create a view for all active bookings.
create view active_bookings as select * from booking where booking_status = 'active';
select * from active_bookings;

-- create a view showing total revenue per flight.
create view total_revenue as select f.flight_number,sum(pay.amount) `total revenue` from flight f 
join booking b on f.flight_id=b.flight_id 
join payment pay on b.booking_id=pay.booking_id
group by flight_number;
select * from total_revenue;

-- update data using a view.
select * from active_bookings;
update active_bookings set booking_status = 'pending'
where booking_id = 6;

-- drop a view.
drop view active_bookings;
select * from active_bookings;
 
-- 8. stored procedures questions
-- ------------------------------------
-- create a procedure to book a flight for a passenger.
delimiter $$
create procedure ticket_bookings(in b_id int,in p_id int,in f_id int,in b_date date,in seat_no char(5),in b_status varchar(25))
begin
insert into booking(booking_id,passenger_id,flight_id,booking_date,seat_number,booking_status) values(b_id,p_id,f_id,b_date,seat_no,b_status);
end $$
delimiter ; 
select * from booking;
call ticket_bookings(16,10,7,'2025-01-08','h2','active');
call ticket_bookings(17,8,9,'2025-01-09','i1','pending');

-- create a procedure to display passenger booking history.
delimiter &&
create procedure booking_history(in pid int)
begin
select * from booking where passenger_id=pid;
end &&
delimiter ;
call booking_history(1);

-- create a procedure to cancel a booking.
delimiter &&
create procedure cancel_booking (in b_id int)
begin
update booking set booking_status = 'cancelled'
where booking_id = b_id;
end &&
delimiter ;
call cancel_booking(17);
select * from booking;

-- create a procedure to calculate total revenue for a flight.
delimiter &&
create procedure total_revenue(in flightno varchar(25))
begin 
select f.flight_number `flight number`,sum(pay.amount) `total revenue` from flight f join booking b on f.flight_id=b.flight_id 
join payment pay on b.booking_id=pay.booking_id where f.flight_number = flightno group by f.flight_number;
end &&
delimiter ;
call total_revenue('ai103');
select f.flight_number `flight number`,sum(pay.amount) `total revenue` from flight f join booking b on f.flight_id=b.flight_id 
join payment pay on b.booking_id=pay.booking_id group by f.flight_number;


-- create a procedure to insert passenger details.
delimiter &&
create procedure passenger_details(in p_id int,in fname varchar(25),in lname varchar(25), in g char(2), in dob date,in pass_no varchar(15),in gmail varchar(50))
begin
insert into passenger(passenger_id,first_name,last_name,gender,date_of_birth,passport_number,email) values(p_id,fname,lname,g,dob,pass_no,gmail);
end &&
delimiter ;
call passenger_details(16,'Kadiri','Sandeiah','m','2003-07-06','p1016','sandeiah@gmail.com');
call passenger_details(17,'Kadiri','Samson','m','2000-08-13','p1016','samson@gmail.com');
select * from passenger;

-- 9. TRIGGERS QUESTIONS
----------------------------------------------
-- create a trigger to prevent booking if seat count exceeds aircraft capacity.
delimiter $$
create trigger check_seat_capacity
before insert on booking
for each row
begin
    declare max_capacity int;
    declare total_booked int;
    -- get aircraft capacity
    select capacity into max_capacity
    from aircraft
    where aircraft_id = new.aircraft_id;
    -- get already booked seats
    select ifnull(sum(seats_booked), 0) into total_booked
    from booking
    where aircraft_id = new.aircraft_id;
    -- check capacity
    if total_booked + new.seats_booked > max_capacity then
        signal sqlstate '45000'
        set message_text = 'booking exceeds aircraft capacity';
    end if;
end$$
delimiter ;

-- create a trigger to automatically update booking status after payment.
delimiter $$
create trigger update_booking_status
after insert on payment
for each row
begin
    update booking
    set booking_status = 'confirmed'
    where booking_id = new.booking_id;
end$$
delimiter ;
insert into payment (booking_id, payment_date, amount, payment_method)
values (1, current_date(), 5000, 'UPI');
select * from payment;
select * from booking;


-- create a trigger to log deleted bookings into an audit table.
create table booking_audit (
    audit_id int auto_increment primary key,
    booking_id int not null,
    passenger_id int,
    seat_number char(2),
    deleted_at datetime not null,
    reason varchar(255)
);

delimiter $$
create trigger log_deleted_booking
after delete on booking
for each row
begin
    insert into booking_audit (
        booking_id,
        passenger_id,
        seat_number,
        deleted_at,
        reason
    )
    values (
        old.booking_id,
        old.passenger_id,
        old.seat_number,
        current_date(),
        'Deleted by admin'
    );
end$$
delimiter ;
delete from payment where booking_id = 5;
delete from booking where booking_id = 5;
delete from payment where booking_id = 3;
delete from booking where booking_id = 3;
delete from payment where booking_id = 8;
delete from booking where booking_id = 8;

select * from booking_audit;

-- create a trigger to prevent deleting flights that have bookings.
delimiter $$
create trigger prevent_flight_delete
before delete on flight
for each row
begin
    if exists (
        select 1 
        from booking
        where flight_id = old.flight_id
    ) then
        signal sqlstate '45000'
        set message_text = 'Cannot delete flight with existing bookings';
    end if;
end$$
delimiter ;

delete from flight where flight_id = 1;

-- create a trigger to update payment date automatically.
delimiter $$
create trigger set_payment_date
before insert on payment
for each row
begin
    set new.payment_date = now();
end$$
delimiter ;

select * from passenger;
insert into passenger (passenger_id, first_name, last_name, gender, date_of_birth, passport_number, email)
values (101, 'John', 'Doe', 'M', '1990-01-01', 'P12345', 'john@example.com');

insert into booking (booking_id, passenger_id, flight_id, booking_date, seat_number, booking_status)
values (20, 101, 201, NOW(), 'A1', 'pending');

insert into payment (booking_id, amount)
values (20, 4500);
select * from payment;