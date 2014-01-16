(ns quizz.core
  (:gen-class))

(defn check [q, r]
  (cond
    (and (identical? q "Good") (identical? r "Checked")) "Correct"
    (and (identical? q "Good") (identical? r "Empty")) "Missed"
    (and (identical? q "Bad") (identical? r "Checked")) "Wrong"
    :else "NotCheckedNotAnswer"
    ))

(defn correct [q, r]
  (map check q r))

(defn -main
  [& args]
  (println (correct ["Good", "Good", "Bad", "Bad"] ["Empty", "Checked", "Empty", "Checked"])))
