require "#{File.dirname(__FILE__)}/form"
require "#{File.dirname(__FILE__)}/question"
require "#{File.dirname(__FILE__)}/answer/factory"

class Builder

    def initialize(factory = nil)
        @factory = factory || Answer::Factory.new
    end

    def parse(file_name)
        questions = []
        File.open file_name do |infile|
            title = ''
            answers = []
            while (line = infile.gets)
                if line.match /^\s+/
                    answers << parse_answer(line)
                else
                    title = line.strip
                    answers = []
                    questions << Question.new(title, answers)
                end
            end
        end
        Form.new(questions)
    end

    private
    def parse_answer(line)
        is_correct = !line.match(/^\s+\+/).nil?
        normalized_answer = line.strip
        normalized_answer[0] = '' if is_correct
        @factory.create(normalized_answer, is_correct)
    end
end
