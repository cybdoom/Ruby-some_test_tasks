require_relative File.join('..', 'list')

RSpec.describe List do
  describe 'initilization' do
    let(:values) { [1, nil, 'second', :last, nil] }

    it 'throws ArgumentError exception if no args were given' do
      expect { List.new }.to raise_error ArgumentError
    end

    it 'correctly initializes new list with an array' do
      new_list = List.new values

      expect(values_are_equal?(new_list, values)).to be
    end

    it 'correctly initializes new list with more than one argument' do
      new_list = List.new *values

      expect(values_are_equal?(new_list, values)).to be
    end

    it 'prints values' do
      expect { List.new(values).print_values }.to output(
       "1 -> nil -> \"second\" -> :last -> nil\n"
      ).to_stdout
    end

    it 'prints values of the reversed list' do
      expect { List.new(values).reversed_print }.to output(
       "nil -> :last -> \"second\" -> nil -> 1\n"
      ).to_stdout
    end

    def values_are_equal?(list, values)
      current_node = list.head
      expect(current_node).to be
      expect(current_node.value).to be_eql values.first
      values[1..-1].each do |value|
        current_node = current_node.next_node
        expect(current_node).to be
        expect(current_node.value).to be_eql value
      end
    end
  end
end
