class List
  attr_reader :head

  def initialize *args
    if args.empty?
      raise ArgumentError.new('Wrong number of arguments (0 for 1+)')
    end

    if args.count == 1 && args.first.is_a?(Array)
      args = args.first
    end

    @head = current_node = Node.new(args.first)
    args[1..-1].each do |arg|
      current_node.next_node = Node.new arg
      current_node.next_node.prev_node = current_node

      current_node = current_node.next_node
    end
  end

  def print_values
    current_node = @head

    loop do
      if current_node.last?
        p current_node.value
        break
      else
        print current_node.value.inspect, ' -> '
        current_node = current_node.next_node
      end
    end
  end

  def reversed_print
    current_node = @head
    while !current_node.last? do
      current_node = current_node.next_node
    end
    while !current_node.head? do
      print current_node.value.inspect, ' -> '
      current_node = current_node.prev_node
    end
    p current_node.value
  end

  class Node
    attr_accessor :prev_node, :next_node, :value

    def initialize(value)
      @value = value
      @prev_node = @next_node = nil
    end

    def last?
      next_node.nil?
    end

    def head?
      prev_node.nil?
    end
  end
end
