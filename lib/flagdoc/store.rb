module Flagdoc
  # Store parsed flags informations
  #
  # @since 0.1.0
  class Store
    attr_reader :files

    def initialize
      @files = []
    end

    # Add flag to file path if already exist
    # then add file path and flag to @files
    #
    # @since 0.1.0
    def add(args)
      return unless valide?(args)

      flag = serialize_flag(args)
      file = find_by_path(args['path'])

      if file
        file[:flags] << flag
      else
        add_file(args, flag)
      end
    end

    private

    # @since 0.1.0
    #
    # @return [Boolean] true if all args are ok
    def valide?(args)
      Priority.available?(args['priority'])
    end

    # @since 0.1.0
    #
    # @return [Hash] file with path
    def find_by_path(path)
      @files.find { |file| file[:path] == path }
    end

    # @since 0.1.0
    def add_file(args, flag)
      @files << { path: args['path'], flags: [flag] }
    end

    # @since 0.1.0
    def serialize_flag(args)
      {
        type: args['type'],
        priority: args['priority'],
        line: args['line'],
        description: args['description']
      }
    end
  end
end
