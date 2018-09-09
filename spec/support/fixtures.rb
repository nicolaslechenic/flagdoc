module Fixtures
  class << self
    def flags
      @flags ||=
        load_fixture('flags').map do |hash|
          hash.inject({}) do |new_hash, (key, value)|
            new_hash[key.to_sym] = value
            new_hash
          end
        end
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
