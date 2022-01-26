class EmployeeView
    def display(array)
        array.each_with_index do |employee, index|
            puts "#{index + 1} #{employee.username}"
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

    def ask_user_for_employee
        p "Choose a meal by the number"
        gets.chomp.to_i - 1
    end
end