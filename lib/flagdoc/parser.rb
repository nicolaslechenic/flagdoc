module Flagdoc
  # @since 0.1.0
  class Parser
    SPLIT_ORDER =
      {
        'path' => 0,
        'line' => 1
      }.freeze

    def initialize(string:)
      @string = string
    end

    # Generate methods:
    # - path
    # - line
    #
    # @since 0.1.0
    #
    # @return [String] with the information that depends
    # on the name of the method
    SPLIT_ORDER.each do |type, order|
      define_method(type.to_s) { splitted[order] }
    end

    # @since 0.1.0
    def type
      type_and_priority.first.strip
    end

    # @since 0.1.0
    def priority
      return 'NORMAL' unless type_and_priority.count > 1
      priority = type_and_priority.last.strip

      Priority.available?(priority) ? priority : 'NORMAL'
    end

    # @since 0.1.0
    def description
      splitted[2].split(']').last.strip
    end

    private

    def splitted
      @splitted ||= @string.split(':')
    end

    def type_and_priority
      @type_and_priority ||=
        splitted[2][/\[(.*)\]/m, 1].strip.split(',')
    end
  end
end
