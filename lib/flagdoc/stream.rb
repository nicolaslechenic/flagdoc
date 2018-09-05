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

    def type_color(priority)
      "1;97;#{Priority.color_code(priority)}"
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
        desc     = flag[:description]
        line     = "line #{flag[:line]}"

        space_line  = space_line(LINE_SIZE - line.length)
        space_type  = space_line((BOX_SIZE - LINE_SIZE - 2) - type.length)
        space_desc  = space_line(BOX_SIZE - desc.length)
        full_spaces = space_line(BOX_SIZE)

        blank_line   = colorize(description_color, full_spaces)
        line_content = colorize(line_color, space_line + line)
        type_content = colorize(type_color(flag[:priority]), type + space_type)
        desc_content = colorize(description_color, desc.capitalize + space_desc)

        puts "  #{type_content}#{line_content}"
        puts "  #{blank_line}"
        puts "  #{desc_content}"
        puts "  #{blank_line}"
        puts
      end
    end

    def space_line(number)
      ' ' * number
    end

    def colorize(color, content)
      format(
        "\e[%<color>sm %<content>s \e[0m",
        color: color,
        content: content
      )
    end
  end
end
