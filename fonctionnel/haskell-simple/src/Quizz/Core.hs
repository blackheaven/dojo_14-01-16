module Quizz.Core (
        Proposition(Good, Bad),
        Question(Question), title, propositions,
        Answer(Checked, Empty),
        Answers(Answers), answers,
        Corrections(Corrections), corrections,
        Correction(Correct, Wrong, Missed, NotCheckedNotAnswer), correct
        )  where

data Proposition = Good String | Bad String deriving (Show)

data Question = Question    { title :: String
                            , propositions :: [Proposition]
                            } deriving (Show)

data Answer = Checked | Empty deriving (Show, Eq)
newtype Answers = Answers { answers :: [Answer] } deriving (Show)

newtype Corrections = Corrections { corrections :: [Correction] } deriving (Show, Eq)

data Correction = Correct | Wrong | Missed | NotCheckedNotAnswer deriving (Show, Eq)

correct :: Question -> Answers -> Corrections
correct (Question _ propositions) (Answers answers) =
    Corrections $ zipWith check propositions answers

check :: Proposition -> Answer -> Correction
check (Good _) Checked = Correct
check (Good _) Empty = Missed
check (Bad _) Checked = Wrong
check (Bad _) Empty = NotCheckedNotAnswer
