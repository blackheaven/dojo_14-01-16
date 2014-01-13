require "#{File.dirname(__FILE__)}/abstract"

module Answer
    class Bad < Abstract
        def correct?
            !@choice
        end
    end
end
