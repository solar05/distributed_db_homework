(ns generator.migrations
  (:require
   [clojure.test.check.generators :as gen]
   [clojure.string :as s]
   [faker.generate :as fg]
   [clojure.zip :as zip]))

(def clothe-colour
  "CREATE TABLE clothe_colour (colour_id serial PRIMARY KEY, colour varchar(20) NOT NULL);")

(def clothe-size
  "CREATE TABLE clothe_size (size_id serial PRIMARY KEY, size varchar(10) NOT NULL);")

(def clothe-handbook
  "CREATE TABLE clothe_handbook (handbook_id serial PRIMARY KEY, type varchar(15) NOT NULL, article varchar(20) NOT NULL, mark varchar(20) NOT NULL, material varchar(20), price int NOT NULL, gender varchar(1) NOT NULL);")

(def clothe-example
  "CREATE TABLE clothe_example (clothe_id serial PRIMARY KEY, FOREIGN KEY (size_id) REFERENCES clothe_size (size_id), FOREIGN KEY (colour_id) REFERENCES clothe_colour (colour_id), FOREIGN KEY (handbook_id) REFERENCES clothe_handbook (handbook_id));")

(def employee-position
  "CREATE TABLE employee_position (position_id serial PRIMARY KEY, position_name varchar(20) NOT NULL, position_salary int NOT NULL);")

(def magazine
  "CREATE TABLE magazine (magazine_id serial PRIMARY KEY, city varchar(50) NOT NULL, street varchar(50) NOT NULL, house int NOT NULL, inn int NOT NULL)")

(def clothe-in-store
  "CREATE TABLE clothe_in_store (clothe_in_store_id serial PRIMARY KEY, FOREIGN KEY (clothe_id) REFERENCES clothe_example (clothe_id), FOREIGN KEY (magazine_id) REFERENCES magazine (magazine_id), quantity int NOT NULL)")

(def employee
  "CREATE TABLE employee (employee_id serial PRIMARY KEY, FOREIGN KEY (magazine_id) REFERENCES magazine (magazine_id), FOREIGN KEY (position_id) REFERENCES employee_position (position_id), first_name varchar(50) NOT NULL, last_name varchar(50) NOT NULL, birth_date DATE, hire_date DATE, passport_number int NOT NULL, phone_number varchar(50) NOT NULL);")

(def sales-recepeit
  "CREATE TABLE sales_recepeit (sales_recepeit serial PRIMARY KEY, FOREIGN KEY (employee_id) REFERENCES employee (employee_id), FOREIGN_KEY (magazine_id) REFERENCES magazine (magazine_id), sum int NOT NULL, sold_date DATE, cashbox_num int NOT NULL);")

(def clothe-sold-list
  "")

(def clothe-order
  "")

(def clothe-order-list
  "")

;;(map vector [1 2 3] [1 2 3])

(def tables [clothe-colour
             clothe-size
             clothe-handbook
             employee-position
             magazine
             clothe-in-store
             employee
             sales-recepeit])
