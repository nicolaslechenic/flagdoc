module Flagdoc
  # Define priorities levels
  #
  # @since 0.1.0
  class Priority
    LEVELS = %w[LOW NORMAL HIGH HOT].freeze

    class << self
      # @since 0.1.0
      #
      # @return [Boolean] true if the priority is available
      def available?(priority)
        LEVELS.include?(priority)
      end
    end
  end
end
