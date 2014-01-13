require 'form'
require 'question'
require 'answer/bad'

def question_three_answers
    Question.new('T', [Answer::Bad.new('A'), Answer::Bad.new('B'), Answer::Bad.new('C')])
end

def three_questions_answers
    [question_three_answers, question_three_answers, question_three_answers]
end

describe Form, '#initialize' do
    it 'create a form without question' do
        q = Form.new([])
        q.size.should eq(0)
    end

    it 'create a form with 3 questions' do
        q = Form.new(three_questions_answers)
        q.size.should eq(3)
    end
end

describe Form, '#wrong_questions' do
    it 'return 0 bad answers' do
        q = Form.new(three_questions_answers)
        q.wrong_questions.size.should eq(0)
    end

    it 'return 1 bad answer' do
        q = Form.new(three_questions_answers)
        q[0][0].choice = true
        q.wrong_questions.size.should eq(1)
    end
end
