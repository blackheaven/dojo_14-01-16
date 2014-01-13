class Question
    attr_reader :title
    def initialize(title, answers)
        @title = title
        @answers = answers || []
    end

    def size
        @answers.size
    end

    def [](i)
        @answers[i]
    end

    def []=(i, v)
        @answers[i].choice = v
    end

    def correct?
        @answers.each do |a|
            return false if !a.correct?
        end
        true
    end
end
