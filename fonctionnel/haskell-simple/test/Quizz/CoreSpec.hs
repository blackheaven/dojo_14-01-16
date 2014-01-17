module Quizz.CoreSpec (main, spec) where

import Test.Hspec
import Quizz.Core

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Question datatype" $ do
    describe "title getter" $ do
      it "A simple title" $ do
        title (Question "A" []) `shouldBe` "A"

    describe "propositions getter" $ do
      it "No proposition" $ do
        (length . propositions) (Question "A" []) `shouldBe` 0
      it "One proposition" $ do
        (length . propositions) (Question "A" [Good "A"]) `shouldBe` 1
      it "Two propositions" $ do
        (length . propositions) (Question "A" [Good "A", Good "A"]) `shouldBe` 2

  describe "Answers datatype" $ do
    describe "answers" $ do
      it "No answer" $ do
        (length . answers) (Answers []) `shouldBe` 0
      it "One answer" $ do
        (length . answers) (Answers [Checked]) `shouldBe` 1
      it "Four answers" $ do
        (length . answers) (Answers [Checked, Empty, Empty, Checked]) `shouldBe` 4

  describe "Corrections datatype" $ do
    describe "corrections" $ do
      it "No correction" $ do
        (length . corrections) (Corrections []) `shouldBe` 0
      it "One correction" $ do
        (length . corrections) (Corrections [Correct]) `shouldBe` 1
      it "Two corrections" $ do
        (length . corrections) (Corrections [Wrong, Missed]) `shouldBe` 2
    describe "correct" $ do
      it "One proposition, one good answer, correctly answered" $ do
        correct (Question "A" [Good "A"]) (Answers [Checked])`shouldBe` (Corrections [Correct])
      it "One proposition, one good answer, not answered" $ do
        correct (Question "A" [Good "A"]) (Answers [Empty])`shouldBe` (Corrections [Missed])
      it "One proposition, no good answer, badly answered" $ do
        correct (Question "A" [Bad "A"]) (Answers [Checked])`shouldBe` (Corrections [Wrong])
      it "One proposition, no good answer, correctly answered" $ do
        correct (Question "A" [Bad "A"]) (Answers [Empty])`shouldBe` (Corrections [NotCheckedNotAnswer])
      it "Four propositions, two good answers, one correctly answered, one badly answered, one forgot" $ do
        correct (Question "A" [Good "A", Good "A", Bad "A", Bad "A"]) (Answers [Checked, Empty, Checked, Empty])`shouldBe` (Corrections [Correct, Missed, Wrong, NotCheckedNotAnswer])
