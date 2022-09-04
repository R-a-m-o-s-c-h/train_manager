class CityProcessor
  def initialize(status)
    @status = status
  end

  def city_creation
    adding_city = 1

    while adding_city do
      puts "Введите название города:"
      adding_city = gets.chomp.to_s.downcase.capitalize

      if @status.any? {|x| x.include?(adding_city)} == true
        puts "Такой город уже существует"
      else
        @status.push({adding_city => []})
        return
      end
    end
  end
end
