(ns generator.core
  (:require
   [clojure.test.check.generators :as gen]
   [clojure.string :as s]))

(def tables ["clothe_colour" "clothe_size"])

(def filename "queries.txt")

(def colour-map ["red" "green" "blue" "grey" "brown" "pink"
                 "black" "white" "yellow" "purple"])

(def size-map ["XS" "S" "M" "L" "XL" "XXL" "XXXL" "4XL"])

(def position-map [["admin" 50000] ["operator" 45000]
                   ["seller" 40000] ["consultant" 35000]
                   ["manager" 42000]])

(defn gender-gen []
  (gen/generate (gen/elements ["F" "M"])))

(defn mark-gen []
  (gen/generate (gen/elements ["Gucci" "Versace" "Burberry" "Louis Vuitton"
                               "Prada" "D&G" "Chanel" "Giorgio Armani"])))

(defn price-gen []
  (gen/generate (gen/choose 500 7000)))

(defn material-gen []
  (gen/generate (gen/elements ["cotton" "flax" "whool" "ramie" "silk" "leather" "fur"])))

(defn type-gen []
  (gen/generate (gen/elements ["t-shirt" "skirt" "jeans" "socks"
                               "gloves" "hat" "coat" "shirt" "shorts"])))

(defn article-gen []
  (let [zero-part (gender-gen)
        first-part (gen/generate gen/char-alpha)
        second-part (gen/generate (gen/choose 1111 9999))
        third-part (gen/generate gen/char-alpha)
        four-part (gen/generate (gen/choose 1 100))
        last-part (gen/generate gen/char-alpha)]
    (str zero-part first-part second-part third-part four-part last-part)))

(defn prepare-handbook-val []
  (let [vals [(type-gen) (article-gen) (mark-gen) (material-gen) (price-gen) (gender-gen)]]
    (str "(" (s/join ", " vals) ")")))

(defn prepare-clothe-example-val []
  (let [vals [(gen/generate (gen/choose 1 8))
              (gen/generate (gen/choose 1 8))
              (gen/generate (gen/choose 1 20))]]
    (str "(" (s/join ", " vals) ")")))

(defn clothe-handbook-gen []
  (str "INSERT INTO clothe_handbook (type, article, mark, material, price, gender) VALUES "
       (s/join ", " (repeatedly 20 prepare-handbook-val)) ";"))

(defn clothe-color-gen []
  (str "INSERT INTO clothe_colour (colour) VALUES"
       (apply str
              (drop-last 2 (s/join "" (map #(str " ('" % "'), ") colour-map)))) ";"))

(defn clothe-color-gen []
  (str "INSERT INTO clothe_colour (colour) VALUES"
       (apply str
              (drop-last 2 (s/join "" (map #(str " ('" % "'), ") colour-map)))) ";"))

(defn clothe-size-gen []
  (str "INSERT INTO clothe_size (size) VALUES"
       (apply str
              (drop-last 2 (s/join "" (map #(str " ('" % "'), ") size-map)))) ";"))

(defn clothe-example-gen []
  (str "INSERT INTO clothe_example (size_id, colour_id, handbook_id) VALUES "
       (s/join ", " (repeatedly 30 prepare-clothe-example-val)) ";"))

(defn employee-position-gen []
  (str "INSERT INTO employee-position (position-name, position-salary) VALUES "
       (s/join ", " (map
                     (fn [elem] (str "('" (first elem) "', " (last elem) ")"))
                     position-map)) ";"))

(defn -main [& args]
  (let [clothe-color (clothe-color-gen)
        clothe-size (clothe-size-gen)
        clothe-handbook (clothe-handbook-gen)
        clothe-examples (clothe-example-gen)
        employee-position (employee-position-gen)]
    (spit filename (s/join "\n" [clothe-color
                                 clothe-size
                                 clothe-handbook
                                 clothe-examples
                                 employee-position]))))
