require './train_manager/train_processor.rb'
require './train_manager/city_processor.rb'

$status = [
    {"Omsk" => ["Sapsan", "Emsam"]},
    {"Novosibirsk" => ["Baklan"]},
    {"Pavlodar" => []},
    {"Stavropol" => ["Svekla"]}
]

$choise_message = "Выберите необходимую процедуру:
1 - переместить поезд
2 - создать новый поезд
3 - создать новый город
4 - завершить программу"

puts
puts "Добро пожаловать в менеджер поездов."
puts

trainProcessor = TrainProcessor.new
cityProcessor = CityProcessor.new

userChoise = 0

while userChoise do
  puts "На данный момент поезда находятся в следующих городах:"
  puts
  puts $status
  puts
  puts $choise_message

  userChoise = gets.chomp.to_i

  if userChoise == 1
    trainProcessor.move_train # 1
  elsif userChoise == 2
    trainProcessor.train_creation # 2
  elsif userChoise == 3
    cityProcessor.city_creation # 3
  elsif userChoise == 4
    abort "Программа завершена."
  else
    "Вы не ввели значение или ввели неверное. Попробуйте еще раз."
  end
end






