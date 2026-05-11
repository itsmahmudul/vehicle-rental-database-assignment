
-- Vehicle Rental System Database Design and SQL Queries

create database vehicle_rental_system;


--cREATE TABLE USER
create table users (
  user_id int primary key,
  name varchar(100) not null,
  email varchar(100) unique not null,
  password varchar(255) not null,
  phone varchar(20),
  role varchar(20) not null
);

--VEHICLES TABLE 
create table vehicles (
  vehicle_id int primary key,
  name varchar(100) not null,
  type varchar(100) not null,
  model int not null,
  registration_number varchar(50) unique not null,
  rental_price decimal(10,2) not null,
  status varchar(20) not null
);

--BOOKINGS TABLE
create table bookings (
  booking_id int primary key,
  user_id int not null,
  vehicle_id int not null,
  start_date date not null,
  end_date date not null,
  status varchar(20) not null,
  total_cost decimal(10,2) not null,

  foreign key (user_id) references users(user_id),
  foreign key (vehicle_id) references vehicles(vehicle_id)
);

--INSERT USER DATA
insert into users values 
(1, 'Alice', 'alice@example.com', 'pass123', '1234567890', 'Customer'),
(2, 'Bob', 'bob@example.com', 'pass123', '0987654321', 'Admin'),
(3, 'Charlie', 'charlie@example.com', 'pass123', '1122334455', 'Customer');

--INSERT VEHICLE DATA
insert into vehicles values 
(1, 'Toyota Corolla', 'car', 2022, 'ABC-123', 50, 'available'),
(2, 'Honda Civic', 'car', 2021, 'DEF-456', 60, 'rented'),
(3, 'Yamaha R15', 'bike', 2023, 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', 2020, 'JKL-012', 100, 'maintenance');

--INSERT BOOKINGS DATA
insert into bookings values
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);


--query-1: Retrieve booking information with customer name and vehicle name

select
  b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
from bookings b
inner join users u on b.user_id = u.user_id
inner join vehicles v on b.vehicle_id = v.vehicle_id


--query-2: Find all vehicles that have never been booked
select *
from vehicles v 
where not exists (
  select 1
  from bookings b 
  where b.vehicle_id = v.vehicle_id
);


--query-3 : Retrieve all available cars
select * 
from vehicles 
where status = 'available'
and type = 'car'


--query-4 : Find vehicles with more than 2 bookings
select
    v.name as vehicle_name,
    count(b.booking_id) as total_bookings
from vehicles v
inner join bookings b on v.vehicle_id = b.vehicle_id
group by v.name
having count(b.booking_id) > 2;
