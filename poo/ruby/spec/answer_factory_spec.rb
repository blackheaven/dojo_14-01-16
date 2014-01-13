require 'answer/factory'

describe Answer::Factory, '#create' do
    it 'create a good answer' do
        a = Answer::Factory.new.create('T', true)
        a.title.should eq('T')
        a.choice.should eq(false)
        a.instance_of?(Answer::Good).should eq(true)
    end

    it 'create a bad answer' do
        a = Answer::Factory.new.create('T', false)
        a.title.should eq('T')
        a.choice.should eq(false)
        a.instance_of?(Answer::Bad).should eq(true)
    end
end

