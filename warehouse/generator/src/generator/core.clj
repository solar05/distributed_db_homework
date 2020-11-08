(ns generator.core
  (:require
   [clojure.test.check.generators :as gen]
   [clojure.string :as s]))

(def tables ["clothe_colour" "clothe_size"])

(def filename "queries.txt")

(def colour-map ["red" "green" "blue" "grey" "brown" "pink"
                 "black" "white" "yellow" "purple"])

(def size-map ["XS" "S" "M" "L" "XL" "XXL" "XXXL" "4XL"])

(defn clothe-color-gen []
  (str "INSERT INTO clothe_colour (colour) VALUES"
       (apply str
              (drop-last 2 (s/join "" (map #(str " ('" % "'), ") colour-map)))) ";"))

(defn clothe-size-gen []
  (str "INSERT INTO clothe_size (size) VALUES"
       (apply str
              (drop-last 2 (s/join "" (map #(str " ('" % "'), ") size-map)))) ";"))

(defn -main [& args]
  (let [clothe-color (clothe-color-gen)
        clothe-size (clothe-size-gen)]
    (spit filename (s/join "\n" [clothe-color clothe-size]))))
