CREATE TABLE branch(
branch_id int NOT NULL AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
street VARCHAR(20),
postalcode VARCHAR(20),
city VARCHAR(20),
PRIMARY KEY(branch_id)
) ;

CREATE TABLE employee(
person_id int NOT NULL AUTO_INCREMENT,
FName VARCHAR(20) NOT NULL,
Minit CHAR,
LName VARCHAR(20) NOT NULL,
phone VARCHAR(15) NOT NULL,
street VARCHAR(20),
postalcode VARCHAR(20),
city VARCHAR(20),
gender CHAR(1),
email VARCHAR(30),
day VARCHAR(10),
month VARCHAR(10),
year VARCHAR(10),
com_id int NOT NULL,
salary decimal(6,1),
PRIMARY KEY(person_id)
) ;

CREATE TABLE customer(
person_id int NOT NULL AUTO_INCREMENT,
FName VARCHAR(10) NOT NULL,
Minit CHAR,
LName VARCHAR(20) NOT NULL,
phone VARCHAR(15) NOT NULL,
street VARCHAR(20),
postalcode VARCHAR(20),
city VARCHAR(20),
gender CHAR(1),
email VARCHAR(30),
day VARCHAR(10),
month VARCHAR(10),
year VARCHAR(10),
potential VARCHAR(10),
PRIMARY KEY(person_id)
) ;

CREATE TABLE supplier(
person_id int NOT NULL AUTO_INCREMENT,
FName VARCHAR(10) NOT NULL,
Minit CHAR,
LName VARCHAR(20) NOT NULL,
phone VARCHAR(15) NOT NULL,
street VARCHAR(20),
postalcode VARCHAR(20),
city VARCHAR(20),
gender CHAR(1),
email VARCHAR(30),
day VARCHAR(10),
month VARCHAR(10),
year VARCHAR(10),
title VARCHAR(10),
PRIMARY KEY(person_id)
) ;

CREATE TABLE supplies(
person_id int NOT NULL,
prod_id int NOT NULL
) ;

CREATE TABLE bill_in(
bill_id int NOT NULL AUTO_INCREMENT,
bill_date date NOT NULL,
emp_id int NOT NULL,
bill_sup_id int NOT NULL,
PRIMARY KEY(bill_id)
) ;

CREATE TABLE bill_body_in(
bill_body_in_id int NOT NULL AUTO_INCREMENT,
bill_in_id int NOT NULL,
prod_id int NOT NULL,
quantity int(30) NOT NULL,
price decimal(6,1),
discount decimal(6,1) default 0.0,
PRIMARY KEY(bill_body_in_id)
) ;

CREATE TABLE bill_out(
bill_id int NOT NULL AUTO_INCREMENT,
bill_date date NOT NULL,
emp_id int NOT NULL,
bill_cus_id int NOT NULL,
PRIMARY KEY(bill_id)
) ;

CREATE TABLE bill_body_out(
bill_body_out_id int NOT NULL AUTO_INCREMENT,
bill_out_id int NOT NULL,
prod_id int NOT NULL,
quantity int(30) NOT NULL,
price decimal(6,1),
discount decimal(6,1) default 0.0,
PRIMARY KEY(bill_body_out_id)
) ;


CREATE TABLE login(
id int NOT NULL AUTO_INCREMENT,
emp_id int NOT NULL,
username VARCHAR(20) ,
password VARCHAR(20) ,
PRIMARY KEY(id)
) ;

CREATE TABLE role(
role_id int NOT NULL AUTO_INCREMENT,
role_name VARCHAR(20) ,
role_descibtion VARCHAR(20) ,
PRIMARY KEY(role_id)
) ;

CREATE TABLE permissions(
per_role_id int NOT NULL AUTO_INCREMENT,
per_name CHAR(20) NOT NULL,
PRIMARY KEY(per_role_id)
) ;

CREATE TABLE emp_has(
emp_id int NOT NULL,
role_id int NOT NULL,
per_role_id int NOT NULL
) ;

CREATE TABLE product(
prod_id int NOT NULL AUTO_INCREMENT,
prod_name VARCHAR(20),
code VARCHAR(20) unique,
ctg_id int NOT NULL,
subctg_id int NOT NULL,
PRIMARY KEY(prod_id)
) ;

CREATE TABLE stock(
stock_id int NOT NULL AUTO_INCREMENT,
prod_id int NOT NULL,
quantity int(255) NOT NULL,
price decimal(6,1),
PRIMARY KEY(stock_id)
) ;

CREATE TABLE category(
ctg_id int NOT NULL AUTO_INCREMENT,
ctg_name VARCHAR(20),
PRIMARY KEY(ctg_id)
) ;

CREATE TABLE sub_category(
subctg_id int NOT NULL AUTO_INCREMENT,
subctg_name VARCHAR(20),
PRIMARY KEY(subctg_id)
) ;
