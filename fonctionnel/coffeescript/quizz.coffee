zip_with = (func, arr1, arr2) ->
    min = Math.min arr1.length, arr2.length
    ret = []
    for i in [0...min]
        ret.push func(arr1[i], arr2[i])

    ret

class Question
    constructor: (@title, @propositions) ->

    correct: (answers) ->
        zip_with @check, @propositions, answers

    check: (proposition, answer) ->
        answer.compare proposition

class Proposition
    constructor: (@title) ->

class Good extends Proposition
    checked: -> "Correct"
    empty: -> "Missed"

class Bad extends Proposition
    checked: -> "Wrong"
    empty: -> "NotCheckedNotAnswer"

class Answer

class Checked extends Answer
    compare: (proposition) -> proposition.checked()

class NotChecked extends Answer
    compare: (proposition) -> proposition.empty()

q = new Question "A", [new Good("a"), new Good("b"), new Bad("c"), new Bad("d")]
console.log q.correct [new Checked, new NotChecked, new Checked, new NotChecked]
