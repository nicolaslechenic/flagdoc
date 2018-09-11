require 'flagdoc/stream'

RSpec.describe Flagdoc::Store do
  let(:instance) { described_class.new }

  describe '#add' do
    it 'return two files after added' do
      Fixtures.flags.each { |flag| instance.add(flag) }

      expect(instance.files.count).to eq(2)
    end

    it 'add nothing with unavailable priority' do
      instance.add(
        {
          type:         'TODO',
          priority:     'OOPS',
          path:         './app/models/file.rb',
          line:         32,
          description: 'change method name'
        }
      )

      expect(instance.files.count).to eq(0)
    end
  end
end
