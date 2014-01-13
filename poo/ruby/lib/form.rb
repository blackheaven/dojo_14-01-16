class Form
    def initialize(questions)
        @questions = questions || []
    end

    def size
        @questions.size
    end

    def [](i)
        @questions[i]
    end

    def wrong_questions
        @questions.select do |q|
            !q.correct?
        end
    end
end
