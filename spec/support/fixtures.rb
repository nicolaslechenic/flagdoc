module Fixtures
  class << self
    def flags
      @flags ||= load_fixture('flags')
    end

    def strings
      @strings ||= load_fixture('strings')
    end

    private

    def load_fixture(file)
      path = './spec/fixtures/%s.yml' % file
      YAML.load_file(path)
    end
  end
end
