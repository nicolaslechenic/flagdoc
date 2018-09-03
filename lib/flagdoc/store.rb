module Flagdoc
  # Store parsed flags informations
  #
  # @since 0.1.0
  class Store
    attr_reader :flags

    def initialize
      @flags = []
    end

    def add(args)
      @flags << {
        type: args[:type],
        priority: args[:priority],
        file: args[:file],
        line: args[:line],
        desc: args[:desc]
      }
    end
  end
end
