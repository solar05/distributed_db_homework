(ns generator.migrations
  (:require
   [clojure.test.check.generators :as gen]
   [clojure.string :as s]
   [faker.generate :as fg]))

(def clothe-colour
  "CREATE TABLE clothe_colour (colour_id serial PRIMARY KEY, colour TEXT NOT NULL);")

(def tables [clothe-colour])
