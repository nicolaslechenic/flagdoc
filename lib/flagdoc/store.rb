module Flagdoc
  # Store parsed flags informations
  #
  # @since 0.1.0
  class Store
    attr_reader :flags

    def initialize
      @flags = []
    end

    # @since 0.1.0
    def add(args)
      return unless valide?(args)

      @flags << {
        type: args[:type],
        priority: args[:priority],
        file: args[:file],
        line: args[:line],
        description: args[:description]
      }
    end

    private

    # @since 0.1.0
    #
    # @return [Boolean] true if all args are ok
    def valide?(args)
      args[:priority] ||= 'NORMAL'

      Priority.available?(args[:priority])
    end
  end
end
