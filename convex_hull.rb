class ConvexHull
  def initialize
    @array = Array.new(9, Array.new(9))
    @coordinates = []
    @convex_hull_points = []
    @array.each_with_index do |row, index|
      rand(4).times do
        i = rand(10)
        p @array[index][i].nil?
        if @array[index][i].nil?
          @array[index][i] = "x"
          @coordinates << {x: i, y: index }
        end
      end
    end
    @coordinates = @coordinates.sort_by{|value| value[:y] }.reverse
    @current_coordinate = @coordinates.first
    @convex_hull << @current_coordinate
  end


  def find_lowest_coordinate
    #in our case this will have the highest y (e.g @array[y][x])
      @array.each_with_index do |row, y_index|
        row.each_with_index do |value, x_index|
          next unless value == "x"
          if y_index > @lowest_coordinate[:y]
            @lowest_coordinate = {x: x_index, y: y_index}
          elsif y_index == @lowest_coordinate[:y] && x_index > @lowest_coordinate[:x]
            @lowest_coordinate = {x: x_index, y: y_index}
          end
        end
      end
      p @lowest_coordinate
  end

  def turn_left
  end

  def clockwise_turn?
  end
end

  p c = ConvexHull.new
