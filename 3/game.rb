class Game
  class Field
    class Cell
      attr_reader :value

      def initialize value
        @value = value
      end
    end

    attr_reader :cells

    def initialize height, width, mines_count
      @cells = Array.new(height) { Array.new(width) { new Cell(:empty) } }
    end
  end

  def initialize
    @field = Field.new ask_for_field_params
    @game_over = @victory = false
    ask_for_turn until @game_over || @victory
  end

  def ask_for_field_params
    # ...
  end

  def ask_for_turn
    # ...
  end
end

Game.new
