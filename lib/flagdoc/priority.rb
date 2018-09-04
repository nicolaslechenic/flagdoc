module Flagdoc
  # Define priorities levels
  #
  # @since 0.1.0
  class Priority
    LEVELS =
      {
        'LOW' => 42,
        'NORMAL' => 43,
        'HIGH' => 101
      }.freeze

    class << self
      # @since 0.1.0
      #
      # @return [Boolean] true if the priority is available
      def available?(priority)
        LEVELS.key?(priority)
      end

      # @since 0.1.0
      def color_code(priority)
        LEVELS[priority]
      end
    end
  end
end
