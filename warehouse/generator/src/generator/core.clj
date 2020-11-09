(ns generator.core
  (:require
   [clojure.test.check.generators :as gen]
   [clojure.string :as s]
   [faker.generate :as fg]
   [faker.name :as nm]
   [faker.address :as fk]))

(def tables ["clothe_colour" "clothe_size"])

(def filename "queries.txt")

(def colour-map ["'red'" "'green'" "'blue'" "'grey'" "'brown'" "'pink'"
                 "'black'" "'white'" "'yellow'" "'purple'"])

(def size-map ["'XS'" "'S'" "'M'" "'L'" "'XL'" "'XXL'" "'XXXL'" "'4XL'"])

(def position-map [["'admin'" 50000] ["'operator'" 45000]
                   ["'seller'" 40000] ["'consultant'" 35000]
                   ["'manager'" 42000]])

(defn str-util [word]
  (str "'" word "'"))

(defn gender-gen []
  (gen/generate (gen/elements ["'F'" "'M'"])))

(defn mark-gen []
  (gen/generate (gen/elements ["'Gucci'" "'Versace'" "'Burberry'" "'Louis Vuitton'"
                               "'Prada'" "'D&G'" "'Chanel'" "'Giorgio Armani'"])))

(defn price-gen []
  (gen/generate (gen/choose 500 7000)))

(defn material-gen []
  (gen/generate (gen/elements ["'cotton'" "'flax'" "'whool'"
                               "'ramie'" "'silk'" "'leather'" "'fur'"])))

(defn type-gen []
  (gen/generate (gen/elements ["'t-shirt'" "'skirt'" "'jeans'" "'socks'"
                               "'gloves'" "'hat'" "'coat'" "'shirt'" "'shorts'"])))

(defn prepare-date [number]
  (if (< number 10) (str "0" number) number))

(defn birth-date-gen []
  (str-util (s/join "-" [(gen/generate (gen/choose 1980 2000))
                         (prepare-date (gen/generate (gen/choose 1 12)))
                         (prepare-date (gen/generate (gen/choose 1 30)))])))

(defn hire-date-gen []
  (str-util (s/join "-" [(gen/generate (gen/choose 2015 2020))
                         (prepare-date (gen/generate (gen/choose 1 12)))
                         (prepare-date (gen/generate (gen/choose 1 30)))])))

(defn phone-number-gen []
  (str-util (str "+7-" (s/join "-" [(gen/generate (gen/choose 100 999))
                                   (gen/generate (gen/choose 100 999))
                                   (gen/generate (gen/choose 10 99))
                                   (gen/generate (gen/choose 10 99))]))))

(defn article-gen []
  (let [zero-part (gen/generate (gen/elements ["F" "M"]))
        first-part (gen/generate gen/char-alpha)
        second-part (gen/generate (gen/choose 1111 9999))
        third-part (gen/generate gen/char-alpha)
        four-part (gen/generate (gen/choose 1 100))
        last-part (gen/generate gen/char-alpha)]
    (str "'" zero-part first-part second-part third-part four-part last-part "'")))

(defn prepare-handbook-val []
  (let [vals [(type-gen) (article-gen) (mark-gen) (material-gen) (price-gen) (gender-gen)]]
    (str "(" (s/join ", " vals) ")")))

(defn prepare-clothe-example-val []
  (let [vals [(gen/generate (gen/choose 1 8))
              (gen/generate (gen/choose 1 8))
              (gen/generate (gen/choose 1 20))]]
    (str "(" (s/join ", " vals) ")")))

(defn prepare-magazine-example-val []
  (let [vals [(str-util (fk/city))
              (str-util (s/join "_"(fg/words {:n 5})))
              (gen/generate (gen/choose 1 20))
              (gen/generate (gen/elements [(gen/generate
                                            (gen/choose 1000000000 9999999999))
                                           (gen/generate
                                            (gen/choose 100000000000 999999999999))]))
              ]]
    (str "(" (s/join ", " vals) ")")))

(defn prepare-clothe-in-mag-val []
  (let [vals [(gen/generate (gen/choose 1 30))
              (gen/generate (gen/choose 1 5))
              (gen/generate (gen/choose 10 30))]]
    (str "(" (s/join ", " vals) ")")))

(defn prepare-employee-val []
  (let [vals [(gen/generate (gen/choose 1 5))
              (gen/generate (gen/choose 1 5))
              (str-util (nm/first-name))
              (str-util (nm/last-name))
              (birth-date-gen)
              (hire-date-gen)
              (gen/generate (gen/choose 1000000000 9999999999))
              (phone-number-gen)]]
    (str "(" (s/join ", " vals) ")")))

(defn clothe-handbook-gen []
  (str "INSERT INTO clothe_handbook (type, article, mark, material, price, gender) VALUES "
       (s/join ", " (repeatedly 20 prepare-handbook-val)) ";"))

(defn clothe-colour-gen []
  (str "INSERT INTO clothe_colour (colour) VALUES"
       (apply str
              (drop-last 2 (s/join "" (map #(str " (" % "), ") colour-map)))) ";"))

(defn clothe-color-gen []
  (str "INSERT INTO clothe_colour (colour) VALUES"
       (apply str
              (drop-last 2 (s/join "" (map #(str " (" % "), ") colour-map)))) ";"))

(defn clothe-size-gen []
  (str "INSERT INTO clothe_size (size) VALUES"
       (apply str
              (drop-last 2 (s/join "" (map #(str " (" % "), ") size-map)))) ";"))

(defn clothe-example-gen []
  (str "INSERT INTO clothe_example (size_id, colour_id, handbook_id) VALUES "
       (s/join ", " (repeatedly 30 prepare-clothe-example-val)) ";"))

(defn employee-position-gen []
  (str "INSERT INTO employee_position (position-name, position-salary) VALUES "
       (s/join ", " (map
                     (fn [elem] (str "(" (first elem) ", " (last elem) ")"))
                     position-map)) ";"))

(defn magazine-gen []
  (str "INSERT INTO magazine (city, street, house, inn) VALUES "
       (s/join ", " (repeatedly 5 prepare-magazine-example-val)) ";"))

(defn clothe-in-mag-gen []
  (str "INSERT INTO clothe_in_store (clothe_id, magazine_id, quantity) VALUES "
       (s/join ", " (repeatedly 30 prepare-clothe-in-mag-val)) ";"))

(defn employee-gen []
  (str "INSERT INTO employee (magazine_id, position_id, first_name, last_name, birth_date, hire_date, passport_number, phone_number) VALUES "
       (s/join ", " (repeatedly 20 prepare-employee-val)) ";"))

(defn -main [& args]
  (let [clothe-color (clothe-color-gen)
        clothe-size (clothe-size-gen)
        clothe-handbook (clothe-handbook-gen)
        clothe-examples (clothe-example-gen)
        employee-position (employee-position-gen)
        magazines (magazine-gen)
        clothe-in-mag (clothe-in-mag-gen)
        employee (employee-gen)]
    (spit filename (s/join "\n" [clothe-color
                                 clothe-size
                                 clothe-handbook
                                 clothe-examples
                                 employee-position
                                 magazines
                                 clothe-in-mag
                                 employee]))))
