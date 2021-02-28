create database userdetails;

use userdetails;

create table userlogin(
name varchar(50),
password varchar(50),
mobile varchar(10),
email varchar(100),
primary key(name));

create table notebook(
name varchar(50),
notename varchar(100),
Primary key (notename),
foreign key (name) references userlogin(name));

create table notes(
notename varchar(100),
startdate date,
enddate date,
remainder date,
note varchar(200),
foreign key(notename) references notebook(notename));
