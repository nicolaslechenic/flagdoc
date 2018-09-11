RSpec.describe Flagdoc::Parser do
  context 'with valid string' do
    {
      path: './path/to/string.rb',
      line: '101',
      type: 'TYPE',
      priority: 'HIGH',
      description: 'Hello world !'
    }.each do |method_name, expected|
      describe ".#{method_name}" do
        it "return #{expected}" do
          expect(
            described_class.new(string: Fixtures.strings.first).send(method_name)
          ).to eql(expected)
        end
      end
    end
  end

  context 'without priority' do
    {
      path: './path/to/string.rb',
      line: '101',
      type: 'TYPE',
      priority: 'NORMAL',
      description: 'Hello world !'
    }.each do |method_name, expected|
      describe "##{method_name}" do
        it "return #{expected}" do
          expect(
            described_class.new(string: Fixtures.strings[1]).send(method_name)
          ).to eql(expected)
        end
      end
    end
  end

  context 'with invalid string' do
    {
      path: './path/to/string.rb',
      line: '101',
      type: 'TYPE',
      priority: 'NORMAL',
      description: 'Hello world !'
    }.each do |method_name, expected|
      describe "##{method_name}" do
        it "return #{expected}" do
          expect(
            described_class.new(string: Fixtures.strings.last).send(method_name)
          ).to eql(expected)
        end
      end
    end
  end
end
