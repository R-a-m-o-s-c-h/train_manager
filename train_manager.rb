require_relative 'train_processor.rb'
require_relative 'city_processor.rb'

class TrainManager
  CHOISE_MESSAGE = "Выберите необходимую процедуру:
  1 - переместить поезд
  2 - создать новый поезд
  3 - создать новый город
  4 - завершить программу"

  def initialize(status)
    @status = status
    @train_processor = create_train_processor
    @city_processor = create_city_processor
  end

  def call
    print_welcome

    user_choise = 0

    while user_choise do
      print_status

      user_choise = gets.chomp.to_i

      if user_choise == 1
        @train_processor.move_train # 1
      elsif user_choise == 2
        @train_processor.train_creation # 2
      elsif user_choise == 3
        @city_processor.city_creation # 3
      elsif user_choise == 4
        abort "Программа завершена."
      else
        "Вы не ввели значение или ввели неверное. Попробуйте еще раз."
      end
    end
  end

  private

  def print_welcome
    puts
    puts "Добро пожаловать в менеджер поездов."
    puts
  end

  def print_status
    puts "На данный момент поезда находятся в следующих городах:"
    puts
    puts @status
    puts
    puts CHOISE_MESSAGE
  end

  def create_train_processor
    TrainProcessor.new(@status)
  end

  def create_city_processor
    CityProcessor.new(@status)
  end
end

initial_state = [
  {"Omsk" => [["Sapsan", 1], ["Emsam", 1]]},
  {"Novosibirsk" => [["Baklan", 1]]},
  {"Pavlodar" => []},
  {"Stavropol" => [["Svekla", 1]]}
]

TrainManager.new(initial_state).call
