module Answer
    class Abstract
        attr_reader :title
        attr_accessor :choice
        def initialize(title)
            @title = title
            @choice = false
        end

        def correct?
            raise RuntimeError, "Virtual function '#{self.class.name}' called"
        end
    end
end
