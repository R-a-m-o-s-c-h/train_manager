class TrainProcessor
  def move_train # 1
    puts "Введите название поезда:"

    train_name = gets.chomp.to_s.downcase.capitalize
    current_index = 0

    $status.each do |value|
      city_trains = value[value.keys.join]
      train_index = city_trains.detect { |x| x == train_name }

      if train_index != nil
        if current_index + 1 == $status.length
          city_trains.delete(train_index)

          next_city_object = $status[(current_index - 1)]
          next_city_trains = next_city_object[next_city_object.keys.join]
          next_city_trains << train_name
          return
          else
          city_trains.delete(train_index)

          next_city_object = $status[(current_index + 1)]
          next_city_trains = next_city_object[next_city_object.keys.join]
          next_city_trains << train_name
          return
        end
      end
      current_index += 1
    end
  end

  def train_creation
    adding_train_name = 1

    while adding_train_name do
      puts "Введите название поезда:"
      adding_train_name = gets.chomp.to_s.downcase.capitalize

      if $status.any? {|x| x[x.keys.join].include?(adding_train_name) == true}
        puts "Такой поезд уже существует"
      else
        $status[0]["Omsk"] << adding_train_name
        return
      end
    end
  end
end