# Flagdoc is a gem used to display custom flags with
# priority manager in your terminal.
# After installation you just need to enter flagdoc in
# your terminal to display the available flags into the
# current folder.
# The syntax used is inspired by yardoc:
#
# @flag [MESSAGE, LOW] Hello world !
module Flagdoc
  # Define priorities levels
  #
  # @since 0.1.0
  class Priority
    LEVELS =
      {
        'LOW'     => '29',
        'NORMAL'  => '166',
        'HIGH'    => '196'
      }.freeze

    class << self
      # @since 0.1.0
      #
      # @return [Boolean] true if the priority is available
      def available?(priority)
        LEVELS.key?(priority)
      end

      # @since 0.1.0
      #
      # @return [String] with bash color code
      def color_code(priority)
        '48;5;' + LEVELS[priority]
      end
    end
  end
end
