module Flagdoc
  # Display parsed flags informations
  #
  # @since 0.1.0
  class Stream
    def initialize(store:)
      @store = store
    end

    # @since 1.0.1
    def call
      @store.files.each do |file|
        puts
        puts "\e[33;1m#{file[:path]}\e[0m"
        puts
        display_flags(file[:flags])
      end
    end

    private

    def display_flags(flags)
      flags.each do |flag|
        type     = flag[:type]
        line     = flag[:line]
        desc     = flag[:description]

        blanks_line = ' ' * (6 - line.to_s.length)
        blanks_type = ' ' * (40 - type.length)
        blanks_desc = ' ' * (53 - desc.length)

        type_content = "\e[1;97;#{Priority.color_code(flag[:priority])}m #{type}#{blanks_type} \e[0m"
        line_content = "\e[90;47m #{blanks_line}line #{line} \e[0m"
        desc_content = "\e[90;107m #{desc.capitalize}#{blanks_desc} \e[0m"
        blank_line   = "\e[90;107m #{' ' * 53} \e[0m"

        puts "  #{type_content}#{line_content}"
        puts "  #{blank_line}"
        puts "  #{desc_content}"
        puts "  #{blank_line}"
        puts
      end
    end
  end
end
