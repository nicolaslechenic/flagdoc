module Flagdoc
  # Display parsed flags informations
  #
  # @since 0.1.0
  class Stream
    COLORS =
      {
        'line'        => '90;48;5;192',
        'description' => '90;48;5;194',
        'file'        => '33;1'
      }.freeze

    BOX_SIZE = 54
    LINE_SIZE = 12

    # @since 1.0.1
    def initialize(store:)
      @store = store
    end

    # Launch the stream of stored informations
    #
    # @since 1.0.1
    #
    # @return [STDOUT] with formatted informations
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
      define_method("#{type}_color") { code }
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
        head(flag[:type], flag[:line], flag[:priority])
        blank
        content(flag[:description])
        blank
        puts
      end
    end

    def head(type, line, priority)
      line          = "line #{line}"
      space_line    = space_line(LINE_SIZE - line.length)
      space_type    = space_line((BOX_SIZE - LINE_SIZE - 2) - type.length)
      line_content  = colorize(line_color, space_line + line)
      type_content  = colorize(type_color(priority), type + space_type)

      puts "  #{type_content}#{line_content}"
    end

    def blank
      blank =
        colorize(description_color, space_line(BOX_SIZE))

      puts "  #{blank}"
    end

    def content(description)
      space_description = space_line(BOX_SIZE - description.length)

      description_content =
        colorize(
          description_color,
          description.capitalize + space_description
        )

      puts "  #{description_content}"
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
