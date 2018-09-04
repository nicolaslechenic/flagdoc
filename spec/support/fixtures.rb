module Fixtures
  def self.flags
    @flags ||= YAML.load_file('./spec/fixtures/flags.yml')
  end
end
