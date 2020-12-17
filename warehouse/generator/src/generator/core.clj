(ns generator.core
  (:require
   [clojure.test.check.generators :as gen]
   [clojure.string :as s]
   [faker.generate :as fg]
   [faker.name :as nm]
   [faker.address :as fk]
   [generator.migrations :as mig]))

(def filename "queries.txt")

(def data-filename "data.txt")

(def colour-map ["red" "green" "blue" "grey" "brown" "pink"
                 "black" "white" "yellow" "purple"])

(def size-map ["XS" "S" "M" "L" "XL" "XXL" "XXXL" "4XL"])

(def tables-fileds
  {:clothe_handbook ["type" "article" "mark" "material" "price" "gender"]
   :clothe_example ["size_id" "colour_id" "handbook_id"]
   :magazine ["city" "street" "house" "inn"]
   :clothe_in_store ["clothe_id" "magazine_id" "quantity"]
   :employee ["magazine_id" "position_id" "first_name" "last_name" "birth_date" "hire_date" "passport_number" "phone_number" "password"]
   :sales_recepeit ["employee_id" "magazine_id" "clothe_in_store_id" "sum" "sold_date" "quantity" "cashbox_num"]
   :clothe_order ["employee_id" "magazine_id" "clothe_id" "order_date" "state" "quantity"]
   :clothe_in_stock ["clothe_id" "quantity" "place"]
   :clothe_supplied ["clothe_in_stock_id" "clothe_order_id" "arrive_date" "quantity"]})


(def position-map [["admin" 50000] ["operator" 45000]
                   ["seller" 40000] ["consultant" 35000]
                   ["manager" 42000]])

(defn str-util [word]
  (str "'" word "'"))

(defn gender-gen []
  (str-util (gen/generate (gen/elements ["F" "M"]))))

(defn mark-gen []
  (str-util (gen/generate (gen/elements ["Gucci" "Versace" "Burberry" "Louis Vuitton"
                                         "Prada" "D&G" "Chanel" "Giorgio Armani"]))))

(defn price-gen []
  (gen/generate (gen/choose 500 7000)))

(defn material-gen []
  (str-util (gen/generate (gen/elements ["cotton" "flax" "whool"
                                         "ramie" "silk" "leather" "fur"]))))

(defn type-gen []
  (str-util (gen/generate (gen/elements ["t-shirt" "skirt" "jeans" "socks"
                                         "gloves" "hat" "coat" "shirt" "shorts"]))))

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

(defn sold-date-gen []
  (str-util (s/join "-" [(gen/generate (gen/choose 2019 2020))
                         (prepare-date (gen/generate (gen/choose 1 12)))
                         (prepare-date (gen/generate (gen/choose 1 30)))])))

