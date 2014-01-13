require 'question'
require 'answer/bad'

def three_bad_answers
    [Answer::Bad.new('A'), Answer::Bad.new('B'), Answer::Bad.new('C')]
end

describe Question, '#initialize' do
    it 'create a question without answer' do
        q = Question.new('T', [])
        q.title.should eq('T')
        q.size.should eq(0)
    end

    it 'create a question with 3 answers' do
        q = Question.new('T', three_bad_answers)
        q.title.should eq('T')
        q.size.should eq(3)
    end
end

describe Question, '#correct?' do
    it 'return true if all answers are correct' do
        q = Question.new('T', three_bad_answers)
        q.correct?.should eq(true)
    end

    it 'return false if at least one answer is not correct' do
        q = Question.new('T', three_bad_answers)
        q[0].choice = true
        q.correct?.should eq(false)
    end
end
