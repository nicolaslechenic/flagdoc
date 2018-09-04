RSpec.describe Flagdoc::Store do
  let(:instance) { described_class.new }

  it 'return two flags after added' do
    flags =
      [
        {
          type: 'TODO',
          priority: 'HIGH',
          file: './app/models/file.rb',
          line: 32,
          description: 'change method name'
        },
        {
          type: 'INFO',
          priority: 'LOW',
          file: './app/models/file.rb',
          line: 44,
          description: 'implemented twice'
        }
      ]

    flags.each { |flag| instance.add(flag) }

    expect(instance.flags.count).to eq(2)
  end
end
