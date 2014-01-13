require 'answer/abstract'

describe Answer::Abstract, '#initialize' do
    it 'create an abstract answer' do
        a = Answer::Abstract.new('T')
        a.title.should eq('T')
        a.choice.should eq(false)
    end
end

describe Answer::Abstract, '#correct?' do
    it 'throw an exception' do
        a = Answer::Abstract.new('T')
        expect { a.correct? }.to raise_error(RuntimeError, "Virtual function 'Answer::Abstract' called")
    end
end
