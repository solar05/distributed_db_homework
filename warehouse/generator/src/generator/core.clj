(ns generator.core
  (:require
   [clojure.test :refer :all]
   [clojure.test.check.generators :as gen]
   [clojure.string :as s]
   [clojure.string :as str]))

(def tables ["clothe_colour"])

(def filename "queries.txt")

(def colour-map ["red" "green" "blue" "grey" "brown" "pink"
                 "black" "white" "yellow" "purple"])

(defn clothe-color []
  (str "INSERT INTO clothe_colour (colour) VALUES"
       (apply str
               (drop-last 2 (s/join "" (map #(str " ('" % "'), ") colour-map)))) ";"))
(defn -main
  [& args]
  (spit filename (clothe-color)))