(defn arrive-date-gen []
  (str-util (s/join "-" [(gen/generate (gen/choose 2019 2020))
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
    (str-util (str zero-part first-part second-part third-part four-part last-part))))

(defn handbook-val []
  (let [vals [(type-gen) (article-gen) (mark-gen) (material-gen) (price-gen) (gender-gen)]]
    (str "(" (s/join ", " vals) ")")))

(defn clothe-example-val []
  (let [vals [(gen/generate (gen/choose 1 8))
              (gen/generate (gen/choose 1 8))
              (gen/generate (gen/choose 1 20))]]
    (str "(" (s/join ", " vals) ")")))

(defn magazine-example-val []
  (let [vals [(str-util (fk/city))
              (str-util (s/join "_" (fg/words {:n 5})))
              (gen/generate (gen/choose 1 20))
              (gen/generate (gen/elements [(gen/generate
                                            (gen/choose 10000 99999))
                                           (gen/generate
                                            (gen/choose 10000 99999))]))]]
    (str "(" (s/join ", " vals) ")")))

(defn clothe-in-mag-val []
  (let [vals [(gen/generate (gen/choose 1 30))
              (gen/generate (gen/choose 1 5))
              (gen/generate (gen/choose 10 30))]]
    (str "(" (s/join ", " vals) ")")))

(defn employee-val []
  (let [vals [(gen/generate (gen/choose 1 5))
              (gen/generate (gen/choose 1 5))
              (str-util (nm/first-name))
              (str-util (nm/last-name))
              (birth-date-gen)
              (hire-date-gen)
              (str-util (gen/generate (gen/choose 1000000000 9999999999)))
              (phone-number-gen)
              123]]
    (str "(" (s/join ", " vals) ")")))

(defn recepeit-val []
  (let [vals [(gen/generate (gen/choose 1 20))
              (gen/generate (gen/choose 1 5))
              (gen/generate (gen/choose 1 30))
              (gen/generate (gen/choose 500 15000))
              (sold-date-gen)
              (gen/generate (gen/choose 1 5))
              (gen/generate (gen/choose 10 99))]]
    (str "(" (s/join ", " vals) ")")))

(defn clothe-sold-val []
  (let [vals [(gen/generate (gen/choose 1 50))
              (gen/generate (gen/choose 1 30))
              (gen/generate (gen/choose 1 3))]]
    (str "(" (s/join ", " vals) ")")))

(defn clothe-order-val []
  (let [vals [(gen/generate (gen/choose 1 20))
              (gen/generate (gen/choose 1 5))
              (gen/generate (gen/choose 1 30))
              (arrive-date-gen)
              (str-util (gen/generate (gen/elements ["created" "ordered" "delivered"])))
              (gen/generate (gen/choose 15 25))]]
    (str "(" (s/join ", " vals) ")")))

(defn clothe-in-stock-val []
  (let [vals [(gen/generate (gen/choose 1 30))
              (gen/generate (gen/choose 1 30))
              (gen/generate (gen/choose 1 15))]]
    (str "(" (s/join ", " vals) ")")))

(defn clothe-supplied-val []
  (let [vals [(gen/generate (gen/choose 1 20))
              (gen/generate (gen/choose 1 15))
              (arrive-date-gen)
              (gen/generate (gen/choose 1 15))]]
    (str "(" (s/join ", " vals) ")")))

(defn simple-gen [table row data]
  (str "INSERT INTO " table
       " (" row ") VALUES"
       (apply str
              (drop-last 2 (s/join "" (map
                                       #(str " (" % "), ")
                                       (map str-util data))))) ";"))

(defn complex-gen [table rows samples-count data-fn]
  (str "INSERT INTO " table
       " (" (s/join ", " rows) ") VALUES "
       (s/join ", " (repeatedly samples-count data-fn)) ";"))

(defn employee-position-gen []
  (str "INSERT INTO employee_position (position_name, position_salary) VALUES "
       (s/join ", " (map
                     (fn [elem] (str "(" (str-util (first elem)) ", " (last elem) ")"))
                     position-map)) ";"))

(def generated-data
  [(simple-gen "clothe_colour" "colour" colour-map)
   (simple-gen "clothe_size" "size" size-map)
   (complex-gen "clothe_handbook" (:clothe_handbook tables-fileds) 20 handbook-val)
   (employee-position-gen)
   (complex-gen "clothe_example" (:clothe_example tables-fileds) 30 clothe-example-val)
   (complex-gen "magazine" (:magazine tables-fileds) 5 magazine-example-val)
   (complex-gen "clothe_in_store" (:clothe_in_store tables-fileds) 30 clothe-in-mag-val)
   (complex-gen "employee" (:employee tables-fileds) 20 employee-val)
   (complex-gen "sales_recepeit" (:sales_recepeit tables-fileds) 30 recepeit-val)
   (complex-gen "clothe_order" (:clothe_order tables-fileds) 15 clothe-order-val)
   (complex-gen "clothe_in_stock" (:clothe_in_stock tables-fileds) 20 clothe-in-stock-val)
   (complex-gen "clothe_supplied" (:clothe_supplied tables-fileds) 50 clothe-supplied-val)])

(def prepared-migrations-for-write
  (let [concated (vec (map vector mig/tables generated-data))
        stringified (map (fn [[migration data]] (s/join "\n" [migration data])) concated)]
    (s/join "\n\n" stringified)))

(def prepared-data-for-write
  (s/join "\n" generated-data))

(defn -main [& args]
  (do
    (spit filename prepared-migrations-for-write)
    (spit data-filename prepared-data-for-write)))
