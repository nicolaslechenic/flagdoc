module Flagdoc
  # Define priorities levels
  #
  # @since 0.1.0
  class Priority
    LEVELS =
      {
        'LOW' => '48;5;29',
        'NORMAL' => '48;5;166',
        'HIGH' => '48;5;196'
      }.freeze

    class << self
      # @since 0.1.0
      #
      # @return [Boolean] true if the priority is available
      def available?(priority)
        LEVELS.key?(priority)
      end

      # @flag [TODO, NORMAL] other flag a little bit less important
      #
      # @since 0.1.0
      def color_code(priority)
        LEVELS[priority]
      end
    end
  end
end
