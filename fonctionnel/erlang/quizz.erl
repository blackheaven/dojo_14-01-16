-module(quizz).
-export([correct/2]).

correct(Propositions, Answers) -> lists:zipwith(fun check/2, Propositions, Answers).

check({_, good}, checked) -> correct;
check({_, good}, not_checked) -> missed;
check({_, bad}, checked) -> wrong;
check({_, bad}, not_checked) -> not_checked_not_answer.
