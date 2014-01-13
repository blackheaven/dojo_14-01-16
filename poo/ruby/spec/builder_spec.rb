require 'builder'

describe Builder, '#parse' do

    def test_tree(qs)
        qs.size.should eq(2)
        qs[0].size.should eq(3)
        qs[1].size.should eq(4)
        qs[0][0].instance_of?(Answer::Good).should eq(true)
        qs[0][1].instance_of?(Answer::Bad).should eq(true)
        qs[0][2].instance_of?(Answer::Bad).should eq(true)
        qs[1][0].instance_of?(Answer::Bad).should eq(true)
        qs[1][1].instance_of?(Answer::Good).should eq(true)
        qs[1][2].instance_of?(Answer::Bad).should eq(true)
        qs[1][3].instance_of?(Answer::Good).should eq(true)
    end

    it 'create 2 questions with 3 and 4 answers from a File' do
        test_tree(Builder.new.parse(File.new(File.dirname(__FILE__) + '/../examples/ex1.yml')))
    end

    it 'create 2 questions with 3 and 4 answers from a filename' do
        test_tree(Builder.new.parse(File.dirname(__FILE__) + '/../examples/ex1.yml'))
    end
end

