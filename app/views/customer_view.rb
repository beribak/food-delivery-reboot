class CustomerView
    def display(array)
        array.each_with_index do |customer, index|
            puts "#{index + 1} #{customer.name}"
        end
    end

    def ask_user_customer
        p "What customer do you want to add?"
        gets.chomp
    end

    def ask_user_address
        p "What isyour address?"
        gets.chomp
    end

    def ask_for_customer
        p "Choose a customer"
        gets.chomp.to_i - 1
    end
end