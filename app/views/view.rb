class View
    def display(array)
        array.each do |meal|
            puts "#{meal.name}"
        end
    end

    def ask_user_name
        p "What meal do you want to add?"
        gets.chomp
    end

    def ask_user_price
        p "What isd the price of meal you want to add?"
        gets.chomp
    end
end