class TrainProcessor
  def initialize(status)
    @status = status
  end

  def move_train # 1
    puts "Введите название поезда:"

    train_name = gets.chomp.to_s.downcase.capitalize

    @status.each_with_index do |value, current_index|
      city_trains = value[value.keys.first]
      train_index = city_trains.detect { |x| x[0] == train_name }

      if train_index != nil
        if current_index + 1 == @status.length
          train_index[1] = -1
          moving(train_index, city_trains, train_name, current_index)
          break
        elsif current_index == 0
          train_index[1] = 1
          moving(train_index, city_trains, train_name, current_index)
          break
        else
          moving(train_index, city_trains, train_name, current_index)
          break
        end
      end
    end
  end

  def moving(train_index, city_trains, train_name, current_index)
    city_trains.delete(train_index)

    next_city_object = @status[(current_index + train_index[1])]
    next_city_trains = next_city_object[next_city_object.keys.first]
    next_city_trains << [train_name, train_index[1]]
  end

  def train_creation
    adding_train_name = 1

    while adding_train_name do
      puts "Введите название поезда:"

      adding_train_name = gets.chomp.to_s.downcase.capitalize

      if @status.any? do |x| x[x.keys.join].include?([adding_train_name, 1]) == true ||
          x[x.keys.join].include?([adding_train_name, -1]) == true
      end
        puts "Такой поезд уже существует"
      else
        first_city_object = @status[0]
        first_city_object[first_city_object.keys.first] << [adding_train_name, 1]
        return
      end
    end
  end
end
