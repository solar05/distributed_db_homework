(ns generator.migrations
  (:require
   [clojure.test.check.generators :as gen]
   [clojure.string :as s]
   [faker.generate :as fg]))

(def clothe-colour
  "CREATE TABLE clothe_colour (colour_id serial PRIMARY KEY, colour varchar(20) NOT NULL);")

(def clothe-size
  "CREATE TABLE clothe_size (size_id serial PRIMARY KEY, size varchar(10) NOT NULL);")

(def clothe-handbook
  "CREATE TABLE clothe_handbook (handbook_id serial PRIMARY KEY, type varchar(15) NOT NULL, article varchar(20) NOT NULL, mark varchar(20) NOT NULL, material varchar(20), price int NOT NULL, gender varchar(1) NOT NULL);")

(def clothe-example
  "CREATE TABLE clothe_example (clothe_id serial PRIMARY KEY, FOREIGN KEY (size_id) REFERENCES clothe_size (size_id), FOREIGN KEY (colour_id) REFERENCES clothe_colour (colour_id), FOREIGN KEY (handbook_id) REFERENCES clothe_handbook (handbook_id));")

(def tables [clothe-colour
             clothe-size
             clothe-handbook])
