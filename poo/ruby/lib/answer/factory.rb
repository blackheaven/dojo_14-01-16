require "#{File.dirname(__FILE__)}/good"
require "#{File.dirname(__FILE__)}/bad"

module Answer
    class Factory
        def create(title, correct)
            if correct
                Good.new(title)
            else
                Bad.new(title)
            end
        end
    end
end
