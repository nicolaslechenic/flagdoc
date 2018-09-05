module Flagdoc
  # Display parsed flags informations
  #
  # @since 0.1.0
  class Stream
    COLORS =
      {
        'line'        => '0;90;48;5;192',
        'description' => '0;90;48;5;194',
        'file'        => '33;1'
      }.freeze

    BOX_SIZE = 54
    LINE_SIZE = 12

    def initialize(store:)
      @store = store
    end

    # @since 1.0.1
    def call
      @store.files.each do |file|
        file_path(file[:path])
        flags(file[:flags])
      end
    end

    private

    # Generate methods:
    # - file_color
    # - line_color
    # - description_color
    #
    # @since 0.1.0
    #
    # @return [String] with bash color code
    COLORS.each do |type, code|
      define_method("#{type}_color") do
        code
      end
    end

    # @since 0.1.0
    #
    # @return [STDOUT] colored file path
    def file_path(path)
      puts
      puts "\e[#{file_color}m#{path}\e[0m"
      puts
    end

    # @since 0.1.0
    #
    # @return [STDOUT] colored flags
    def flags(flags)
      flags.each do |flag|
        type     = flag[:type]
        line     = "line #{flag[:line]}"
        desc     = flag[:description]

        blanks_line = ' ' * (LINE_SIZE - line.length)
        blanks_type = ' ' * ((BOX_SIZE - LINE_SIZE - 2) - type.length)
        blanks_desc = ' ' * (BOX_SIZE - desc.length)

        type_content = "\e[1;97;#{Priority.color_code(flag[:priority])}m #{type}#{blanks_type} \e[0m"
        line_content = "\e[#{line_color}m #{blanks_line}#{line} \e[0m"
        desc_content = "\e[#{description_color}m #{desc.capitalize}#{blanks_desc} \e[0m"
        blank_line   = "\e[#{description_color}m #{' ' * BOX_SIZE} \e[0m"

        puts "  #{type_content}#{line_content}"
        puts "  #{blank_line}"
        puts "  #{desc_content}"
        puts "  #{blank_line}"
        puts
      end
    end
  end
end
